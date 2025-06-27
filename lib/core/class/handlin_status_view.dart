import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/consttint/app_icons_lottet.dart';

class HandlinStatusView extends StatelessWidget {
 final StatusRquest statusRquest;
final  Widget widget;
 final Widget shimmerWidget;
  const HandlinStatusView({super.key, required this.statusRquest, required this.widget, required this.shimmerWidget});

  @override
  Widget build(BuildContext context) {
    return statusRquest == StatusRquest.loading?
   shimmerWidget
        :statusRquest == StatusRquest.offline?
    Center(child: Lottie.asset(AppIconsLotit.Offline),)
    :statusRquest == StatusRquest.failure?
     Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie Animation
            Lottie.asset(
              AppIconsLotit.Nodata, // أضف ملف Lottie هنا
              height: 200,
            ),
            SizedBox(height: 20),
            // نص الرسالة
            Text(
              'لا توجد بيانات متاحة',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 10),
            Text(
              ' ستتوفر قريباّّ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            // SizedBox(height: 30),
            // // زر إعادة المحاولة
            // ElevatedButton(
            //   onPressed: () {
            //     // قم بتعريف وظيفة زر التحديث
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blue,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(30),
            //     ),
            //     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            //   ),
            //   child: Text(
            //     'إعادة المحاولة',
            //     style: TextStyle(fontSize: 16),
            //   ),
            // ),
          ],
        ),
      )
        :widget;
  }
}