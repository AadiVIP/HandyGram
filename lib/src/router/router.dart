import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:handygram/src/pages/proxy/list/proxy_list.dart';
import 'package:handygram/src/pages/proxy/single/proxy.dart';
import 'package:handygram/src/pages/setup/setup.dart';
import 'package:handygram/src/pages/setup/stages/authorization/authorization.dart';
import 'package:handygram/src/pages/bootstrap/bootstrap.dart';
import 'package:handygram/src/pages/home/home.dart';
import 'package:handygram/src/pages/setup/stages/instruction.dart';

Page _addSwipeToBack(GoRouterState state, Widget child) => CupertinoPage(
      child: child,
      key: state.pageKey,
    );

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          _addSwipeToBack(state, const BootstrapPage()),
      routes: [
        GoRoute(
          path: 'authorization',
          pageBuilder: (context, state) =>
              _addSwipeToBack(state, const AuthorizationPage()),
        ),
        GoRoute(
          path: "proxy",
          pageBuilder: (context, state) => _addSwipeToBack(
              state,
              ProxyPage(
                id: state.uri.queryParameters["id"] != null
                    ? int.parse(state.uri.queryParameters["id"]!)
                    : null,
              )),
        ),
        GoRoute(
          path: "proxy_list",
          pageBuilder: (context, state) =>
              _addSwipeToBack(state, const ProxyListPage()),
        ),
        GoRoute(
          path: "home",
          pageBuilder: (context, state) =>
              _addSwipeToBack(state, const HomePage()),
        ),
        GoRoute(
          path: "setup",
          pageBuilder: (context, state) =>
              _addSwipeToBack(state, const SetupPage()),
          routes: [
            GoRoute(
              path: "qr_instruction",
              pageBuilder: (context, state) =>
                  _addSwipeToBack(state, const QrInstructionPage()),
            )
          ],
        ),
      ],
    ),
  ],
  initialLocation: '/',
);