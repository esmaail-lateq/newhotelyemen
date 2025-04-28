import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/view/screen/bookings_screen.dart';

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
    return Scaffold(
      body: Column(
        children: [
          // TabBar للأقسام الثلاثة
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
          // const SizedBox(
          //   height: 5,
          // ),
          // Container(
          //     margin: const EdgeInsets.only(left: 16, right: 16),
          //     child: const Divider()),

          // محتوى التبويبات
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                BookingsScreen(),
                Text('السابقة'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
