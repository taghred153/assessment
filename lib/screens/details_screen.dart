import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {

  final String image;
  final String name;
  final String description;

  const DetailsScreen({
    super.key,
    required this.image,
    required this.name,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            elevation: 12,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
                padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(image),
                  SizedBox(height: 15),
                  Text(name),
                  Text(description),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
