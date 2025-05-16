import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackbarWidget(String text, BuildContext context){
  return ScaffoldMessenger.of(context).showSnackBar(
    snackBarAnimationStyle: AnimationStyle(
      curve: Curves.linear,
      duration: Duration(seconds: 1),
    ),
    SnackBar(
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      content: Text(text)
    )
  );
}