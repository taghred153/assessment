import 'package:assessment/providers/product_provider.dart';
import 'package:assessment/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
      ),
      body: Consumer <ProductProvider>(
        builder: (context, value, child){
          var modelofproduct = value.productmodelnew;
          if(modelofproduct == null)
            {
              value.GetData();
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          else{
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 2.7
              ),
              itemBuilder:(context, index) {
                var product = modelofproduct.productss[index];
                return ProductWidget(
                    image:product['image']?? "Not Found Image",
                    name: product['name'],
                    price: product['price'],
                    description: product['description']
              );
              },
              itemCount: modelofproduct.productss.length,
            );
          }
        },
      ),
    );
  }
}
