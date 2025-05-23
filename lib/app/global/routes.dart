
import 'package:go_router/go_router.dart';
import 'package:tlc/app/models/cursista_model.dart';
import 'package:tlc/app/views/import/widgets/preview_data_view.dart';

import '../views/auth/auth_view.dart';
import '../views/home/home_view.dart';
import '../views/import/import_view.dart';
import '../views/splash/splash_view.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/import',
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
        builder: (context, state) => HomeView(),
        name: "HomeView"
      ),
      GoRoute(
        path: "/import",
        builder: (context, state) => ImportView(),
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
    ]
  );
}