import 'package:flutter/material.dart';

import '../../../global/colors.dart';

Future modalRecoveryWidget(
  BuildContext context, 
  {
    TextEditingController? controller,
    AutovalidateMode? autovalidateMode,
    FormFieldValidator? validator,
    VoidCallback? onPressed,
  }
){
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Recuperar senha",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Email",
              labelStyle: TextStyle(
                color: AppColors.ORANGE,
              ),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.ORANGE,
                  width: 1.5,
                ),
              ),
            ),
            autovalidateMode: autovalidateMode,
            validator: validator,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              backgroundColor: AppColors.DARK_BROWN,
              elevation: 10
            ),
            child: Text(
              "Enviar",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    ),
  );
}