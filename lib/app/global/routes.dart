import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:tlc/app/views/coordination/coordination_view.dart';
import 'package:tlc/app/views/settings/settings_view.dart';

import '../models/cursista_model.dart';
import '../views/auth/auth_view.dart';
import '../views/home/home_view.dart';
import '../views/import/import_view.dart';
import '../views/import/preview_data_view.dart';
import '../views/splash/splash_view.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
        name: 'SplashScreen'
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => AuthView(),
        name: 'AuthView'
      ),
      GoRoute(
        path: "/home",
        builder: (context, state) => const HomeView(),
        pageBuilder: GoTransitions.slide.toLeft.call,
        name: "HomeView"
      ),
      GoRoute(
        path: "/import",
        pageBuilder: GoTransitions.slide.toLeft.call,
        builder: (context, state) => const ImportView(),
        name: "ImportView"
      ),
      GoRoute(
        path: "/preview",
        builder: (context, state) {
          final cursistas = state.extra as List<CursistaModel>?;
          return PreviewDataView(cursistas: cursistas ?? []);
        },
        name: "PreviewDataView"
      ),
      GoRoute(
        path: "/coordination",
        pageBuilder: GoTransitions.slide.toLeft.call,
        builder: (context, state) => const CoordinationView(),
        name: "CoordinationView"
      ),
      GoRoute(
        path: "/settings",
        pageBuilder: GoTransitions.slide.toLeft.call,
        builder: (context, state) => const SettingsView(),
        name: "SettingsView"
      ),
    ]
  );
}
