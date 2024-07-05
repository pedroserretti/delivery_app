// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/models/product_model.dart';
import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import './products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final CollectionReference _productsCollection = FirebaseFirestore.instance.collection('products');
  // ProductsRepositoryImpl({
  //   required this._productsCollection
  // });

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      QuerySnapshot snapshot = await _productsCollection.get();
      final products = snapshot.docs.map((doc) => ProductModel.fromFirestore(doc)).toList();
      return products;
    } on DioError catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar produtos');
    }
  }
}
