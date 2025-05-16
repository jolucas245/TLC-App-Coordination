import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global/colors.dart';

Widget welcomeWidget(){
  return SizedBox(
    height: 100,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            "assets/image/wave.png",
          ),
        ),
        Positioned(
          top: 50,
          left: 40,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Bem-",
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.ORANGE,
                    decorationThickness: 2
                  ),
                ),
                TextSpan(
                  text: "vindo",
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}