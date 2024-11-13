import 'package:assessment/models/register_model.dart';
import 'package:dio/dio.dart';

class LoginService{
  static Dio dio = Dio();
  static adddata (String email, String password) async{
    try {
      Response response =
      await dio.post('https://student.valuxapps.com/api/login',
          data: {
            email: email,
            password: password,
          }
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return RegisterModel.fromjson(response.data);
      }
      else {
        throw Exception('Error');
      }
    }catch (e)
    {
      throw Exception('Error $e');
    }
  }
}