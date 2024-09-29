import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

void initializeService() {
  FlutterBackgroundService.initialize(onStart);
}

void onStart() async {
  FlutterBackgroundService().onDataReceived.listen((event) {
    if (event!["action"] == "stopService") {
      FlutterBackgroundService().stopSelf();
    }
  });

  // Continuous SMS syncing
  while (true) {
    await syncSms();
    await Future.delayed(Duration(minutes: 1)); // Sync every minute
  }
}

Future<void> syncSms() async {
  try {
    var url = Uri.parse('https://demo.zinipay.com/sms/sync');
    String jsonBody = jsonEncode(<String, dynamic>{
      'message': "Test message now",
      'from': "+1234567890",
      'timestamp': DateTime.now().toIso8601String(),
    });

    http.Response response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonBody,
    );

    var responseBody = jsonDecode(response.body);
    if (responseBody['success'] == true) {
      print("SMS synced successfully.");
    } else {
      print("Failed to sync SMS: ${responseBody['message']}");
    }
  } on SocketException {
    print("No internet connection");
  } catch (e) {
    print("Error syncing SMS: $e");
  }
}
