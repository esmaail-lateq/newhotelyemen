import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';

import 'package:newhotelyemeni/features/hotelsLocations/view/map_view_screen.dart';
import 'package:newhotelyemeni/core/widget/elevatedbuttons.dart';
import 'package:newhotelyemeni/core/widget/fontandtext.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/posterbk.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.2),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //     padding: EdgeInsets.symmetric(vertical: 3),
            //     margin: EdgeInsets.symmetric(
            //       horizontal: 15,
            //     ),
            //     height: 45,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(50),
            //       color: Colors.white,
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black12,
            //           blurRadius: 5,
            //           offset: Offset(0, 2),
            //         ),
            //       ],
            //     ),
            //     child: CustomTextForm(
            //       lable: "ابحث عن الفندق  ...",
            //       iconDataPrifix: Icons.search,
            //       iconDataSufix: Icons.filter_list,
            //       iconsize: 20,
            //       radios: 10,
            //       lableSize: 13,
            //     )
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: 40,
              child: CustomTextForm(
                lable: "ابحث عن فندق  ...",
                iconDataPrifix: Icons.search,
                iconDataSufix: Icons.filter_list,
                iconsize: 20,
                radios: 30,
                lableSize: 15,
              ),
            ),
            //  TextFormField(
            //   // textAlign: TextAlign.right,
            //   decoration: InputDecoration(
            //     border: InputBorder.none,
            //     prefixIcon: Icon(Icons.search, color: Colors.grey),
            //     suffixIcon: Icon(Icons.filter_list, color: Colors.grey),
            //     hintStyle: TextStyle(
            //       color: Colors.grey,
            //       fontSize: 14,
            //     ),
            //     hintText: "ابحث عن الفندق  ...",
            //   ),
            // ),
            // ),

            // Text(
            //   "ابحث عن اقرب فندق لك ",
            //   textAlign: TextAlign.center,
            //   style: textStyles.titleStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
            Container(
              margin: EdgeInsets.only(bottom: 35),
              child: CustomElevatedButton(
                label: ' اقرب فندق منك في الخريطة ',
                icon: Icons.map,
                backgroundColor: Colors.white,
                onPressed: () {
                  // Get.to(() => MapView());
                  Get.to(() => MapViewScreen());
                  // Get.to(() => Testlocation());
                },
                textColor: Colors.black,
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(8),
            //   decoration: BoxDecoration(
            //       color: AppColors.primaryColor,
            //       borderRadius: BorderRadius.circular(8)),
            //   child: Text(
            //     "  اقرب فندق لك ",
            //     style: TextStyle(color: Colors.white, fontSize: 16),
            //   ),
            // ),
            // SizedBox(height: 5),
            // SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class CustomTextForm extends StatelessWidget {
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

  const CustomTextForm(
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
        fillColor: Colors.grey[100],

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
          borderSide: BorderSide(color: Colors.white, width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radios),
          borderSide: BorderSide(color: Colors.white, width: 0),
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
