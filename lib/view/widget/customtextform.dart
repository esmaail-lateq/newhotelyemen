import 'package:flutter/material.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';

class CustomTextForm extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconData? iconshowpassword;
  final IconData? iconpassword;

  final TextEditingController mycontroller;
  final bool? isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function()? chingpassword;

  const CustomTextForm(
      {super.key,
      required this.icon,
      required this.mycontroller,
      this.isPassword,
      required this.keyboardType,
      this.chingpassword, this.validator, required this.label, this.iconshowpassword, this.iconpassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      transformAlignment: Alignment.topRight,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.cyan),

      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.cyan),
          SizedBox(width:10 ),

          Expanded(
            child: TextFormField(

              validator: validator,

              controller: mycontroller,
              obscureText:
                  isPassword == null || isPassword == false ? false : true,
              // onChanged: (value) {
              //   onChanged(value);
              //   _checkFormValidity();
              // },
              style: TextStyle(color: Colors.white),
              keyboardType: keyboardType,
              enableInteractiveSelection: true,
              decoration: InputDecoration(
                labelText: label,
                hintTextDirection: TextDirection.ltr,
                // errorText: errorText,
                border: InputBorder.none,
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),

          IconButton(
            onPressed: chingpassword,
            icon: isPassword == false
                ? Icon(iconpassword)
                : Icon(iconshowpassword),
            color: Colors.white,
          ),




          // if (isPassword)
          //   IconButton(
          //     icon: Icon(
          //         _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          //         color: Colors.white),
          //     onPressed: () {
          //       setState(() {
          //         _isPasswordVisible = !_isPasswordVisible;
          //       });
          //     },
          //   ),
        ],
      ),
    );
  }
}
