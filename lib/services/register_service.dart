import 'package:assessment/models/register_model.dart';
import 'package:dio/dio.dart';

class RegisterService{
  static Dio dio = Dio();
  static adddata (String name, String phone, String email, String password) async{
    try {
      Response response =
      await dio.post('https://student.valuxapps.com/api/register',
          data: {
            name: name,
            phone: phone,
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