import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/rout_name.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/features/MyReservations/view/widget/helper_sidget.dart';

class BookingDetailsPage extends StatelessWidget {
 final  Widget actionBotton;
  const BookingDetailsPage({super.key, required this.actionBotton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'تفاصيل الحجز',
          style: TextThemsCustom.appbarText,
        ),
        centerTitle: true,
        // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.close))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("حجز مكان الإقامة",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset("assets/images/hotelimg.jpg",
                          width: 100, height: 100, fit: BoxFit.cover)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "شانجري-لا بوسفور، إسطنبول",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            Icon(Icons.star, color: Colors.orange, size: 16),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text("فندق", style: TextStyle(color: Colors.teal)),
                        SizedBox(height: 4),
                        Text("Sinanpasa Mah, Hayrettin Iskelesi Sok",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            detailRow("غرفة ديلوكس", "2 بالغون"),
            detailRow("إقامة فقط", ""),
            const SizedBox(height: 12),
            detailRow("عدد الليالي", "1 ليلة"),
            detailRow("الوصول", "03 May, 2025"),
            detailRow("المغادرة", "04 May, 2025"),
            const Divider(height: 32),
            const Text("تفاصيل الدفع",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            detailRow("1 غرفة × 1 ليلة واحدة", "USD 470.52"),
            detailRow("المبلغ الإجمالي (شامل الـ VAT)", "USD 470.52"),
            const SizedBox(height: 8),
            const Divider(),
            detailRow("المجموع (يشمل ضريبة القيمة المضافة)", "USD 470.52"),
            const Divider(height: 32),
            const Text("المزيد من المعلومات",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            buildRowInfo(),
            const SizedBox(height: 24),
           actionBotton
          ],
        ),
      ),
    );
  }

  Widget buildRowInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.cancel_outlined,
              size: 22,
            ),
            SizedBox(
              width: 15,
            ),
            Text('سياسة الالغاء'),
          ],
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'قابل للاسترداد',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 11),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
              color: Colors.grey,
            ),
          ],
        )
      ],
    );
  }
}
