import 'package:flutter/material.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';

class CustomButtomNavBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData iconData;

  final bool notfic;
  final String title;

  final bool? actev;
  final bool? isDark;
  final String? numbernotif;
  const CustomButtomNavBar({
    super.key,
    this.onPressed,
    required this.iconData,
    this.actev,
    this.numbernotif,
    this.notfic = false,
    required this.title,
    this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        customBorder: const CircleBorder(),
        splashColor: Colors.white,
        highlightColor: AppColors.secundColor,
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //notfic?
            // badges.Badge(
            //   badgeContent: Text('2'),badgeStyle: badges.BadgeStyle(),
            //   child: Icon(
            //     iconData,
            //     size: 30,
            //     color: actev! ? Colorapp.primaryColor : Colors.black,
            //   )
            // ): Icon(
            //     iconData,
            //     size: 30,
            //     color: actev! ? Colorapp.primaryColor : Colors.black,
            //   ),

            const SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2),
              width: 70,
              decoration: BoxDecoration(
                  color: actev! ? AppColors.bottomFilColor : null,
                  borderRadius: BorderRadius.circular(15)),
              child: Icon(iconData,
                  size: 25,
                  color: actev!
                      ? AppColors.primaryColor
                      : AppColors.theerdColorThinker
                  // isdark!
                  //     ? Colors.grey[100]
                  //     : Colors.black,
                  ),
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 12,
                  color: actev!
                      ? AppColors.primaryColor
                      : AppColors.theerdColorThinker,
                  fontWeight: actev! ? FontWeight.bold : null),
            )
          ],
        ));
  }
}



// Stack(
//         children: [
//           Container(
//             width: 80,
          
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
//             child: Column(children: [
//               Icon(
//                 iconData,
//                 color: Colorapp.white,
//                 size: 30,
//               ),
//             ]),
//           ),
//           actev!
//               ? const Positioned(
//                   bottom: 8,
//                   left: 35,
//                   child: Text(
//                     '.',
//                     style: TextStyle(
//                         fontSize: 25,
//                         color: Colorapp.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 )
//               : Container(
//                   height: 25,
//                 )
//         ],
//       ),