import 'package:flutterecommerceapp/Models/category_products.dart';
import 'package:flutterecommerceapp/Models/products.dart';
import 'package:flutterecommerceapp/Models/users.dart';
import 'package:flutterecommerceapp/Repository/sell_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryproductprovider = FutureProvider<List<CategoryProduct>>((ref){
  return SellsRepository.getCategoryProduct();
});

final productsprovider = FutureProvider.family<List<Product>,String>((ref,categoryname){
  return SellsRepository.getProduct(categoryname: categoryname);

});

final filterproductsprovider = FutureProvider.family<List<Product>,String>((ref,titlename){
  return SellsRepository.getSingleProduct(titlename: titlename);

});

final userprovider = FutureProvider<List<UserModel>>((ref){
  return SellsRepository.getUser();

});

