import 'package:provider/provider.dart';

import '../viewmodels/auth_view_model.dart';
import '../viewmodels/home_view_model.dart';
import '../viewmodels/import_view_model.dart';
import '../viewmodels/preview_data_view_model.dart';
import '../viewmodels/splash_view_model.dart';

class AppProviders {
  static final providers = [
    ChangeNotifierProvider<SplashViewModel>(create: (_) => SplashViewModel()),
    ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
    ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
    ChangeNotifierProvider<ImportViewModel>(create: (_) => ImportViewModel()),
    ChangeNotifierProvider<PreviewDataViewModel>(create: (_) => PreviewDataViewModel()),
  ];
}