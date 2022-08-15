// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:product_app/models/product_model.dart';
import 'package:product_app/view/widgets/dropdown.dart';
import 'package:sizer/sizer.dart';

class ProductContainer extends StatelessWidget {
  final Products products;
  List selectedColor;
  List selectedBrand;
  TextEditingController quantity;
  int index;
  ProductContainer(
      {Key? key,
      required this.products,
      required this.selectedColor,
      required this.index,
      required this.quantity,
      required this.selectedBrand})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          SizedBox(width: 2.sp),
          Column(
            children: [
              Container(
                  height: 11.h,
                  width: 11.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey,
                  ),
                  child: Image.network(
                    products.picture.toString(),
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
          SizedBox(width: 2.w),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  products.productName.toString(),
                  style: TextStyle(fontSize: 15.sp),
                ),
                Text(
                  "Price: ${products.price}",
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 7.h,
                  width: 29.h,
                  child: PrimaryDropDown(
                      items:
                          products.brands!.map<String>((e) => e.name!).toList(),
                      hintText: "Select Brand",
                      onChanged: (brand) {
                        selectedBrand[index] = brand;
                      }),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 7.h,
                  width: 29.h,
                  child: PrimaryDropDown(
                      items:
                          products.colors!.map<String>((e) => e.name).toList(),
                      hintText: "Select Color",
                      onChanged: (color) {
                        selectedColor[index] = color;
                      }),
                ),
                SizedBox(height: 2.h),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(9)),
                    height: 5.h,
                    width: 29.h,
                    child: TextFormField(
                      controller: quantity,
                      decoration:
                          const InputDecoration(hintText: " Enter Quantity"),
                    )),
                SizedBox(height: 2.h),
              ])
        ],
      ),
    );
  }
}
