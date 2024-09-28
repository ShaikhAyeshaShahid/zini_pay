import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:zini_pay/domain/entities/AuthModel.dart';
import 'package:zini_pay/domain/repositories/zini_pay_repository.dart';

import '../constants/logger.dart';

class ZiniPayRepositoryImplementation implements ZiniPayRepository {
  final baseUrl = 'https://demo.zinipay.com';

  var headers = <String, String>{
    "Content-Type": "application/json",
  };

  String noInternetConnectivityMsg =
      'Please check your internet connection  and try again.';

  @override
  Future<AuthModel> login(String email, String apiKey) async {
    try {
      var url = Uri.parse('$baseUrl/app/auth');
      LogManager.info('repository::login::url = $url');

      String jsonBody = jsonEncode(<String, dynamic>{
        'email': email,
        'apiKey': apiKey,
      });

      LogManager.info('repository::login::body = $jsonBody');

      // try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonBody,
      );

      var responseBody = jsonDecode(response.body);
      LogManager.debug("repository::login::responseBody: $responseBody\n");
      log("repository::login::responseBody: $responseBody\n");

      if (responseBody['success'] == true &&
          responseBody['statusCode'] == 200) {
        return responseBody['message'];
      }else {
        throw Exception(responseBody['message']);
      }
    } on SocketException catch (e) {
      throw Exception(noInternetConnectivityMsg);
    } on Exception catch (e) {
      LogManager.error('repository::login::exception =', e);
      throw Exception(e.toString().substring(11));
    }
  }
}
