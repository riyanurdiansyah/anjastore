import 'package:anjastore/presentation/pages/dashboard_page.dart';
import 'package:anjastore/presentation/pages/invoice_detail_page.dart';
import 'package:anjastore/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_route_name.dart';

class AppRoute {
  static final router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: AppRouteName.welcome,
        builder: (context, state) {
          return const WelcomePage();
        },
      ),
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return Container(
            color: Colors.blue,
          );
        },
        routes: <GoRoute>[
          GoRoute(
            path: ':path',
            builder: (BuildContext context, GoRouterState state) {
              final String path = state.params['path']!;

              if (path != "home" && path != "customer" && path != "invoice") {
                return Container(
                  color: Colors.red,
                );
              }

              return DashboardPage(route: path);
            },
          )
        ],
      ),
      GoRoute(
        path: '/invoice/:id',
        builder: (BuildContext context, GoRouterState state) {
          final String id = state.params['id']!;
          return InvoiceDetailPage(id: id);
        },
      )
    ],
  );
}
