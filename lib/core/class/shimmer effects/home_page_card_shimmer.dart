import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePageCardShimmer extends StatelessWidget {
  const HomePageCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[400]!,
        child: AspectRatio(
          aspectRatio: 1 / 0.68,
          child: Container(
            // width: 200,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.2),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),

                  SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        height: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      // Text(
                      //   hotel.city!,
                      //   style: TextStyle(
                      //     color: Colors.white70,
                      //     fontSize: 16,
                      //   ),
                      // ),
                      SizedBox(
                        width: 10,
                      ),
                      // Text(
                      //   '. ${hotel.address!}',
                      //   style: TextStyle(
                      //     color: Colors.white70,
                      //     fontSize: 16,
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(height: 5), // مسافة صغيرة بين العناصر
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 18),
                          Icon(Icons.star, color: Colors.yellow, size: 18),
                          Icon(Icons.star, color: Colors.yellow, size: 18),
                          Icon(Icons.star, color: Colors.yellow, size: 18),
                          // Icon(Icons.star_border,
                          //     color: Colors.yellow, size: 18),
                          SizedBox(width: 5),
                          // Text(
                          //   hotel.rating!.toString(),
                          //   style: TextStyle(
                          //     color: Colors.white70,
                          //     fontSize: 14,
                          //   ),
                          // ),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(11)),
                        child: Text(
                          'التفاصيل',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
