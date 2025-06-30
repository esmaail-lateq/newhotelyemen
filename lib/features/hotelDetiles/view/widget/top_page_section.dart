import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newhotelyemeni/core/consttint/app_image.dart';
import 'package:newhotelyemeni/core/consttint/app_string.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/features/home/data/hotel_modle.dart';

class BuildImageSlider extends StatelessWidget {
  final HotelsModle hotleData;

  const BuildImageSlider({super.key, required this.hotleData});

  @override
  Widget build(BuildContext context) {
    List images = hotleData.images ?? [];
    return Stack(
      children: [
        SizedBox(
          height: 250,
          child: images.isEmpty
              ? Image.asset(AppImage.korayime)
              : PageView.builder(
                  // reverse: true,
                  // hitTestBehavior: HitTestBehavior.translucent,
                  itemCount: images.length,
                  itemBuilder: (context, index) => Image.network(
                    images[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        Positioned(top: 15, left: 10, child: buildNumberOfImage(images.length)),
        Positioned(
            bottom: 15,
            right: 20,
            child: buildNameAndRating(
                hotleData.name!, double.parse(hotleData.rating!)))
      ],
    );
  }
}

// Widget buildImageSlider() {
//   return Stack(
//     children: [
//       SizedBox(
//         height: 250,
//         child: PageView.builder(
//           itemCount: 5, // Replace with actual image count
//           itemBuilder: (context, index) => Image.network(
//             'https://picsum.photos/400/250?random=$index',
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       Positioned(top: 15, left: 10, child: buildNumberOfImage()),
//       Positioned(bottom: 15, right: 20, child: buildNameAndRating())
//     ],
//   );
// }

Widget buildNameAndRating(String hotelName, double rating) {
  return Column(
    children: [
      Text(
        hotelName,
        style: TextThemsCustom.font22LhgitGrey,
      ),
      Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: AppColors.red.withOpacity(0.8),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              AppString.hotel,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          RatingBarIndicator(
            rating: rating,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 17,
            direction: Axis.horizontal,
          ),
          // Row(
          //   children: [
          //     Icon(Icons.star, color: Colors.orange, size: 16),
          //     Icon(Icons.star, color: Colors.orange, size: 16),
          //     Icon(Icons.star, color: Colors.orange, size: 16),
          //     Icon(Icons.star, color: Colors.orange, size: 16),
          //     Icon(Icons.star, color: Colors.orange, size: 16),
          //   ],
          // )
        ],
      )
    ],
  );
}

Widget buildHotelInfo(double rating) {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 20),
            SizedBox(width: 4),
            Text('$rating', style: TextStyle(color: Colors.grey)),
            SizedBox(width: 8),
            Text(hotelRatiText(rating),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: hotelRatiTextColor(rating))),
            SizedBox(width: 8),
            Text('(462 تقييم)', style: TextStyle(color: Colors.grey)),
          ],
        ),
        // SizedBox(height: 12),
      ],
    ),
  );
}

Widget buildNumberOfImage(int imageNumber) {
  return IntrinsicWidth(
    child: Container(
      alignment: Alignment.center,
      // width: 80,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 40, 39, 39),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$imageNumber',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}

String hotelRatiText(double rating) {
  if (rating >= 3.5) {
    return AppString.ratiExelant;
  } else if (rating < 3.5 && rating > 2.5) {
    return AppString.ratiGood;
  } else {
    return AppString.ratiBad;
  }
}

Color hotelRatiTextColor(double rating) {
  if (rating >= 3.5) {
    return Colors.green;
  } else if (rating < 3.5 && rating > 2.5) {
    return const Color.fromARGB(255, 209, 189, 5);
  } else {
    return Colors.red;
  }
}
