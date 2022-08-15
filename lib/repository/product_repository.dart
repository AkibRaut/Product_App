import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:product_app/models/product_model.dart';

abstract class ProductsRepository {
  Future<List<Products>> getAllProducts();
}

class IProductsRepository extends ProductsRepository {
  @override
  Future<List<Products>> getAllProducts() async {
    try {
      String products = await rootBundle.loadString('assets/Products.json');
      List data = json.decode(products);
      return data.map((e) => Products.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
