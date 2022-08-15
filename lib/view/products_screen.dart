// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:product_app/view/widgets/product_card.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../controller/products_controller.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsController()..init(),
      child: const ProductsConsumerScreen(),
    );
  }
}

class ProductsConsumerScreen extends StatelessWidget {
  const ProductsConsumerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsController>(builder: (_, controller, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Product List"),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: false,
                itemCount: controller.productsList.length,
                itemBuilder: (context, index) {
                  return ProductContainer(
                    index: index,
                    selectedColor: controller.selectedColor,
                    quantity: controller.textController[index],
                    selectedBrand: controller.selectedBrand,
                    products: controller.productsList[index],
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                controller.navigateToCart(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    border: Border.all(color: Colors.black)),
                height: 6.h,
                width: 20.h,
                child: Center(
                    child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 13.sp),
                )),
              ),
            )
          ],
        ),
      );
    });
  }
}
