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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 12.0), // التباعد بين الحقول
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // المسافة داخل الحقل
      // padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), //// خلفية الحقل (رمادي فاتح)
        border: Border(
          bottom:BorderSide(color:Color(0xFFCCCCCC) )
        )
        // borderRadius: BorderRadius.circular(12.0), // الحواف المستديرة
        // border: Border.all(color: const Color(0xFFCCCCCC)), // لون الإطار

      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // أيقونة الحقل
          Icon(
            icon,
            color: const Color(0xFF0A99FF), // لون الأزرق للأيقونات
          ),
          const SizedBox(width: 12), // مسافة بين الأيقونة والحقل

          // الحقل النصي
          Expanded(
            child: TextFormField(
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
                labelText: label,
                labelStyle: const TextStyle(
                  color: Color(0xFF555555), // لون النص الثانوي
                  fontSize: 14,
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
              color: const Color(0xFF999999), // لون الأيقونة الإضافية
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

