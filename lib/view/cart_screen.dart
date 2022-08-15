import 'package:flutter/material.dart';
import 'package:product_app/models/product_model.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  List<Products>? products;
  List<TextEditingController> quantity;
  List? color;
  List? brand;

  CartScreen(
      {Key? key,
      required this.products,
      required this.brand,
      required this.color,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Order Summery"),
        ),
        body: ListView.builder(
            itemCount: products!.length,
            itemBuilder: ((context, index) {
              var totalPrice = quantity[index].text.isEmpty
                  ? "00"
                  : (int.tryParse(quantity[index].text)! *
                      (double.parse(products![index].price.toString())));
              return Card(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            height: 10.h,
                            width: 10.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey,
                            ),
                            child: Image.network(
                              products![index].picture.toString(),
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                    child: Text(
                                  "Not Available",
                                  style: TextStyle(fontSize: 8.sp),
                                ));
                              },
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 3.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products![index].productName.toString(),
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        Text(
                          " Selected Quantity : ${quantity[index].text.isEmpty ? "--" : quantity[index].text}",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        Text(
                          "Selected Color: ${color![index] ?? "--"}",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        Text(
                          "Selected Brand : ${brand![index] ?? "--"}",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        Text(
                          "Total Price :$totalPrice",
                          style: TextStyle(fontSize: 12.sp),
                        )
                      ],
                    )
                  ],
                ),
              );
            })));
  }
}
