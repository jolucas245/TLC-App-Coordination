import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late TextEditingController recoveryPasswordController;

  AuthViewModel() {
    recoveryPasswordController = TextEditingController();
    emailController.addListener(() => recoveryPasswordController.text = emailController.text);
  }

  bool _isPasswordVisibility = true;
  bool _isEmailValidated = false;
  bool _isPasswordValidated = false;

  bool get isPasswordVisibility => _isPasswordVisibility;
  bool get isEmailValidated => _isEmailValidated;
  bool get isPasswordValidated => _isPasswordValidated;

  void togglePasswordVisibility(){
    _isPasswordVisibility = !_isPasswordVisibility;
    notifyListeners();
  }

  void setEmailValidated(bool value){
    _isEmailValidated = value;
    notifyListeners();
  }
  
  void setPasswordValidated(bool value){
    _isPasswordValidated = value;
    notifyListeners();
  }

  String? validateEmail(String? value){
    if(value == null || !value.contains("@")){
      return "Insira um e-mail válido";
    }
    return null;
  }

  String? validatePassword(String? value){
    if(value != null && value.length < 6 ){
      return "A senha deve ter mais de 5 caracteres";
    }
    return null;
  }

  bool areFieldsFilled(){
    return emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}