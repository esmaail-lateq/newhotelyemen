import 'package:flutter/material.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/features/rooms/widget/room_detailes_widget.dart';

class RoomHotelDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text('تفاصيل الغرفة'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              // padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildImageSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildHeaderSection(),
                        SizedBox(height: 20),
                        buildRoomDetilse(),
                        SizedBox(height: 20),
                        buildFacilitiesSection(),
                        SizedBox(height: 20),
                        buildClothingSection(),
                        SizedBox(height: 30),
                        buildPriceSection(),
                        SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'ابتداء من',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'USD 511',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  buildShowOptionsButton(),
                ],
              )),
        ],
      ),
    );
  }
}
