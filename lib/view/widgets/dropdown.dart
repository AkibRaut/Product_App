import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrimaryDropDown extends StatelessWidget {
  const PrimaryDropDown({
    Key? key,
    required this.items,
    this.dropDownItem,
    this.value,
    required this.onChanged,
    this.height,
    this.inputWithLabel = false,
    this.isImp = false,
    this.isError = false,
    this.labelText,
    this.hintText,
  }) : super(key: key);

  final bool inputWithLabel;
  final double? height;
  final bool isImp;
  final String? labelText;
  final String? hintText;
  final Object? value;
  final bool isError;
  final List<String> items;
  final Function(String newValue) onChanged;
  final List<DropdownMenuItem<dynamic>>? dropDownItem;
  @override
  Widget build(BuildContext context) {
    DropdownButtonFormField dropDownFormField = DropdownButtonFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.sp,
          vertical: 10.sp,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: isError
              ? const BorderSide(color: Colors.red)
              : const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      isExpanded: true,
      value: value,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: Colors.black,
      ),
      items: dropDownItem ??
          items.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item.replaceAll('_', ' '),
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            );
          }).toList(),
      hint: Text(
        hintText ?? labelText ?? '',
        style: TextStyle(
          color: Colors.black,
          fontSize: 10.sp,
        ),
      ),
      onChanged: (s) => onChanged(s),
    );
    return Container(
      color: Colors.transparent,
      height: 60,
      width: double.infinity,
      child: inputWithLabel
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        labelText!,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (isImp)
                        const Text(
                          '*',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                ),
                dropDownFormField
              ],
            )
          : dropDownFormField,
    );
  }
}
