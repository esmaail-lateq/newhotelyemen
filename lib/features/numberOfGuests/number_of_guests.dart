import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/features/numberOfGuests/number_of_guest_controller.dart';

class NumberOfGuests extends StatelessWidget {
  final NumberOfGuestController controller =
      Get.find<NumberOfGuestController>();

  NumberOfGuests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 30),
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          onPressed: () {
            // التطبيق الفعلي
            controller.confirmRoom();
            Get.back();
          },
          child: Text(
            'تطبيق',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: AppColors.text4,
          ),
        ),
      ),
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.text4),
        backgroundColor: Colors.white,
        title: Text('نزلاء'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Get.back(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'الحد الأقصى المسموح به هو 8 نزلاء في الغرفة الواحدة',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Obx(() => Column(
                    children: List.generate(
                      controller.rooms.length,
                      (index) => _buildRoomSection(index),
                    ),
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    // itemCount: controller.rooms.length,
                    // itemBuilder: (context, index) => _buildRoomSection(index),
                  )),
              OutlinedButton.icon(
                style: IconButton.styleFrom(
                    side: BorderSide(color: AppColors.text4)),
                onPressed: controller.addRoom,
                icon: Icon(
                  Icons.add,
                  color: AppColors.text4,
                ),
                label: Text(
                  'إضافة غرفة أخرى',
                  style: TextStyle(color: AppColors.text4),
                ),
              ),
              const SizedBox(height: 80),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoomSection(int index) {
    final room = controller.rooms[index];
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      // padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.text4.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(Icons.bed),
                SizedBox(width: 10),
                Text('غرفة ${index + 1}'),
                Spacer(),
                if (controller.rooms.length > 1)
                  TextButton(
                      onPressed: () {
                        controller.removeRoom(index);
                      },
                      child: Text(
                        'حذف',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ))
              ],
            ),
          ),
          const SizedBox(height: 6),
          _buildGuestRow(
              'بالغون',
              'العمر (+12)',
              room.adults,
              () => controller.incrementAdults(index),
              () => controller.decrementAdults(index)),
          const SizedBox(height: 5),
          Divider(),
          _buildGuestRow(
              'أطفال',
              'العمر (0-11)',
              room.children,
              () => controller.incrementChildren(index),
              () => controller.decrementChildren(index)),
        ],
      ),
    );
  }

  // Widget _buildRoomSection() {
  //   return Container(
  //     // padding: EdgeInsets.all(12),
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Colors.grey, width: 0.3),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Column(
  //       children: [
  // Container(
  //   padding: EdgeInsets.all(12),
  //   decoration: BoxDecoration(
  //     color: AppColors.text4.withOpacity(0.2),
  //     borderRadius: BorderRadius.circular(10),
  //   ),
  //   child: Row(
  //     children: [
  //       Icon(Icons.bed),
  //       SizedBox(width: 10),
  //       Text('غرفة 1'),
  //     ],
  //   ),
  // ),
  //         const SizedBox(height: 6),
  //         _buildGuestRow('بالغون', 'العمر (+12)', controller.adults,
  //             controller.incrementAdults, controller.decrementAdults),
  //         // const SizedBox(height: 5),
  //         Divider(),
  //         _buildGuestRow('أطفال', 'العمر (0-11)', controller.children,
  //             controller.incrementChildren, controller.decrementChildren),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildGuestRow(String title, String subtitle, RxInt value,
      VoidCallback onAdd, VoidCallback onRemove) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(subtitle, style: TextStyle(color: Colors.grey)),
          ]),
          Row(children: [
            IconButton(onPressed: onAdd, icon: Icon(Icons.add_circle_outline)),
            Obx(() =>
                Text(value.value.toString(), style: TextStyle(fontSize: 18))),
            IconButton(
                onPressed: onRemove, icon: Icon(Icons.remove_circle_outline)),
          ])
        ],
      ),
    );
  }
}
