import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:tlc/app/extension/go_router_extension.dart';
import 'package:tlc/app/global/colors.dart';

import 'custom_appbar.dart';


class CustomScaffold extends StatelessWidget {

  final String title;
  final Widget body;
  final String? page;

  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.page
  });

  @override
  Widget build(BuildContext context) {

    final isPreview = page == 'preview';
    final AdvancedDrawerController? drawerController = isPreview ? null : AdvancedDrawerController();

    final appBar = CustomAppbar(
      title: title,
      page: page,
      controller: drawerController,
    );

    final scaffold = Scaffold(
      backgroundColor: const Color(0xffF9FAFB),
      appBar: appBar,
      body: body,
    );

    if (isPreview) {
      return scaffold;
    } else {

      final currentPath = GoRouter.of(context).currentRouteName;
      debugPrint(currentPath);

      return AdvancedDrawer(
      controller: drawerController,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      openRatio: 0.65,
      openScale: 1,
      initialDrawerScale: 1,
      drawer: Drawer(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/image/header_drawer.jpg"),
                  ),
                  SizedBox(height: 20,),
                  Text("John Doe", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                  Text("john_doe@gmail.com", style: TextStyle(fontSize: 14, color: Colors.grey),)
                ],
              )
            ),
          ),
          menuItem(
            context: context, 
            currentPath: currentPath, 
            title: "Cursista", 
            icon: Icons.person, 
            path: '/home'
          ),
          menuItem(
            context: context, 
            currentPath: currentPath, 
            title: "Importar Arquivo", 
            icon: Icons.file_upload_outlined, 
            path: '/import'
          ),
          menuItem(
            context: context, 
            currentPath: currentPath, 
            title: "Coordenação", 
            icon: Icons.admin_panel_settings_rounded, 
            path: '/coordination'
          ),
          menuItem(
            context: context, 
            currentPath: currentPath, 
            title: "Configurações", 
            icon: Icons.settings, 
            path: '/settings'
          ),
          menuItem(
            context: context, 
            currentPath: currentPath, 
            title: "Sair", 
            icon: Icons.logout_outlined, 
            path: '/auth'
          ),
        ],
      ),
      ),
      child: scaffold
    );
    }
  }
}

Widget menuItem({
    required BuildContext context,
    required String? currentPath,
    required String title,
    required IconData icon,
    required String path
}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: ListTile(
      minTileHeight: 20,
      iconColor: currentPath == path ? AppColors.ORANGE : Colors.grey,
      minVerticalPadding: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      splashColor: AppColors.ORANGE.withAlpha(50),
      title: Text(
        title,
        style: TextStyle(
          color: currentPath == path ? AppColors.ORANGE : Colors.grey.shade700,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
      leading: Icon(icon),
      tileColor: currentPath == path ? AppColors.ORANGE.withAlpha(50) : null,
      onTap: () => context.go(path),
    ),
  );
}