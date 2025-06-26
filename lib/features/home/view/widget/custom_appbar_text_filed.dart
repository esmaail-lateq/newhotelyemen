import 'package:flutter/material.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';

class CustomAppbarTextFiled extends StatelessWidget {
  final String lable;
  final IconData iconDataPrifix;
  final IconData? iconDataSufix;
  final double radios;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isnumber;
  final Color iconColor;
  final double? iconsize;
  final double? marginLable;
  final double? contantPading;
  final double? lableSize;
  final Function(String)? onChanged;

  const CustomAppbarTextFiled(
      {super.key,
      required this.lable,
      required this.iconDataPrifix,
      required this.radios,
      this.controller,
      this.validator,
      this.isnumber = false,
      this.iconsize = 30,
      this.iconColor = Colors.black,
      this.marginLable = 10.0,
      this.lableSize = 14,
      this.contantPading = 30,
      this.onChanged,
      this.iconDataSufix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black, fontSize: 15),
      onChanged: onChanged,
      controller: controller,
      keyboardType: isnumber ? TextInputType.number : null,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,

        prefixIcon: Icon(
          iconDataPrifix,
          size: iconsize,
          color: iconColor,
        ),
        suffixIcon: Icon(
          iconDataSufix,
          size: iconsize,
          color: iconColor,
        ),
        // floatingLabelStyle:
        //     TextStyle(color: AppColors.primaryColor, fontSize: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radios),
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radios),
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        hintText: lable,
        // label: Container(
        //     margin: EdgeInsets.symmetric(horizontal: marginLable!),
        //     child: Text(
        //       lable,
        //       style: TextStyle(),
        //     )),
        hintStyle: TextStyle(fontSize: lableSize, color: Colors.grey),
        // labelText: 'jhhhhhhhhhhhhhhhhhhhhh',
        //     hintStyle: TextStyle(
        //       color: Colors.grey,
        //       fontSize: 14,
        //     ),
        border: InputBorder.none,
        contentPadding:
            EdgeInsets.symmetric(vertical: 10, horizontal: contantPading!),
        focusColor: AppColors.primaryColor,
      ),
    );
  }
}