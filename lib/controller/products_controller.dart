// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:product_app/models/product_model.dart';
import 'package:product_app/repository/product_repository.dart';
import 'package:product_app/view/cart_screen.dart';

class ProductsController extends ChangeNotifier {
  final ProductsRepository productsRepository = IProductsRepository();

  Future init() async {
    textController.clear();
    getAllProducts();
  }

// All Controllers And List
  List<TextEditingController> textController = [];
  List selectedColor = [];
  List selectedBrand = [];
  List<Products> productsList = [];

//Get Data Here
  Future getAllProducts() async {
    productsList = await productsRepository.getAllProducts();
    if (productsList.isNotEmpty) {
      // ignore: avoid_function_literals_in_foreach_calls
      productsList.forEach((Products products) {
        var textEditingController = TextEditingController();
        var selectBrand;
        var selectColor;
        selectedColor.add(selectColor);
        selectedBrand.add(selectBrand);
        textController.add(textEditingController);
      });
    }
    notifyListeners();
  }

//Navigation
  void navigateToCart(context) {
    try {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CartScreen(
                    products: productsList,
                    brand: selectedBrand,
                    color: selectedColor,
                    quantity: textController,
                  )));
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
