  import 'package:flutter/material.dart';

Widget detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 14)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget stateResv(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 14)),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: value == 'مؤكد'
                  ? Colors.green.withOpacity(0.1)
                  :value=='منتهي'? Colors.grey.withOpacity(0.1): Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              value,
              style: TextStyle(
                  color: value == 'مؤكد'
                  ? Colors.green
                  :value=='منتهي'? Colors.grey: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }