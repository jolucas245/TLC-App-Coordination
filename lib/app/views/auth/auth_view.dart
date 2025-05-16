import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tlc/app/views/auth/widgets/modal_recovery_widget.dart';
import 'package:tlc/app/views/auth/widgets/snackbar_widget.dart';
import 'package:tlc/app/views/auth/widgets/welcome_widget.dart';

import '../../global/colors.dart';
import '../../viewmodels/auth_view_model.dart';
import 'widgets/header_widget.dart';

class AuthView extends StatelessWidget {
  AuthView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final controller = context.watch<AuthViewModel>();

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              headerWidget(context),
              welcomeWidget(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                width: double.infinity,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          label: Text(
                            "E-mail",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.DARK_BROWN
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: AppColors.ORANGE
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.ORANGE,
                              width: 1.5
                            )
                          )
                        ),
                        autovalidateMode: controller.isEmailValidated ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                        validator: (value) => controller.validateEmail(value)
                      ),
                      SizedBox(height: 30,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => modalRecoveryWidget(
                            context,
                            controller: controller.recoveryPasswordController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) => controller.validateEmail(value),
                            onPressed: (){
                              FocusScope.of(context).unfocus();
                              context.pop();
                              snackbarWidget("Link de redefinição de senha enviado", context);
                              debugPrint(controller.recoveryPasswordController.text);
                            }
                          ),
                          child: Text(
                            "Esqueceu sua senha?",
                            style: TextStyle(
                              color: AppColors.ORANGE,
                              fontWeight: FontWeight.w900
                            ),
                          ),
                        )
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          label: Text(
                            "Senha",
                            style: TextStyle(
                              color: AppColors.DARK_BROWN,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: AppColors.ORANGE
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.ORANGE,
                              width: 1.5
                            )
                          ),
                          suffixIcon: IconButton(
                            onPressed: controller.togglePasswordVisibility, 
                            icon: controller.isPasswordVisibility ? Icon(Icons.visibility_off_rounded) : Icon(Icons.visibility_rounded, color: AppColors.ORANGE)
                          ),
                        ),
                        obscureText: controller.isPasswordVisibility,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r"\s")),
                        ],
                        autovalidateMode: controller.isPasswordValidated ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                        validator: (value) => controller.validatePassword(value),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    backgroundColor: AppColors.DARK_BROWN,
                    elevation: 10
                  ),
                  onPressed: (){
                    if(!controller.areFieldsFilled()){
                      snackbarWidget("Preencha todos os campos", context);
                      return;
                    }
                    controller.setEmailValidated(true);
                    controller.setPasswordValidated(true);

                    if(_formKey.currentState!.validate()){
                      context.go("/home");
                    }
                  }, 
                  child: Text(
                    "Acessar", 
                    style: TextStyle(
                      color: AppColors.CREAM, 
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  )
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}