import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({super.key});

  @override
  State<ScanQrScreen> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  final MobileScannerController controller = MobileScannerController(
    autoStart: false,
  );



  @override
  void initState() {
    controller.barcodes.listen((event) {
     final id = event.barcodes.firstOrNull?.displayValue;
     if(id != null) {
       var device = BluetoothDevice.fromId(id);
       device.connect();
     }
    });
    controller.start();
    FlutterBluePlus.onScanResults.listen((results) {
      if (results.isNotEmpty) {
        print(results.map((e) => e.device.remoteId));
      }
    },
      onError: (e) => print(e),
    );
    FlutterBluePlus.startScan();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox.square(
          dimension: 350,
          child: MobileScanner(
            controller: controller,
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile();
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
