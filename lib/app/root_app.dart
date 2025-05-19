import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tlc/app/global/providers.dart';
import 'package:tlc/app/global/routes.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp.router(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            surfaceTintColor: Colors.transparent
          ),
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme
          )
        ),
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        title: "TLC Alterosa",
      ),
      
    );
  }
}