import 'package:assessment/models/products_model.dart';
import 'package:dio/dio.dart';

class ProductService{
static Dio dio = Dio();
static Future<ProductModel> getdata() async{
  try{
    Response response = await dio.get('https://student.valuxapps.com/api/home');
    if(response.statusCode == 200)
      {
        return ProductModel.fromjson(response.data);
      }
    else{
      throw Exception('Error');
    }
  }catch(e){
    throw Exception('Error: $e');
  }
}
}