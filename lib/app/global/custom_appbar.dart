import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:tlc/app/global/colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  
  final String title;
  final String? page;
  final AdvancedDrawerController? controller;
  
  const CustomAppbar({
    super.key,
    required this.title,
    this.page,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.ORANGE,
      elevation: 1.5,
      shadowColor: Colors.grey[100],
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ), 
      ),
      leading: page == 'preview' 
      ? IconButton(
        onPressed: () => context.pop(), 
        icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,)
      ) 
      : Builder(
        builder: (context) => IconButton(
          onPressed: () => controller!.showDrawer(),
          icon: Icon(Icons.menu_rounded, color: Colors.white),
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}