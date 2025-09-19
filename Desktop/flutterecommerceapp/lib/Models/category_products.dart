// "id": 38,
// "name": "Cloths",
// "slug": "cloths",
// "image": "https://i.imgur.com/QkIa5tT.jpeg",
// "creationAt": "2025-09-11T04:26:40.000Z",
// "updatedAt": "2025-09-11T10:09:34.000Z"

class CategoryProduct{
  final int id;
  final String name;
  final String slug;
  final String image;
  final String creationAt;
  final String updatedAt;


  CategoryProduct({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });
  factory CategoryProduct.fromJson(Map<String,dynamic> json){
    return CategoryProduct(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        slug: json['slug'] ?? '',
        image: json['image'] ?? '',
        creationAt:json[' creationAt'] ?? '',
        updatedAt: json['updatedAt'] ?? ''
    );

  }

  factory CategoryProduct.empty(){
    return CategoryProduct(id: 0, name: 'empty', slug: 'empty', image:'empty', creationAt:'empty', updatedAt: 'empty');
  }

}
