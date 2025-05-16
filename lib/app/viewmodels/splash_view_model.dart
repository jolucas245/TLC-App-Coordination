import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewModel extends ChangeNotifier {
  late final AnimationController controller;
  
  void initController(TickerProvider vsync, BuildContext context){
    controller = AnimationController(
      vsync: vsync, 
      duration: const Duration(seconds: 3)
    );

    controller.addStatusListener((status) async { 
      if(status == AnimationStatus.completed){
        await Future.delayed(const Duration(seconds: 1));
        if (context.mounted) context.go("/auth");
      }
    });

    controller.forward();
  }

  void disposeController(){
    controller.dispose();
  }
}