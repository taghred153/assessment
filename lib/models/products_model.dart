class ProductModel{
  List<dynamic> productss;
  ProductModel({required this.productss});
  factory ProductModel.fromjson(Map json)
  {
    return ProductModel(
        productss: json['data']['products']
    );
  }
}