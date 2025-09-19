// // product_model.dart
// // Generated Dart data model for the product JSON you provided.
//
// import 'dart:convert';
//
// class Product {
//   final int id;
//   final String title;
//   final String slug;
//   final int price;
//   final String description;
//   final Category category;
//   final String images;
//   final DateTime creationAt;
//   final DateTime updatedAt;
//
//   Product({
//     required this.id,
//     required this.title,
//     required this.slug,
//     required this.price,
//     required this.description,
//     required this.category,
//     required this.images,
//     required this.creationAt,
//     required this.updatedAt,
//   });
//
//   factory Product.fromMap(Map<String, dynamic> map) {
//     return Product(
//       id: map['id'] as int,
//       title: map['title'] as String,
//       slug: map['slug'] as String,
//       price: map['price'] is int ? map['price'] as int : int.parse(map['price'].toString()),
//       description: map['description'] as String,
//       category: Category.fromMap(map['category'] as Map<String, dynamic>),
//       images: map['images'] as String,
//       creationAt: DateTime.parse(map['creationAt'] as String),
//       updatedAt: DateTime.parse(map['updatedAt'] as String),
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'title': title,
//       'slug': slug,
//       'price': price,
//       'description': description,
//       'category': category.toMap(),
//       'images': images,
//       'creationAt': creationAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//     };
//   }
//
//   factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
//   String toJson() => json.encode(toMap());
//
//   @override
//   String toString() {
//     return 'Product(id: \$id, title: \$title, price: \$price)';
//   }
// }
//
// class Category {
//   final int id;
//   final String name;
//   final String slug;
//   final String image;
//   final DateTime creationAt;
//   final DateTime updatedAt;
//
//   Category({
//     required this.id,
//     required this.name,
//     required this.slug,
//     required this.image,
//     required this.creationAt,
//     required this.updatedAt,
//   });
//
//   factory Category.fromMap(Map<String, dynamic> map) {
//     return Category(
//       id: map['id'] as int,
//       name: map['name'] as String,
//       slug: map['slug'] as String,
//       image: map['image'] as String,
//       creationAt: DateTime.parse(map['creationAt'] as String),
//       updatedAt: DateTime.parse(map['updatedAt'] as String),
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'slug': slug,
//       'image': image,
//       'creationAt': creationAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//     };
//   }
//
//   @override
//   String toString() => 'Category(id: \$id, name: \$name)';
// }
//
// // Helper to parse a JSON array of products
// List<Product> productsFromJsonArray(String jsonArray) {
//   final List<dynamic> decoded = json.decode(jsonArray) as List<dynamic>;
//   return decoded.map((e) => Product.fromMap(e as Map<String, dynamic>)).toList();
// }
//
// // Example usage (copy into your project):
// //
// // final jsonString = '[{...}, {...}]';
// // final products = productsFromJsonArray(jsonString);
// // print(products[0].title);
//
// // If you prefer code generation (json_serializable / freezed), I can provide that version too.


// products.dart
import 'dart:convert';

class Product {
  final int id;
  final String title;
  final String slug;
  final int price;
  final String description;
  final Category category;
  final List<String> images;
  final DateTime creationAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      slug: map['slug'] ?? '',
      price: map['price'] ?? 0,
      description: map['description'] ?? '',
      category: Category.fromMap(map['category']),
      images: map['images'] != null
          ? (map['images'] is List
          ? List<String>.from(
          map['images'].map((img) => img is String ? img : img['url']))
          : [map['images'].toString()])
          : [],

      creationAt: DateTime.parse(map['creationAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'price': price,
      'description': description,
      'category': category.toMap(),
      'images': images,
      'creationAt': creationAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Product(id: $id, title: $title, price: $price)';
}

class Category {
  final int id;
  final String name;
  final String slug;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
      image: map['image'] ?? '',
      creationAt: DateTime.parse(map['creationAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'image': image,
      'creationAt': creationAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  @override
  String toString() => 'Category(id: $id, name: $name)';
}

// Helper function to parse a JSON array of products
List<Product> productsFromJsonArray(String jsonArray) {
  final List<dynamic> decoded = json.decode(jsonArray);
  return decoded.map((e) => Product.fromMap(e)).toList();
}

// Example usage:
// final jsonString = '[{...}, {...}]';
// final products = productsFromJsonArray(jsonString);
// print(products[0].title);
