import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portafolio_flutter/screens/home_screen.dart';
import 'package:portafolio_flutter/screens/web_view.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/web_view',
      builder: (context, state) {
        // Capturar parámetros
        final url = state.uri.queryParameters['url'] ??
            'https://www.linkedin.com/in/franco-galbiati/';
        final title = state.uri.queryParameters['title'] ?? '';

        return WebViewScreen(
          url: url,
          title: title,
        );
      },
    ),
  ],
);
