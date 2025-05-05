import 'package:flutter/material.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';

class CustomTextForm extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData icon;
  final IconData? iconshowpassword;
  final IconData? iconpassword;
  final TextEditingController mycontroller;
  final bool? isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function()? chingpassword;
  final void Function(String)? onChanged;

  const CustomTextForm({
    super.key,
    required this.icon,
    required this.mycontroller,
    this.isPassword,
    required this.keyboardType,
    this.chingpassword,
    this.validator,
    required this.label,
    this.iconshowpassword,
    this.iconpassword,
    this.hint,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 12.0), // التباعد بين الحقول
      padding:
          const EdgeInsets.symmetric(horizontal: 16.0), // المسافة داخل الحقل
      // padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: const Color.fromARGB(
              255, 255, 254, 254), //// خلفية الحقل (رمادي فاتح)
          border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC)))
          // borderRadius: BorderRadius.circular(12.0), // الحواف المستديرة
          // border: Border.all(color: const Color(0xFFCCCCCC)), // لون الإطار

          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // أيقونة الحقل
          Icon(
            icon, size: 22,
            // color:
            //     const Color.fromARGB(255, 33, 33, 33), // لون الأزرق للأيقونات
          ),
          const SizedBox(width: 5), // مسافة بين الأيقونة والحقل

          // الحقل النصي
          Expanded(
            child: TextFormField(
              onChanged: onChanged,

              textInputAction: TextInputAction.next,
              validator: validator,
              controller: mycontroller,
              obscureText: isPassword == true,
              style: const TextStyle(
                color: Color(0xFF333333), // لون النص داخل الحقل
                fontSize: 16, // حجم النص
              ),
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: hint ?? '',


                hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                filled: true,
                fillColor: Colors.white,
                labelText: label,
                labelStyle: const TextStyle(
                  color: Color(0xFF555555), // لون النص الثانوي
                  fontSize: 16,
                ),
                border: InputBorder.none, // إزالة الإطار الأساسي
              ),
            ),
          ),

          // أيقونة إظهار/إخفاء كلمة المرور
          if (isPassword != null)
            IconButton(
              onPressed: chingpassword,
              icon: Icon(
                isPassword == false ? iconpassword : iconshowpassword,
              ),
              color: const Color.fromARGB(
                  255, 77, 74, 74), // لون الأيقونة الإضافية
            ),
        ],
      ),
    );
  }
}



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

