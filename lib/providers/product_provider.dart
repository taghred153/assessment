import 'package:assessment/models/products_model.dart';
import 'package:assessment/services/proudcts_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier{
  ProductModel? productmodelnew;
  GetData() async{
    productmodelnew = await ProductService.getdata();
    notifyListeners();
  }
}