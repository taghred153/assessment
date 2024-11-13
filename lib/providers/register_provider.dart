import 'package:assessment/models/register_model.dart';
import 'package:assessment/services/register_service.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier{
  RegisterModel? registerrrmodel;
  AddData(name, phone, email, password) async{
    registerrrmodel =
    await RegisterService.adddata(name, phone, email, password);
    notifyListeners();
  }
}