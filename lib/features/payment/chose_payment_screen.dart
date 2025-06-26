import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:newhotelyemeni/core/consttint/app_image.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/features/MyReservations/view/widget/helper_sidget.dart';
import 'package:newhotelyemeni/features/home/view/homescreen.dart';

class ChosePaymentScreen extends StatelessWidget {
  const ChosePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'تاكيد الحجز',
          style: TextThemsCustom.appbarText,
        ),
        centerTitle: true,
        // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.close))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('تفاصيل الحجز:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    detailRow("غرفة ديلوكس", "2 بالغون"),
                    detailRow("إقامة فقط", ""),
                    const SizedBox(height: 12),
                    detailRow("عدد الليالي", "1 ليلة"),
                    detailRow("الوصول", "03 May, 2025"),
                    detailRow("المغادرة", "04 May, 2025"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('اختيار طريقة الدفع :',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    payment('حاسب من الكريمي', AppImage.korayime),
                    SizedBox(
                      height: 10,
                    ),
                    payment(' محفظة فلوسك ', AppImage.flosk),
                    SizedBox(
                      height: 10,
                    ),
                    payment(' محفظة جيب ', AppImage.jaib),
                    SizedBox(
                      height: 10,
                    ),
                    payment(' محفظة جوالي ', AppImage.jawaly),
                    SizedBox(
                      height: 10,
                    ),
                    payment(' محفظة فون كاش ', AppImage.phoneCash),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("تفاصيل الدفع",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    detailRow("1 غرفة × 1 ليلة واحدة", "USD 470.52"),
                    detailRow("المبلغ الإجمالي (شامل الـ VAT)", "USD 470.52"),
                    const SizedBox(height: 8),
                    const Divider(),
                    detailRow(
                        "المجموع (يشمل ضريبة القيمة المضافة)", "USD 470.52"),
                    const Divider(height: 32),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  // tabController.animateTo(1);
                  Get.offAll(HomeScreen());
                  Get.defaultDialog(
                      backgroundColor: Colors.white,
                      buttonColor: Colors.white,
                      confirmTextColor: Colors.black,
                      title: "نجاح",
                      middleText: "تم ارسال طلبك انتظر لتاكيد الحجز من الفندق ",
                      textConfirm: 'حالة الحجز');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                        color: AppColors.text4,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      ' تاكيد الحجز ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget payment(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: AppColors.gray, width: 0.4)),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.circle_outlined,
              size: 22,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Image.asset(
              image,
              height: 50,
              width: 50,
            ),
            SizedBox(
              width: 10,
            ),
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
