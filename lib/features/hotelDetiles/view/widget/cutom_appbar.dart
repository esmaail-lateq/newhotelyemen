import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';

Widget buildCustomAppBar(String hotelName) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back, color: AppColors.gradint),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Text(
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              hotelName,
              style: TextThemsCustom.appbarText,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.share,
                    color: AppColors.gradint,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border, color: AppColors.gradint),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }