class RegisterModel{
  List<dynamic> dataa;
  RegisterModel({required this.dataa});
  factory RegisterModel.fromjson(Map<String, dynamic> json){
    return RegisterModel(
        dataa: json['status']['data']
    );
  }
}