import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/rout_name.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/features/MyReservations/view/screen/bookings_details.dart';
import 'package:newhotelyemeni/features/MyReservations/view/widget/helper_sidget.dart';
import 'package:newhotelyemeni/core/widget/auth/customebuttone.dart';

class ReservationCardDitail extends StatefulWidget {
  final String hotailName;
  final String hotailImage;
  final String hotailoction;
  final String status;
  const ReservationCardDitail(
      {super.key,
      required this.hotailName,
      required this.hotailImage,
      required this.hotailoction,
      required this.status});

  @override
  State<ReservationCardDitail> createState() => _ReservationCardDitailState();
}

class _ReservationCardDitailState extends State<ReservationCardDitail> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            // color: Colors.amber,
            border: Border.all(color: const Color.fromARGB(255, 196, 194, 194)),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 12),
            InkWell(
              onTap: () => Get.to(() => BookingDetailsPage(
                      actionBotton: Center(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.center,
                          // width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              color: AppColors.gradint,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            'الحجز مرة اخرى',
                            style: TextThemsCustom.font12WhithColor,
                          )),
                    ),
                  ))),
              child: Container(
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.grey.shade300),
                //   borderRadius: BorderRadius.circular(12),
                // ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(widget.hotailImage,
                            width: 100, height: 100, fit: BoxFit.cover)
                        //  Image.network(
                        //   'https://cf.bstatic.com/xdata/images/hotel/max1024x768/437924925.jpg', // صورة كمثال
                        //   width: 100,
                        //   height: 80,
                        //   fit: BoxFit.cover,
                        // ),
                        ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.hotailName,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.grey, size: 16),
                              Text(
                                widget.hotailoction,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                stateResv('حالة الحجز:', widget.status),
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                  icon: Icon(
                      color: Colors.grey,
                      showMore
                          ? Icons.keyboard_double_arrow_up_rounded
                          : Icons.keyboard_double_arrow_down_rounded),
                  label: Text(
                    showMore ? "إخفاء التفاصيل" : " عرض التفاصيل ",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),

            // التفاصيل الإضافية
            AnimatedCrossFade(
              firstCurve: Curves.linearToEaseOut,
              secondCurve: Curves.easeInBack,
              firstChild: const SizedBox.shrink(),
              secondChild: Column(
                children: [
                  Divider(),

                  detailRow("غرفة ديلوكس", "2 بالغون"),
                  detailRow("إقامة فقط", ""),
                  Divider(),
                  // const SizedBox(height: 5),
                  detailRow("عدد الليالي", "1 ليلة"),
                  detailRow("الوصول", "03 May, 2025"),
                  detailRow("المغادرة", "04 May, 2025"),
                  // detailRow("المغادرة", "04 May, 2025"),
                  // const SizedBox(height: 8),

                  InkWell(
                    onTap: () => Get.to(() => BookingDetailsPage(
                            actionBotton: Center(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                alignment: Alignment.center,
                                // width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: AppColors.gradint,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  'الحجز مرة اخرى',
                                  style: TextThemsCustom.font12WhithColor,
                                )),
                          ),
                        ))),
                    child: Container(
                        alignment: Alignment.center,
                        width: 110,
                        height: 40,
                        decoration: BoxDecoration(
                            color: AppColors.gradint,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          'تفاصيل اكثر',
                          style: TextThemsCustom.font12WhithColor,
                        )),
                  )

                  // stateResv('حالة الحجز:', 'مؤكد'),
                ],
              ),
              crossFadeState: showMore
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),

            // const Divider(height: 32),
            // const Text("تفاصيل الدفع",
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // const SizedBox(height: 12),
            // detailRow("1 غرفة × 1 ليلة واحدة", "USD 470.52"),
            // detailRow("المبلغ الإجمالي (شامل الـ VAT)", "USD 470.52"),
            // const SizedBox(height: 8),
            // const Divider(),
            // detailRow("المجموع (يشمل ضريبة القيمة المضافة)", "USD 470.52"),
            // const SizedBox(height: 24),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: const Text("تأكيد الحجز"),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
