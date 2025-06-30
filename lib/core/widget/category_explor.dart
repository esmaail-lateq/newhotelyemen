// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:newhotelyemeni/features/home/controller/home_page_controller.dart';
// import 'package:newhotelyemeni/core/consttint/links.dart';
// import 'package:newhotelyemeni/features/home/data/model/catogry_model.dart';

// class CategoryExpelor extends GetView<HomePageController> {
//   int i;
//   ModelCateogrey model;
//   CategoryExpelor({
//     super.key,
//     required this.i,
//     required this.model,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomePageController>(
//       builder: (controller) => InkWell(
//         onTap: () {
//           print("value the i $i");
//           print("value the cateogry ${model.cateogreyId}");
//           controller.chaingCateo(i, model.cateogreyId!);
//         },
//         child: Card(
//           color: Colors.white,
//           child: Container(
//             width: 80,
//             margin: EdgeInsets.only(right: 14),
//             // decoration: BoxDecoration(
//             //     // gradient: LinearGradient(
//             //     //     begin: Alignment.topLeft,
//             //     //     end: Alignment.bottomRight,
//             //     //     colors: [
//             //     //       Colors.blue.shade600,
//             //     //       Colors.blue.shade400,
//             //     //       Colors.blue.shade200
//             //     //     ]),
//             //     shape: BoxShape.circle,
//             //     // boxShadow: [
//             //     //   BoxShadow(
//             //     //       color: Colors.black.withOpacity(0.2),
//             //     //       blurRadius:15,
//             //     //       offset:Offset(0, 3)
//             //     //   )
//             //     // ]
//             // ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // SvgPicture.network(
//                 //   "${AppLinks.rootImage}/cateo/${model.cateogreyImage}",
//                 //   color:
//                 //       controller.selectcate == i ? Colors.blue : Colors.black,
//                 //   height: 30,
//                 //   width: 30,
//                 // ),
//                 Icon(Icons.abc),
//                 // SizedBox(height: 2,),
//                 Text(
//                     overflow: TextOverflow.clip,
//                     "abood",
//                     // "${model.cateogreyName}",
//                     style: TextStyle(
//                         color: controller.selectcate == i
//                             ? Colors.blue
//                             : Colors.black,
//                         fontSize: 13))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
