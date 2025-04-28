import 'package:flutter/material.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';

class HomePageTopTexts extends StatelessWidget {
  const HomePageTopTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              'فرز الفنادق حسب:',
              style: TextThemsCustom.font22BlackBolde,
            ),
          ),
          Row(
            children: [
              Text(
                'عرض الكل',
                style: TextThemsCustom.font12GrayColor,
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.keyboard_double_arrow_left_outlined,
                size: 15,
              )
            ],
          )
        ],
      ),
    );
  }
}
