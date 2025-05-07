import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart'
    show TextThemsCustom;
import 'package:newhotelyemeni/core/function/check_is_user_login.dart';
import 'package:newhotelyemeni/core/sharedWidget/if_user_not_logged_in_screen.dart';
import 'package:newhotelyemeni/features/MyReservations/view/screen/histroy_bookings_screen.dart';
import 'package:newhotelyemeni/features/MyReservations/view/widget/reservation_card_ditail.dart';

import 'package:newhotelyemeni/features/MyReservations/view/screen/bookings_screen.dart';

class MyReservationScreen extends StatefulWidget {
  const MyReservationScreen({super.key});

  @override
  State<MyReservationScreen> createState() => _MyReservationScreenState();
}

class _MyReservationScreenState extends State<MyReservationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoggedIn(Get.find())) return IfUserNotLoggedInScreen();
    return Scaffold(
      body: Column(
        children: [
          // TabBar للأقسام الثلاثة
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'حجوزاتي',
              style: TextThemsCustom.appbarText,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: false,
            controller: _tabController,
            automaticIndicatorColorAdjustment: true,
            // indicatorPadding: const EdgeInsets.symmetric(horizontal: 0),
            indicatorColor: AppColors.gradint,
            labelColor: AppColors.gradint,
            unselectedLabelColor: Colors.grey,
            // automaticIndicatorColorAdjustment: false,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(
                text: "الحالية",
              ),
              Tab(text: "السابقة"),
            ],
          ),
   

          // محتوى التبويبات
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                BookingsScreen(),
                HistroyBookingsScreen()
                // BookingDetailsPage(),
                // BookingDetailsPage2(),
                // Text('data')
                // ListView(
                //   children: [
                //     ReservationCardDitail(),
                //     ReservationCardDitail(),
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
