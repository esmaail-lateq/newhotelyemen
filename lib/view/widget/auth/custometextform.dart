import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/controller/auth/showhidepassword.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';

class Custometextform extends StatelessWidget {
  final String hint;
  final String text;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final bool? isnumber;
  final bool? ispassword;
  final bool? counlin;
  final String? Function(String?)? validator;

  const Custometextform(
      {super.key,
      required this.hint,
      required this.text,
      required this.iconData,
      required this.mycontroller,
      required this.isnumber,
      required this.ispassword,
      required this.validator,
      this.counlin = false});

  @override
  Widget build(BuildContext context) {
    Get.put(Showhidepassword());
    return GetBuilder<Showhidepassword>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(top: 15),
        child: TextFormField(
          style: TextStyle(color: Colors.black),
          cursorHeight: 30,
          maxLines: counlin! ? 10 : 1,
          minLines: counlin! ? 5 : null,
          validator: validator,
          obscureText: ispassword! ? controller.show : ispassword!,
          keyboardType: isnumber!
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          controller: mycontroller,
          decoration: InputDecoration(
            floatingLabelStyle:
                TextStyle(color: AppColors.primaryColor, fontSize: 20),
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(30),
            //   borderSide:
            //       const BorderSide(color: Colorapp.primaryColor, width: 2),
            // ),
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            focusColor: AppColors.primaryColor,
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  text,
                  style: const TextStyle(),
                )),

            prefixIcon: ispassword!
                ? controller.show
                    ? IconButton(
                        onPressed: () => controller.showpass(),
                        icon: Icon(iconData))
                    : IconButton(
                        onPressed: () => controller.hidepass(),
                        icon: const Icon(Icons.lock_outline))
                : Icon(iconData),
          ),
        ),
      ),
    );
  }
}
