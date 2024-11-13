import 'package:assessment/screens/details_screen.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String image;
  final String name;
  final dynamic price;
  final String description;
  ProductWidget ({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(image:image,name:name,description:description)));
      },
      child: Card(
      elevation: 12,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(image),
          SizedBox(height: 2),
          Text(name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                  ,fontSize: 15,
              )),
          SizedBox(height: 2),
          Text('$price' as String,
              style: TextStyle(
                  color: Colors.grey
              )),
        ],
      ),
      )
    );
  }
}
