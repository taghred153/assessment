import 'package:assessment/models/register_model.dart';
import 'package:assessment/services/login_service.dart';
import 'package:assessment/services/register_service.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{
  RegisterModel? registerrrmodel;
  AddData(String email, String password) async{
    registerrrmodel =
    await LoginService.adddata(email, password);
    notifyListeners();
  }
}