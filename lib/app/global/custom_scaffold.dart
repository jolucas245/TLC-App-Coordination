import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:tlc/app/global/custom_appbar.dart';

class CustomScaffold extends StatelessWidget {

  final String title;
  final Widget body;
  final String? page;

  CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.page
  });


  @override
  Widget build(BuildContext context) {

    final isPreview = page == 'preview';
    final AdvancedDrawerController? _drawerController = isPreview ? null : AdvancedDrawerController();

    final appBar = CustomAppbar(
      title: title,
      page: page,
      controller: _drawerController,
    );

    final scaffold = Scaffold(
      backgroundColor: const Color(0xffF9FAFB),
      appBar: appBar,
      body: body,
    );

    if(isPreview){
      return scaffold;
    }

    return AdvancedDrawer(
       controller: _drawerController,
      animationCurve: Curves.linear,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      openRatio: 0.65,
      openScale: 1,
      drawer: Drawer(),
      child: scaffold
    );
  }
}