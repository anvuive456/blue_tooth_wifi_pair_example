import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell shell;

  const MainScreen(
    this.shell, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: shell.currentIndex,
        onTap: (value) {
          shell.goBranch(
            value,
            initialLocation: value == shell.currentIndex,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code_scanner,
            ),
            label: 'Quét QR',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code,
              ),
              label: 'Nhận QR')
        ],
      ),
      body: shell,
    );
  }
}
