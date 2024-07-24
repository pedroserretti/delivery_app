import 'dart:convert';

class ProductModel {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  factory ProductModel.fromMap(Map<dynamic, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      imageUrl: map['imageUrl'] as String,
    );
  }

  // factory ProductModel.fromFirestore(DocumentSnapshot doc) {
  //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //   return ProductModel(
  //     id: doc.id,
  //     name: data['title'] ?? '',
  //     description: data['description'] ?? '',
  //     price: (data['price'] ?? 0).toDouble(),
  //     imageUrl: data['imageUrl'] ?? '',
  //   );
  // }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

}
