import 'package:flutterecommerceapp/Models/category_products.dart';
import 'package:flutterecommerceapp/Models/products.dart';
import 'package:flutterecommerceapp/Models/users.dart';
import 'package:dio/dio.dart';
// final categories = (response.data as List)
//     .map((e) => CategoryModel.fromMap(e))
//     .toList();

// for (var category in categories) {
// print("${category.id} → ${category.name}");
// }

class SellsRepository{
  static final Dio dio = Dio();
  static Future<List<CategoryProduct>> getCategoryProduct() async{
    try{

      final response = await dio.get("https://api.escuelajs.co/api/v1/categories");
      return  (response.data as List)
          .map((e)=> CategoryProduct.fromJson(e)).toList();

    }catch(err){
      print(err);
      throw "Something went wrong";

    }
  }


  static Future<List<Product>> getProduct({required String categoryname}) async{
    try{

      final response = await dio.get("https://api.escuelajs.co/api/v1/products/?categorySlug=${categoryname.trim()}");
      return (response.data as List)
          .map((e)=> Product.fromMap(e as Map<String,dynamic>)).toList();

    }catch(err){
      print(err);
      throw "Something went wrong";

    }
  }


  static Future<List<Product>> getSingleProduct({required String titlename}) async{

    try{
      final response = await dio.get("https://api.escuelajs.co/api/v1/products/?title=$titlename");
      return (response.data as List)
          .map((e)=> Product.fromMap(e as Map<String,dynamic>)).toList();

    }catch(err){
      print(err);
      throw "Something went wrong";

    }


  }


  static Future<List<UserModel>> getUser() async{
    try{
      final response = await dio.get("https://api.escuelajs.co/api/v1/users");
      return (response.data as List)
          .map((e)=> UserModel.fromJson(e)).toList();

    }catch(err){
      print(err);
      throw "Something went wrong";

    }
  }




}