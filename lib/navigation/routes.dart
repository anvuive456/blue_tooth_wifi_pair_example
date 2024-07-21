import 'package:blue_tooth_wifi_pair_example/screens/main_screen.dart';
import 'package:blue_tooth_wifi_pair_example/screens/show_qr_screen.dart';
import 'package:blue_tooth_wifi_pair_example/screens/scan_qr_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _mainKey = GlobalKey<NavigatorState>();
final routes = GoRouter(
  navigatorKey: _mainKey,
  initialLocation: '/scan_qr',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) {
        return MainScreen(shell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/scan_qr',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ScanQrScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/receive_qr',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ShowQrScreen(),
              ),
            ),
          ],
        ),
      ],
    )
  ],
);
