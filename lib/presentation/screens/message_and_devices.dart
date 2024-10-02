import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/devices/devices_cubit.dart';
import '../cubits/sms/sms_cubit.dart';

class MessageAndDevices extends StatefulWidget {
  const MessageAndDevices({super.key});

  @override
  State<MessageAndDevices> createState() => _MessageAndDevicesState();
}

class _MessageAndDevicesState extends State<MessageAndDevices> {
  late DevicesCubit cubit;
  late SmsCubit smsCubit;

  @override
  void initState() {
    cubit = BlocProvider.of<DevicesCubit>(context);
    smsCubit = BlocProvider.of<SmsCubit>(context);
    cubit.getDeviceList();
    smsCubit.getSmsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages & Devices'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.grey[200], // Background color for contrast
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header for Devices
            Text(
              "Devices",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10), // Space between header and list

            // List of Devices
            Expanded(
              child: BlocBuilder<DevicesCubit, DevicesState>(
                builder: (context, state) {
                  if (state is DeviceLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is DeviceError) {
                    return Center(child: Text(state.errorMessage));
                  } else if (state is DeviceFetched) {
                    return ListView.separated(
                      itemCount: state.devicesList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            title: Text(
                              state.devicesList[index].email ?? "",
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle:  Column(
                              children: [
                                Text(state.devicesList[index].deviceName ?? ""),
                                Text(state.devicesList[index].deviceModel ?? ""),
                                Text(state.devicesList[index].apiKey ?? ""),
                                Text(state.devicesList[index].id ?? ""),
                              ],
                            ),
                            trailing: const Icon(Icons.device_unknown),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                      const Divider(height: 0),
                    );
                  }
                  return Container(); // Default case
                },
              ),
            ),

            // Header for Messages
            Text(
              "Messages",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10), // Space between header and list

            // List of SMS Messages
            Expanded(
              child: BlocBuilder<SmsCubit, SmsState>(
                builder: (context, state) {
                  if (state is smsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is smsError) {
                    return Center(child: Text(state.errorMessage));
                  } else if (state is smsFetched) {
                    return ListView.separated(
                      itemCount: state.smsList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            title: Text(
                              state.smsList[index].message ?? "",
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              children: [
                                Text(state.smsList[index].id ?? ""),
                                Text(state.smsList[index].from ?? ""),
                                Text(state.smsList[index].time ?? ""),
                              ],
                            ),
                            trailing: const Icon(Icons.message),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                      const Divider(height: 0),
                    );
                  }
                  return Container(); // Default case
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
