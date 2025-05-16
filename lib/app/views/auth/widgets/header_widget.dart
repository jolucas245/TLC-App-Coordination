import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global/colors.dart';
import '../../../global/custom_icon.dart';

Widget headerWidget(BuildContext context){
  return Container(
    height: 350,
    width: MediaQuery.of(context).size.width,
    color: AppColors.ORANGE,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          CustomIcons.guadalupe,
          color: Colors.white,
          size: 150,
        ),
        Text(
          "TLC",
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.bold,
            fontSize: 42,
            color: Colors.white
          ),
        ),
        Text(
          "Treinamento de Liderança Cristã",
          style: GoogleFonts.raleway(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white
          ),
        ),
      ],
    ),
  );
}