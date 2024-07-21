import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ShowQrScreen extends StatefulWidget {
  const ShowQrScreen({super.key});

  @override
  State<ShowQrScreen> createState() => _ShowQrScreenState();
}

class _ShowQrScreenState extends State<ShowQrScreen> {
  String deviceId = '';

  @override
  void initState() {
    _getInfo();
    super.initState();
  }

  void _getInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    setState(() {
      switch (deviceInfo) {
        case IosDeviceInfo(identifierForVendor: String id):
          deviceId = id;
          break;
        case AndroidDeviceInfo(id: String id):
          deviceId = id;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Device id: $deviceId'),
        QrImageView(
          data: deviceId,
          version: QrVersions.auto,
          size: 320,
          gapless: false,
        )
      ],
    );
  }
}
