import 'package:flutter/material.dart';
class AppModel {
  final String name, image, description, category;
  final double rating;
  final int review, price;
  List<Color> fcolor;
  List<String> size;
  bool isCheck;

  AppModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.price,
    required this.review,
    required this.fcolor,
    required this.size,
    required this.description,
    required this.isCheck,
    required this.category,

  });
  static const myDescription1 ="Elevate your casual wardrobe with our";
  static const myDescription2 = ". Crafted from premium "
      "cotton for maximum comfoet, this relaxed-fit tee features";



}
   List<AppModel> fashionEcommerceApp =[
    // id :1
    AppModel(name: "OverSized Fit Printed Mesh T-shirt",

        image: "assets/logo.webp", rating: 4.9, price: 295, review: 136,
        fcolor:[
        Colors.black,
        Colors.blue,
        Colors.blue[100]!
        ]
        , size: ["XS",
        "S","M",], description: "", isCheck: true, category: "Women"),

    // id :1
    AppModel(name: "OverSized Fit Printed Mesh T-shirt",

        image: "assets/logo.webp", rating: 4.9, price: 295, review: 136,
        fcolor:[
          Colors.black,
          Colors.blue,
          Colors.blue[100]!
        ]
        , size: ["XS",
          "S","M",], description: "", isCheck: true, category: "Women"),

    // id :1
    AppModel(name: "OverSized Fit Printed Mesh T-shirt",

        image: "assets/logo.webp", rating: 4.9, price: 295, review: 136,
        fcolor:[
          Colors.black,
          Colors.blue,
          Colors.blue[100]!
        ]
        , size: ["XS",
          "S","M",], description: "", isCheck: true, category: "Women"),


  ];

  
