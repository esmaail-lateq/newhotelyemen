// /*

import 'package:flutter/cupertino.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


// Flutter UI
// flutterui.design
// ----------------
// lib/apps/airbnb_clone.dart
// */
//
// import 'dart:collection';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
//
// //root page: under 'where are you going?/ At "Live anywhere -> Cabins and Cottages'
// const cabinImageUrl = 'assets/images/hotelimg.jpg';
//
// //root page: At "Live anywhere -> Entire Homes Image"
// const modernHouseImageUrl =
//     'assets/images/hotelimg.jpg';
// //root page: At "Live anywhere -> Unique Stays"
// const uniqueLakeCabinImageUrl =
//     'assets/images/hotelimg.jpg';
// //root page: At "Live anywhere -> Pets Allowed"
// const dogBeingLovedImageUrl =
//     'assets/images/hotelimg.jpg';
// //root page: At "Experience the world -> Online Experiences"
// const elderlyCoupleTabletImageUrl =
//     'assets/images/hotelimg.jpg';
// //root page: At "Experience the world -> Experiences"
// const couplePotteryImageUrl =
//     'assets/images/hotelimg.jpg';
// //root page: At "Experience the world -> Adventures"
// const womanCliffImageUrl =
//     'assets/images/hotelimg.jpg';
// //root page: At "Explore Nearby -> Dallas"
// const cityImageUrl =
//     'assets/images/hotelimg.jpg';
// //root page: At "Explore Nearby -> Austin"
// const scooterImageUrl =
//     'assets/images/hotelimg.jpg';
// //root page: At "Explore Nearby -> Glaveston"
// const beachImageUrl =
//     'assets/images/hotelimg.jpg';
// //root page: At "Explore Nearby -> Broken Bow/ HotSprings"
// const lakeImageUrl =
//     'assets/images/hotelimg.jpg';
// //root page: At "Explore Nearby -> Canyon Lake"
// const waterfallImageUrl =
//     'assets/images/hotelimg.jpg';
// const locationImageUrl =
//     'assets/images/hotelimg.jpg';
// const fireplaceImageUrl =
//     'assets/images/hotelimg.jpg';
//
// const emptyRoomImageUrl =
//     'assets/images/hotelimg.jpg';
// const List<String> apartmentImages = [
// 'assets/images/hotelimg.jpg',
// 'assets/images/hotelimg.jpg',
// 'assets/images/hotelimg.jpg',];
// const List<String> condoImages = [
// 'assets/images/hotelimg.jpg',
// 'assets/images/hotelimg.jpg',
// 'assets/images/hotelimg.jpg',];
//
// const String zachTwitterImageUrl =
//     'assets/images/hotelimg.jpg';
//
// const String campingImageUrl =
//     'assets/images/hotelimg.jpg';
// const String loremIpsumText =
//     'assets/images/hotelimg.jpg';
// /// Consistent padding for horizontal sides of screen. Most commonly used in ListViews to give content padding but still allow items to scroll off the screen.
// const double kHorizontalPadding = 24;
//
// /// Consistent padding for vertical sides of screen.
// const double kVerticalPadding = 64;
//
// class AboutScreen extends StatefulWidget {
//   const AboutScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AboutScreen> createState() => _AirbnbCloneState();
// }
//
// class _AirbnbCloneState extends State<AboutScreen> {
//   late int navBarIndex;
//
//   @override
//   void initState() {
//     super.initState();
//     navBarIndex = 0;
//   }
//
//   navigateToExplore() {
//     setState(() {
//       navBarIndex = 0;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: Theme.of(context).copyWith(
//         primaryColor: Colors.pink,
//         textSelectionTheme: Theme.of(context)
//             .textSelectionTheme
//             .copyWith(cursorColor: Colors.pink),
//       ),
//       child: Scaffold(
//           bottomNavigationBar: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             currentIndex: navBarIndex,
//             onTap: (index) {
//               setState(() {
//                 navBarIndex = index;
//               });
//             },
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.search),
//                 label: 'Explore',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.favorite_outline),
//                 label: 'Saved',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.all_inclusive),
//                 label: 'Trips',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.chat_bubble_outline),
//                 label: 'Inbox',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.account_circle_outlined),
//                 label: 'Profile',
//               ),
//             ],
//           ),
//           body: [
//             const ExploreScreen(),
//             const SavedScreen(savedLists: [austinList, aspenList]),
//             TripsScreen(navigateToExploreScreen: navigateToExplore),
//             const InboxScreen(),
//             const ProfileScreen(profile: zachProfile)
//           ][navBarIndex]),
//     );
//   }
// }
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({required this.profile, Key? key}) : super(key: key);
//   final Profile profile;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: Colors.white,
//             toolbarHeight: 125,
//             title: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 CircleAvatar(
//                   radius: 32,
//                   backgroundImage: NetworkImage(
//                     profile.profileImageUrl,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       profile.name,
//                       style: TextStyle(
//                         color: Colors.grey[800],
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     const Text(
//                       'Show Profile',
//                       style: TextStyle(
//                         color: Colors.teal,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     const SizedBox(height: 2),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: kHorizontalPadding,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildSectionTitle('Account settings'),
//                       const ProfileListTile(
//                         label: 'Personal Information',
//                         iconData: Icons.person_outline,
//                       ),
//                       const ProfileListTile(
//                         label: 'Payments and payouts',
//                         iconData: Icons.payments_outlined,
//                       ),
//                       const ProfileListTile(
//                         label: 'Notifications',
//                         iconData: Icons.notifications_outlined,
//                       ),
//                       _buildSectionTitle('Hosting'),
//                       const ProfileListTile(
//                         label: 'Learn about hosting',
//                         iconData: Icons.home_outlined,
//                       ),
//                       const ProfileListTile(
//                           label: 'List your space',
//                           iconData: Icons.add_business_outlined),
//                       const ProfileListTile(
//                         label: 'Host an experience',
//                         iconData: Icons.beach_access_outlined,
//                       ),
//                       _buildSectionTitle('Referrals & Credits'),
//                       const ProfileListTile(
//                         label: 'Gift cards',
//                         subtitle: 'Send or redeem a gift card',
//                         iconData: Icons.card_giftcard_outlined,
//                       ),
//                       const ProfileListTile(
//                         label: 'Refer a Host',
//                         subtitle: 'Earn \$15 for every new host you refer',
//                         iconData: Icons.attach_money_outlined,
//                       ),
//                       _buildSectionTitle('Tools'),
//                       const ProfileListTile(
//                         label: 'Siri settings',
//                         iconData: Icons.keyboard_voice_outlined,
//                       ),
//                       _buildSectionTitle('Support'),
//                       const ProfileListTile(
//                         label: 'How FlutterUI works',
//                         iconData: Icons.card_travel_outlined,
//                       ),
//                       const ProfileListTile(
//                         label: 'Safety Center',
//                         subtitle:
//                         'Get the support, tools, and information you need to be safe',
//                         iconData: Icons.shield,
//                       ),
//                       const ProfileListTile(
//                         label: 'Contact Neighborhood Support',
//                         subtitle:
//                         'Let our team know about concerns related to home sharing activity in your area.',
//                         iconData: Icons.question_answer_outlined,
//                       ),
//                       const ProfileListTile(
//                         label: 'Get help',
//                         iconData: Icons.help_outline,
//                       ),
//                       const ProfileListTile(
//                         label: 'Give us feedback',
//                         iconData: Icons.feedback_outlined,
//                       ),
//                       _buildSectionTitle('Legal'),
//                       const ProfileListTile(
//                         label: 'Terms of Service',
//                       ),
//                       const SizedBox(height: 24),
//                       const ProfileListTile(
//                         label: 'Log out',
//                         labelColor: Colors.teal,
//                       ),
//                       const SizedBox(height: 24),
//                       Center(
//                         child: Text(
//                           'VERSION 1.0.0',
//                           style: Theme.of(context).textTheme.labelSmall,
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSectionTitle(String label) {
//     return Column(
//       children: [
//         const SizedBox(height: 24),
//         Text(
//           label,
//           style: const TextStyle(fontSize: 12),
//         ),
//         const SizedBox(height: 8),
//       ],
//     );
//   }
// }
//
// class ProfileListTile extends StatelessWidget {
//   const ProfileListTile(
//       {required this.label,
//         this.labelColor = Colors.black,
//         this.subtitle,
//         this.iconData,
//         this.onTap,
//         Key? key})
//       : super(key: key);
//   final String label;
//   final Color labelColor;
//   final String? subtitle;
//   final IconData? iconData;
//   final Function? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           onTap: onTap as void Function()?,
//           contentPadding: EdgeInsets.zero,
//           title: Text(
//             label,
//             style: TextStyle(fontSize: 18, color: labelColor),
//           ),
//           subtitle: subtitle != null ? Text(subtitle!) : null,
//           trailing: iconData != null
//               ? Icon(
//             iconData,
//             color: Colors.grey[900],
//             size: 36,
//           )
//               : null,
//         ),
//         const Divider(thickness: .75),
//       ],
//     );
//   }
// }
//
// class InboxScreen extends StatelessElement {
//   const InboxScreen({Key? key}) : super(key: key);
//
//   @override
//   State<InboxScreen> createState() => _InboxScreenState();
// }
//
// class _InboxScreenState extends State<InboxScreen> {
//   late int activeTabIndex;
//
//   @override
//   void initState() {
//     super.initState();
//     activeTabIndex = 0;
//   }
//
//   setActiveTabIndex(int index) {
//     setState(() {
//       activeTabIndex = index;
//     });
//   }
//
//   Widget _buildMessagesTab() {
//     return Expanded(
//       child: ListView(
//         children: const [
//           Text(
//             'You have no unread messages',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             "When you contact a host or send a reservation request, you'll see your messages here",
//             style: TextStyle(
//               fontWeight: FontWeight.w300,
//               height: 1.4,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   List<Widget> _buildNotificationsTab() {
//     return [
//       const Expanded(
//         child: Align(
//           alignment: Alignment(0, -.15),
//           child: Text(
//             "You're all caught up",
//             style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: kHorizontalPadding,
//             vertical: kVerticalPadding,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const ScreenHeaderText(
//                 titleText: 'Inbox',
//               ),
//               const SizedBox(height: 32),
//               SimpleTextTabs(
//                 labels: const ['Messages', 'Notifications'],
//                 onTabChange: setActiveTabIndex,
//               ),
//               const SizedBox(height: 32),
//               [_buildMessagesTab(), ..._buildNotificationsTab()][activeTabIndex]
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class PlaceScreen extends StatefulWidget {
//   const PlaceScreen({required this.place, Key? key}) : super(key: key);
//   final Place place;
//
//   @override
//   State<PlaceScreen> createState() => _PlaceScreenState();
// }
//
// class _PlaceScreenState extends State<PlaceScreen> {
//   Place get place => widget.place;
//
//   late bool isFavorited;
//   @override
//   void initState() {
//     super.initState();
//     isFavorited = true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: const EdgeInsets.only(
//             left: kHorizontalPadding,
//             right: kHorizontalPadding,
//             top: 16,
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     textBaseline: TextBaseline.alphabetic,
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     children: [
//                       Text(
//                         '\$${place.costPerNight.toStringAsFixed(0)}',
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18),
//                       ),
//                       const Text(
//                         ' / night',
//                         style: TextStyle(),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 4),
//                   RatingRow(
//                       rating: place.rating,
//                       numberOfRatings: place.numberOfRatings),
//                 ],
//               ),
//               const Spacer(),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Theme.of(context).primaryColor,
//                   minimumSize: const Size(164, 52),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: const Text(
//                   'Check availability',
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             pinned: true,
//             backgroundColor: Colors.white,
//             leading: CircularIconButton(
//               iconData: Icons.close,
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               iconColor: Colors.grey[800],
//             ),
//             actions: [
//               CircularIconButton(
//                 iconData: Icons.ios_share,
//                 iconSize: 20,
//                 onPressed: () {},
//                 iconColor: Colors.grey[800],
//               ),
//               CircularIconButton(
//                 iconData: isFavorited ? Icons.favorite : Icons.favorite_border,
//                 iconSize: 20,
//                 onPressed: () {
//                   setState(() {
//                     isFavorited = !isFavorited;
//                   });
//                 },
//                 iconColor:
//                 isFavorited ? Theme.of(context).primaryColor : Colors.black,
//               ),
//               const SizedBox(
//                 width: 12,
//               ),
//             ],
//             flexibleSpace: FlexibleSpaceBar(
//               background: PageViewWithIndicators(
//                 type: IndicatorType.numbered,
//                 children: place.imageUrls
//                     .map((e) => Hero(
//                   tag: e,
//                   child: Image.network(
//                     e,
//                     fit: BoxFit.cover,
//                   ),
//                 ))
//                     .toList(),
//               ),
//             ),
//             expandedHeight: 280,
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: kHorizontalPadding, vertical: 24),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         place.title,
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: intersperse(
//                           const SizedBox(width: 6),
//                           [
//                             RatingRow(
//                               rating: place.rating,
//                               numberOfRatings: place.numberOfRatings,
//                             ),
//                             const Text('·'),
//                             if (place.owner.isSuperhost) ...[
//                               Icon(
//                                 Icons.verified,
//                                 color: Theme.of(context).primaryColor,
//                                 size: 20,
//                               ),
//                               const Text('Superhost'),
//                             ]
//                           ],
//                         ).toList(),
//                       ),
//                       const SizedBox(height: 8),
//                       Text('${place.city}, ${place.state}, ${place.country}'),
//                       const MyDivider(),
//                       Row(
//                         children: [
//                           Text(
//                             'Entire ${place.typeText}\nhosted by ${place.owner.name}',
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           const Spacer(),
//                           CircleAvatar(
//                             radius: 32,
//                             backgroundImage: NetworkImage(
//                               place.owner.profileImageUrl,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         children: [
//                           ...intersperse(
//                             const SizedBox(
//                               width: 12,
//                               child: Center(
//                                 child: Text('·'),
//                               ),
//                             ),
//                             [
//                               Text('${place.guestCount} guests'),
//                               Text(place.numGuestsText),
//                               Text(place.numBedsText),
//                               Text(place.numBathsText),
//                             ],
//                           ).toList(),
//                         ],
//                       ),
//                       const MyDivider(),
//                       ...intersperse(
//                         const SizedBox(
//                           height: 24,
//                         ),
//                         [
//                           PlaceDetailListTile(
//                             iconData: Icons.home_outlined,
//                             title: 'Entire home',
//                             subTitle:
//                             "You'll have the ${place.typeText} to yourself.",
//                           ),
//                           const PlaceDetailListTile(
//                             iconData: Icons.flare_outlined,
//                             title: 'Enhanced Clean',
//                             subTitle:
//                             "This host is committed to Flutter UI's 5-step enhanced cleaning process.",
//                           ),
//                           const PlaceDetailListTile(
//                             iconData: Icons.sensor_door_outlined,
//                             title: 'Self check-in',
//                             subTitle: 'Check yourself in with the keypad',
//                           ),
//                           const PlaceDetailListTile(
//                             iconData: Icons.calendar_today_outlined,
//                             title: 'Free cancellation for 48 hours',
//                             subTitle:
//                             'After that, cancel up to 7 days before check-in and get a 50% refund, minus the service fee.',
//                           ),
//                           const PlaceDetailListTile(
//                             iconData: Icons.gavel_outlined,
//                             title: 'House rules',
//                             subTitle: "This host doesn't allow smoking.",
//                           ),
//                         ],
//                       ),
//                       const MyDivider(),
//                       Text(
//                         place.description ?? loremIpsumText,
//                         maxLines: 5,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(fontSize: 16, height: 1.5),
//                       ),
//                       MaterialButton(
//                         onPressed: () {},
//                         padding: EdgeInsets.zero,
//                         child: Row(
//                           children: const [
//                             Text(
//                               'Show more',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w600,
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                             Icon(
//                               Icons.arrow_forward_ios,
//                               size: 12,
//                               color: Colors.black,
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       SizedBox(
//                         width: double.infinity,
//                         child: MaterialButton(
//                           onPressed: () {},
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             side: const BorderSide(
//                               color: Colors.black,
//                             ),
//                           ),
//                           child: const Text(
//                             'Contact host',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 64),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class PlaceDetailListTile extends StatelessWidget {
//   const PlaceDetailListTile(
//       {required this.iconData,
//         required this.title,
//         required this.subTitle,
//         Key? key})
//       : super(key: key);
//
//   final IconData iconData;
//   final String title;
//   final String subTitle;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(
//           iconData,
//           size: 36,
//         ),
//         const SizedBox(width: 12),
//         Flexible(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 subTitle,
//                 style: const TextStyle(fontWeight: FontWeight.w300),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class CircularIconButton extends StatelessWidget {
//   const CircularIconButton(
//       {this.iconData,
//         this.onPressed,
//         this.iconColor = Colors.black,
//         this.backgroundColor = Colors.white,
//         this.iconSize = 24,
//         this.radius = 36,
//         Key? key})
//       : super(key: key);
//   final IconData? iconData;
//   final Function? onPressed;
//   // Defaults to 36. This value should be larger than [iconSize]
//   final double radius;
//   // Defaults to 24. This value should be smaller than [radius]
//   final double iconSize;
//   final Color? iconColor;
//   final Color backgroundColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: onPressed as void Function()?,
//       color: iconColor,
//       padding: EdgeInsets.zero,
//       splashRadius: 24,
//       iconSize: iconSize,
//       icon: Container(
//         height: radius,
//         width: radius,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: backgroundColor,
//         ),
//         child: Icon(
//           iconData,
//         ),
//       ),
//     );
//   }
// }
//
// class PlaceListScreen extends StatelessWidget {
//   const PlaceListScreen({required this.placeList, Key? key}) : super(key: key);
//   final PlaceList placeList;
//
//   @override
//   Widget build(BuildContext context) {
//     buildCardTiles() {
//       List<Widget> widgets = placeList.savedPlaces
//           .map(
//             (p) => PlaceCardWidget(
//           place: p,
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => Theme(
//                   data: Theme.of(context),
//                   child: PlaceScreen(
//                     place: p,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       )
//           .toList();
//       return intersperse(const SizedBox(height: 32), widgets).toList();
//     }
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: const AppBarBackButton(),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(
//           horizontal: kHorizontalPadding,
//           vertical: 16,
//         ),
//         children: [
//           ScreenHeaderText(
//             titleText: placeList.title,
//           ),
//           const MyDivider(),
//           Text(
//             placeList.numStaysText,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//           const SizedBox(height: 16),
//           ...buildCardTiles(),
//           const SizedBox(height: kVerticalPadding),
//         ],
//       ),
//     );
//   }
// }
//
// class MyDivider extends StatelessWidget {
//   const MyDivider({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Divider(
//       height: 48,
//       thickness: 1,
//     );
//   }
// }
//
// class PlaceCardWidget extends StatelessWidget {
//   const PlaceCardWidget({required this.place, this.onTap, Key? key})
//       : super(key: key);
//   final Place place;
//   final Function? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     const TextStyle defaultTextTheme =
//     TextStyle(fontSize: 16, wordSpacing: 1, color: Colors.black);
//
//     return InkWell(
//       onTap: onTap as void Function()?,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: intersperse(
//             const SizedBox(
//               height: 6,
//             ),
//             [
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//                 clipBehavior: Clip.antiAlias,
//                 child: SizedBox(
//                   height: 225,
//                   child: Stack(
//                     children: [
//                       PageViewWithIndicators(
//                         children: place.imageUrls
//                             .map(
//                               (e) => Hero(
//                             tag: e,
//                             child: Image.network(
//                               e,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         )
//                             .toList(),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 8.0, horizontal: 8.0),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 4, horizontal: 8),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           child: const Text(
//                             'SUPERHOST',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: .75,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Align(
//                         alignment: Alignment.topRight,
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: StackedFavoriteButton(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               RatingRow(
//                 rating: place.rating,
//                 numberOfRatings: place.numberOfRatings,
//               ),
//               DefaultTextStyle(
//                 style: defaultTextTheme,
//                 child: Row(
//                   children: [
//                     Text('Entire ${place.typeText}'),
//                     const SizedBox(
//                       width: 12,
//                       child: Center(
//                         child: Text('·'),
//                       ),
//                     ),
//                     Text(place.numBedsText),
//                   ],
//                 ),
//               ),
//               Text(place.title, style: defaultTextTheme),
//               Row(children: [
//                 Text(
//                   '\$${place.costPerNight.toStringAsFixed(0)}',
//                   style: defaultTextTheme.copyWith(fontWeight: FontWeight.bold),
//                 ),
//                 const Text(
//                   ' / night',
//                   style: defaultTextTheme,
//                 )
//               ]),
//             ]).toList(),
//       ),
//     );
//   }
// }
//
// class RatingRow extends StatelessWidget {
//   const RatingRow(
//       {Key? key, required this.rating, required this.numberOfRatings})
//       : super(key: key);
//
//   final double? rating;
//   final int? numberOfRatings;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Icon(
//           Icons.star,
//           size: 20,
//           color: Theme.of(context).primaryColor,
//         ),
//         const SizedBox(width: 4),
//         Text(
//           rating.toString(),
//           style: const TextStyle(fontWeight: FontWeight.w500),
//         ),
//         const SizedBox(width: 4),
//         Text(
//           '(${numberOfRatings.toString()})',
//           style: const TextStyle(fontWeight: FontWeight.w300),
//         )
//       ],
//     );
//   }
// }
//
// class StackedFavoriteButton extends StatefulWidget {
//   const StackedFavoriteButton({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<StackedFavoriteButton> createState() => _StackedFavoriteButtonState();
// }
//
// class _StackedFavoriteButtonState extends State<StackedFavoriteButton> {
//   late bool isFavorited;
//
//   @override
//   void initState() {
//     super.initState();
//     isFavorited = true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 24,
//       width: 24,
//       child: Stack(
//         children: [
//           const Icon(
//             Icons.favorite,
//             color: Colors.white,
//           ),
//           IconButton(
//             padding: EdgeInsets.zero,
//             icon: Icon(Icons.favorite,
//                 color: isFavorited
//                     ? Theme.of(context).primaryColor
//                     : Colors.black.withOpacity(.7),
//                 size: 20),
//             onPressed: () {
//               setState(() {
//                 isFavorited = !isFavorited;
//               });
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
//
// enum IndicatorType { dots, numbered }
//
// class PageViewWithIndicators extends StatefulWidget {
//   const PageViewWithIndicators(
//       {required this.children, this.type = IndicatorType.dots, Key? key})
//       : super(key: key);
//   final List<Widget> children;
//   final IndicatorType type;
//
//   @override
//   State<PageViewWithIndicators> createState() => _PageViewWithIndicatorsState();
// }
//
// class _PageViewWithIndicatorsState extends State<PageViewWithIndicators> {
//   late int activeIndex;
//
//   @override
//   void initState() {
//     activeIndex = 0;
//     super.initState();
//   }
//
//   setActiveIndex(int index) {
//     setState(() {
//       activeIndex = index;
//     });
//   }
//
//   _buildDottedIndicators() {
//     List<Widget> dots = [];
//     const double radius = 8;
//
//     for (int i = 0; i < widget.children.length; i++) {
//       dots.add(
//         Container(
//           height: radius,
//           width: radius,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color:
//             i == activeIndex ? Colors.white : Colors.white.withOpacity(.6),
//           ),
//         ),
//       );
//     }
//     dots = intersperse(const SizedBox(width: 6), dots)
//         .toList(); // Add spacing between dots
//
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: dots,
//         ),
//       ),
//     );
//   }
//
//   _buildNumberedIndicators() {
//     return Align(
//       alignment: Alignment.bottomRight,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.black.withOpacity(.33),
//             borderRadius: BorderRadius.circular(4),
//           ),
//           padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
//           child: Text(
//             '${(activeIndex + 1).toString()} / ${widget.children.length.toString()}',
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 12,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         PageView(
//           onPageChanged: setActiveIndex,
//           children: widget.children,
//         ),
//         widget.type == IndicatorType.dots
//             ? _buildDottedIndicators()
//             : _buildNumberedIndicators(),
//       ],
//     );
//   }
// }
//
// class TripsScreen extends StatefulWidget {
//   const TripsScreen({this.navigateToExploreScreen, Key? key}) : super(key: key);
//   final Function? navigateToExploreScreen;
//
//   @override
//   State<TripsScreen> createState() => _TripsScreenState();
// }
//
// class _TripsScreenState extends State<TripsScreen> {
//   late int activeTabIndex;
//
//   @override
//   void initState() {
//     super.initState();
//     activeTabIndex = 0;
//   }
//
//   setActiveTab(int index) {
//     setState(() {
//       activeTabIndex = index;
//     });
//   }
//
//   List<Widget> _buildUpcomingTab() {
//     // Access stays where current time is in between time start and end and generate StayCardWidget from them; Otherwise you can show below
//     return [
//       RichText(
//         text: TextSpan(
//           style: const TextStyle(color: Colors.black),
//           text:
//           "When you're ready to plan your next trip, we're here to help. ",
//           children: [
//             TextSpan(
//               text: 'Learn more',
//               recognizer: TapGestureRecognizer()
//                 ..onTap = () {
//                   //Launch your site here
//                 },
//               style: const TextStyle(
//                 decoration: TextDecoration.underline,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//       const SizedBox(height: 32),
//       SizedBox(
//         height: 300,
//         child: Image.network(
//           campingImageUrl,
//           fit: BoxFit.cover,
//         ),
//       ),
//       const SizedBox(height: 32),
//       ElevatedButton(
//         onPressed: widget.navigateToExploreScreen as void Function()?,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.grey[900],
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         child: const Text(
//           'Explore Flutter UI',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//     ];
//   }
//
//   List<Widget> _buildPastTab() {
//     // Access stays for this profile with end time range in the past and create list of StayCardWidget from them.
//     return [
//       StayCardWidget(
//         stay: aspenStay,
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => Theme(
//               data: Theme.of(context),
//               child: PlaceScreen(
//                 place: aspenStay.place,
//               ),
//             ),
//           ),
//         ),
//       )
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           padding: const EdgeInsets.symmetric(
//             horizontal: kHorizontalPadding,
//             vertical: kVerticalPadding,
//           ),
//           children: [
//             const ScreenHeaderText(
//               titleText: 'Trips',
//             ),
//             const SizedBox(height: 32),
//             SimpleTextTabs(
//               labels: const ['Trips', 'Upcoming'],
//               onTabChange: setActiveTab,
//             ),
//             const SizedBox(height: 32),
//             ...[
//               _buildUpcomingTab(),
//               _buildPastTab(),
//             ][activeTabIndex],
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class StayCardWidget extends StatelessWidget {
//   const StayCardWidget({required this.stay, required this.onTap, Key? key})
//       : super(key: key);
//   final Stay stay;
//   final Function onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap as void Function()?,
//       child: SizedBox(
//         height: 350,
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           elevation: 6,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(14),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Expanded(
//                 child: Image.network(stay.place.imageUrls.first,
//                     fit: BoxFit.cover),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: kHorizontalPadding, vertical: 32),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         stay.durationText,
//                         style: const TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.w300,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         stay.place.city,
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       SizedBox(
//                         height: 42,
//                         child: ListTile(
//                           contentPadding: EdgeInsets.zero,
//                           leading: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: Image.network(
//                               stay.place.imageUrls.first,
//                             ),
//                           ),
//                           title: Text(
//                             stay.place.title,
//                             style: const TextStyle(
//                               fontSize: 14,
//                             ),
//                           ),
//                           trailing:
//                           const Icon(Icons.arrow_forward_ios, size: 14),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SimpleTextTabs extends StatefulWidget {
//   const SimpleTextTabs(
//       {required this.labels, required this.onTabChange, Key? key})
//       : super(key: key);
//
//   final List<String> labels;
//   final Function(int) onTabChange;
//
//   @override
//   State<SimpleTextTabs> createState() => _SimpleTextTabsState();
// }
//
// class _SimpleTextTabsState extends State<SimpleTextTabs> {
//   late int selectedIndex;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedIndex = 0;
//   }
//
//   callback() {
//     // if (widget.onTabChange != null)
//     widget.onTabChange(selectedIndex);
//   }
//
//   setSelectedIndex(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//     callback();
//   }
//
//   Widget _buildIndividualTab({required String label, Function()? onTap}) {
//     int indexOfLabel = widget.labels.indexOf(label);
//     bool isActive = selectedIndex == indexOfLabel;
//
//     return GestureDetector(
//       onTap: () {
//         setSelectedIndex(indexOfLabel);
//       },
//       child: Container(
//         height: 36,
//         decoration: BoxDecoration(
//           border: isActive
//               ? const Border(
//             bottom: BorderSide(
//               width: 2,
//             ),
//           )
//               : null,
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             color: isActive ? Colors.black : Colors.black.withOpacity(.6),
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<Widget> _buildTextTabs() {
//     return widget.labels.map((label) {
//       return _buildIndividualTab(
//           label: label,
//           onTap: () {
//             setSelectedIndex(widget.labels.indexOf(label));
//           });
//     }).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: intersperse(
//             const SizedBox(width: 24),
//             _buildTextTabs(),
//           ).toList(),
//         ),
//         const Divider(height: 0, thickness: 1),
//       ],
//     );
//   }
// }
//
// class SavedScreen extends StatelessWidget {
//   const SavedScreen({required this.savedLists, Key? key}) : super(key: key);
//   final List<PlaceList> savedLists;
//
//   List<Widget> _buildSavedListWidgets(BuildContext context) {
//     List<Widget> widgets = savedLists.map((list) {
//       List<String> chosenImages = [];
//       Map<int, Queue<String>> placeImageMapping = {};
//       for (var place in list.savedPlaces) {
//         placeImageMapping[place.hashCode] = Queue.from(place.imageUrls);
//       }
//
//       bool keepGoing;
//       do {
//         keepGoing = false;
//         for (var entry in placeImageMapping.entries) {
//           if (entry.value.isNotEmpty) {
//             chosenImages.add(entry.value.removeFirst());
//           }
//           if (entry.value.isNotEmpty) keepGoing = true;
//         }
//       } while (keepGoing);
//
//       return SizedBox(
//         height: 280,
//         child: FeaturedImagesCard(
//           imageUrls: chosenImages,
//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => Theme(
//                 data: Theme.of(context),
//                 child: PlaceListScreen(
//                   placeList: list,
//                 ),
//               ),
//             ),
//           ),
//           titleText: list.title,
//           subtitleText: list.numStaysText,
//         ),
//       );
//     }).toList();
//
//     return intersperse(const SizedBox(height: 24), widgets).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: ListView(
//         padding: const EdgeInsets.symmetric(
//           horizontal: kHorizontalPadding,
//           vertical: kVerticalPadding,
//         ),
//         children: [
//           const ScreenHeaderText(titleText: 'Saved'),
//           const SizedBox(height: 16),
//           ..._buildSavedListWidgets(context),
//         ],
//       ),
//     );
//   }
// }
//
// /// Widget that features up to 3 images on a card. Contains a bottom portion to allow for title and subtitle text
// ///
// /// Looks best with 3 images but can take any number. If given more than 3 urls, it will still only use the first 3.
// ///
// /// Comes with `onTap` function using an Inkwell. Typically used to navigate to a new screen.
// ///
// /// The first image is wrapped with a `Hero` where the id is the image url. You can use this to animate the image to the next screen.
// /// Widget that features up to 3 images on a card. Contains a bottom portion to allow for title and subtitle text
// ///
// /// Looks best with 3 images but can take any number. If given more than 3 urls, it will still only use the first 3.
// ///
// /// Comes with `onTap` function using an Inkwell. Typically used to navigate to a new screen.
// ///
// /// The first image is wrapped with a `Hero` where the id is the image url. You can use this to animate the image to the next screen.
// class FeaturedImagesCard extends StatelessWidget {
//   const FeaturedImagesCard(
//       {required this.imageUrls,
//         required this.titleText,
//         required this.subtitleText,
//         required this.onTap,
//         Key? key})
//       : super(key: key);
//
//   final List<String> imageUrls;
//   final String titleText;
//   final String subtitleText;
//   final Function onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     const double imageSpacing =
//     2; // Small sliver of whitespace between the images
//
//     return Card(
//       elevation: 6,
//       clipBehavior: Clip.antiAlias,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: InkWell(
//         onTap: onTap as void Function()?,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 2,
//               child: Row(
//                 children: [
//                   if (imageUrls.isNotEmpty) ...[
//                     Expanded(
//                       flex: 3,
//                       child: Hero(
//                         tag: imageUrls[0],
//                         child: Image.network(
//                           imageUrls[0],
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ] else
//                     const SizedBox.shrink(),
//                   if (imageUrls.length >= 2) ...[
//                     const SizedBox(width: imageSpacing),
//                     Expanded(
//                       flex: 1,
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Image.network(
//                               imageUrls[1],
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           if (imageUrls.length >= 3) ...[
//                             const SizedBox(height: imageSpacing),
//                             Expanded(
//                               child: Image.network(
//                                 imageUrls[2],
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                             )
//                           ] else
//                             const SizedBox.shrink(),
//                         ],
//                       ),
//                     )
//                   ] else
//                     const SizedBox.shrink(),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // if (titleText != null && titleText.isNotEmpty)
//                     if (titleText.isNotEmpty) ...[
//                       Text(
//                         titleText,
//                         style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                     // if (subtitleText != null && subtitleText.isNotEmpty)
//                     if (subtitleText.isNotEmpty) ...[
//                       const SizedBox(height: 6),
//                       Text(
//                         subtitleText,
//                         style: const TextStyle(
//                           fontSize: 12,
//                         ),
//                       ),
//                     ]
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ExploreScreen extends StatelessWidget {
//   const ExploreScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         const CustomSliverAppBar(),
//         SliverList(
//           delegate: SliverChildListDelegate(
//             [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   SizedBox(height: 32),
//                   SectionTitle(text: 'Explore nearby'),
//                   SizedBox(height: 24),
//                   ExploreCityGrid(),
//                   SizedBox(height: 48),
//                   SectionTitle(
//                     text: 'Live anywhere',
//                   ),
//                   SizedBox(height: 24),
//                   LiveAnywhereComponent(),
//                   SizedBox(height: 32),
//                   SectionTitle(
//                     text: 'Experience the world',
//                     subtitle:
//                     'Unique activities with local experts—in person or online',
//                   ),
//                   SizedBox(height: 24),
//                   ExperienceTheWorldComponent(),
//                   SizedBox(height: 24)
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({Key? key}) : super(key: key);
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   late String searchInput;
//   late TextEditingController _textEditingController;
//
//   @override
//   void initState() {
//     searchInput = '';
//     _textEditingController = TextEditingController();
//     super.initState();
//   }
//
//   void setSearchInput(String value) {
//     setState(() {
//       searchInput = value;
//     });
//   }
//
//   double rowheight = 75;
//   double spacingHeight = 16;
//   List<Widget> _buildCityWidgets() {
//     var filteredCityWidgets = cityWidgets
//         .where((city) =>
//         city.title.toLowerCase().contains(searchInput.toLowerCase()))
//         .map((w) => SizedBox(height: rowheight, child: w));
//
//     return intersperse(SizedBox(height: spacingHeight), filteredCityWidgets)
//         .toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var cityWidgets = _buildCityWidgets();
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: const AppBarBackButton(),
//         title: TextField(
//           autofocus: true,
//           textAlignVertical: TextAlignVertical.center,
//           textInputAction: TextInputAction.search,
//           controller: _textEditingController,
//           onChanged: setSearchInput,
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: 'Where are you going?',
//             suffixIcon: IconButton(
//               icon: Icon(
//                 Icons.close,
//                 color: Theme.of(context).primaryColor,
//               ),
//               onPressed: () {
//                 _textEditingController.clear();
//                 setSearchInput('');
//               },
//             ),
//           ),
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
//         children: [
//           SizedBox(
//             height: rowheight,
//             child: const RowTileWithImage(
//               title: 'Explore nearby destinations',
//               imageUrl: locationImageUrl,
//             ),
//           ),
//           const SizedBox(height: 32),
//           const Text(
//             'GETAWAYS NEAR YOU',
//             style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: spacingHeight),
//           ...cityWidgets
//         ],
//       ),
//     );
//   }
// }
//
// class AppBarBackButton extends StatelessWidget {
//   const AppBarBackButton({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Icon(
//         Icons.arrow_back_ios,
//         color: Colors.grey[800],
//       ),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );
//   }
// }
//
// class LiveAnywhereComponent extends StatelessWidget {
//   const LiveAnywhereComponent({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     const liveAnywhereWidgets = [
//       LargeTitledImageWidget(
//         text: 'Entire homes',
//         imageUrl: modernHouseImageUrl,
//       ),
//       LargeTitledImageWidget(
//         text: 'Unique stays',
//         imageUrl: uniqueLakeCabinImageUrl,
//       ),
//       LargeTitledImageWidget(
//         text: 'Cabins and cottages',
//         imageUrl: cabinImageUrl,
//       ),
//       LargeTitledImageWidget(
//         text: 'Pets allowed',
//         imageUrl: dogBeingLovedImageUrl,
//       )
//     ];
//     return const LargeTitledImageListView(widgets: liveAnywhereWidgets);
//   }
// }
//
// class ExperienceTheWorldComponent extends StatelessWidget {
//   const ExperienceTheWorldComponent({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     const widgets = [
//       LargeTitledImageWidget(
//         text: 'Online Experiences',
//         subtitle: 'AirbnbClone the world without leaving home.',
//         imageUrl: elderlyCoupleTabletImageUrl,
//       ),
//       LargeTitledImageWidget(
//         text: 'Experiences',
//         subtitle: 'Things to do wherever you are.',
//         imageUrl: couplePotteryImageUrl,
//       ),
//       LargeTitledImageWidget(
//         text: 'Adventures',
//         subtitle: 'Multi-day trips with meals and stays.',
//         imageUrl: womanCliffImageUrl,
//       ),
//     ];
//     return const LargeTitledImageListView(widgets: widgets);
//   }
// }
//
// class LargeTitledImageListView extends StatelessWidget {
//   const LargeTitledImageListView({required this.widgets, Key? key})
//       : super(key: key);
//   final List<LargeTitledImageWidget> widgets;
//
//   @override
//   Widget build(BuildContext context) {
//     return LimitedBox(
//       maxHeight: 360,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: widgets.length,
//         padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
//         itemBuilder: (_, index) => widgets[index],
//         separatorBuilder: (_, index) => const SizedBox(width: 12),
//       ),
//     );
//   }
// }
//
// class LargeTitledImageWidget extends StatelessWidget {
//   const LargeTitledImageWidget(
//       {required this.text, this.subtitle, required this.imageUrl, Key? key})
//       : super(key: key);
//
//   final String text;
//   final String? subtitle;
//   final String imageUrl;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Flexible(
//           child: AspectRatio(
//             aspectRatio: 1,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.network(
//                 imageUrl,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         Text(
//           text,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(subtitle ?? ''),
//       ],
//     );
//   }
// }
//
// class ExploreCityGrid extends StatelessWidget {
//   const ExploreCityGrid({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: GridView.count(
//           crossAxisCount: 2,
//           crossAxisSpacing: 14,
//           childAspectRatio: .33,
//           padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
//           scrollDirection: Axis.horizontal,
//           children: cityWidgets),
//     );
//   }
// }
//
// class CustomSliverAppBar extends StatefulWidget {
//   const CustomSliverAppBar({Key? key}) : super(key: key);
//
//   @override
//   State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
// }
//
// class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
//   late bool isToolbarCollapsed;
//
//   @override
//   void initState() {
//     super.initState();
//     isToolbarCollapsed = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const double expandedHeight = 600;
//     const offset = Offset(36, -42);
//     const double textSize = 30;
//
//     return SliverAppBar(
//       foregroundColor: Colors.white,
//       title: ElevatedButton(
//         onPressed: () => Navigator.push(
//           context,
//           createRoute(const SearchScreen(), context),
//         ),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: isToolbarCollapsed ? Colors.grey[100] : Colors.white,
//           padding: const EdgeInsets.symmetric(vertical: 12),
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(100), // As rounded as possible
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.search, color: Theme.of(context).primaryColor),
//             const SizedBox(
//               width: 4,
//             ),
//             const Text(
//               'Where are you going?',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 15,
//               ),
//             ),
//           ],
//         ),
//       ),
//       pinned: true,
//       backgroundColor: isToolbarCollapsed ? Colors.white : Colors.black,
//       expandedHeight: expandedHeight,
//       collapsedHeight: 68,
//       flexibleSpace: LayoutBuilder(
//         builder: (context, constraints) {
//           SchedulerBinding.instance.addPostFrameCallback((_) {
//             if (!isToolbarCollapsed && constraints.biggest.height <= 130) {
//               setState(() {
//                 isToolbarCollapsed = true;
//               });
//             } else if (isToolbarCollapsed && constraints.biggest.height > 130) {
//               setState(() {
//                 isToolbarCollapsed = false;
//               });
//             }
//           });
//           return FlexibleSpaceBar(
//             background: Transform.translate(
//               offset: offset,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Image.network(
//                     cabinImageUrl,
//                   ),
//                   const Positioned(
//                     left: 0,
//                     bottom: 0,
//                     child: Text(
//                       'Made possible\nby Hosts',
//                       style: TextStyle(color: Colors.white, fontSize: textSize),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class RowTileWithImage extends StatelessWidget {
//   const RowTileWithImage(
//       {required this.title,
//         this.subtitle = '',
//         required this.imageUrl,
//         this.onTap,
//         Key? key})
//       : super(key: key);
//   final String title;
//
//   /// Currently being used to show how far of a drive the destination is
//   final String subtitle;
//   final String imageUrl;
//   final Function? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap as void Function()?,
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           AspectRatio(
//             aspectRatio: 1,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(18),
//               child: Image.network(
//                 imageUrl,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 12,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               if (subtitle.isNotEmpty) ...[
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 Text(subtitle)
//               ],
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ScreenHeaderText extends StatelessWidget {
//   const ScreenHeaderText({required this.titleText, Key? key}) : super(key: key);
//   final String titleText;
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       titleText,
//       style: const TextStyle(
//         fontSize: 28,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
// }
//
// class SectionTitle extends StatelessWidget {
//   const SectionTitle({required this.text, this.subtitle, Key? key})
//       : super(key: key);
//   final String text;
//   final String? subtitle;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             text,
//             style: const TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           if (subtitle != null && subtitle!.isNotEmpty) ...[
//             const SizedBox(height: 8),
//             Text(
//               subtitle!,
//               style: const TextStyle(letterSpacing: -.25),
//             )
//           ]
//         ],
//       ),
//     );
//   }
// }
//
// Route createRoute(Widget screen, BuildContext prevContext) {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) =>
//         Theme(data: Theme.of(prevContext), child: screen),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       var curve = Curves.ease;
//
//       var tween = Tween(begin: 0.0, end: 1.0)
//           .animate(CurvedAnimation(parent: animation, curve: curve));
//
//       return ScaleTransition(
//         scale: tween,
//         child: child,
//       );
//     },
//   );
// }
//
// // Models
//
// enum PlaceType { apartment, condominium, townhome, house, cabin }
//
// /// Represents a place to stay.
// class Place {
//   final String title;
//   final PlaceType type;
//   final String? description;
//
//   final String city;
//   final String state;
//   final String country;
//   final String address;
//   final String zipcode;
//
//   /// List of images showcasing the place. The first in the list is used as the feature image.
//   final List<String> imageUrls;
//   final double rating;
//   final int numberOfRatings;
//   final double costPerNight;
//   final int guestCount;
//   final int bedroomCount;
//   final int bedCount;
//   final int bathCount;
//   final Profile owner;
//
//   String get numBedsText => "$bedCount bed${bedCount == 1 ? "" : "s"}";
//   String get numGuestsText => "$guestCount guest${guestCount == 1 ? "" : "s"}";
//   String get numBedroomText =>
//       "$bedroomCount bedroom${bedroomCount == 1 ? "" : "s"}";
//   String get numBathsText => "$bathCount bath${bathCount == 1 ? "" : "s"}";
//
//   String get typeText => type.toString().split('.')[1];
//
//   const Place({
//     required this.title,
//     required this.type,
//     required this.city,
//     required this.state,
//     required this.address,
//     required this.zipcode,
//     required this.country,
//     required this.imageUrls,
//     required this.rating,
//     required this.numberOfRatings,
//     required this.costPerNight,
//     required this.guestCount,
//     required this.bedroomCount,
//     required this.bedCount,
//     required this.bathCount,
//     this.description,
//     required this.owner,
//   });
// }
//
// class Stay {
//   final Place place;
//   final List<Profile> people;
//   final DateTimeRange dateTimeRange;
//
//   String get durationText =>
//       '${monthMap[dateTimeRange.start.month]} ${dateTimeRange.start.day.toString()} — ${dateTimeRange.end.day.toString()}';
//
//   Stay(
//       {required this.place, required this.dateTimeRange, required this.people});
// }
//
// /// Represents a custom list of places favorite by the user. The user may create multiple lists.
// /// E.g. A list for saved trips for Colorado and a separate list for saved trips to California
// class PlaceList {
//   final String title;
//   final List<Place> savedPlaces;
//   String get numStaysText =>
//       "${savedPlaces.length} stay${savedPlaces.length == 1 ? "" : "s"}";
//
//   const PlaceList({required this.title, required this.savedPlaces});
// }
//
// class Profile {
//   final String name;
//   final String profileImageUrl;
//   final bool isSuperhost;
//
//   const Profile(
//       {required this.name,
//         required this.profileImageUrl,
//         required this.isSuperhost});
// }
//
// // Demo data
//
// const Profile zachProfile = Profile(
//   name: 'Zach',
//   profileImageUrl: zachTwitterImageUrl,
//   isSuperhost: true,
// );
//
// const List<RowTileWithImage> cityWidgets = [
//   RowTileWithImage(
//     title: 'Dallas',
//     subtitle: '15 minute drive',
//     imageUrl: cityImageUrl,
//   ),
//   RowTileWithImage(
//     title: 'Hot Springs',
//     subtitle: '4.5 hour drive',
//     imageUrl: lakeImageUrl,
//   ),
//   RowTileWithImage(
//     title: 'Austin',
//     subtitle: '3 hour drive',
//     imageUrl: scooterImageUrl,
//   ),
//   RowTileWithImage(
//     title: 'Galveston',
//     subtitle: '4 hour drive',
//     imageUrl: beachImageUrl,
//   ),
//   RowTileWithImage(
//     title: 'Canyon Lake',
//     subtitle: '5 hour drive',
//     imageUrl: waterfallImageUrl,
//   ),
//   RowTileWithImage(
//     title: 'Broken Bow',
//     subtitle: '4 hour drive',
//     imageUrl: lakeImageUrl,
//   ),
// ];
//
// const Place austinPlace1 = Place(
//     title: 'Apartment home deep in the heart of Austin',
//     type: PlaceType.apartment,
//     city: 'Austin',
//     state: 'Texas',
//     address: '123 Main St.',
//     zipcode: '123456',
//     country: 'United States',
//     imageUrls: apartmentImages,
//     bathCount: 1,
//     bedCount: 1,
//     bedroomCount: 1,
//     costPerNight: 102,
//     guestCount: 3,
//     numberOfRatings: 72,
//     rating: 4.3,
//     owner: zachProfile);
//
// const Place austinPlace2 = Place(
//     title: 'Entire condominium near 6th!',
//     type: PlaceType.condominium,
//     city: 'Austin',
//     state: 'Texas',
//     address: '612 State St.',
//     zipcode: '123456',
//     country: 'United States',
//     imageUrls: condoImages,
//     bathCount: 2,
//     bedCount: 2,
//     bedroomCount: 2,
//     costPerNight: 162,
//     guestCount: 5,
//     numberOfRatings: 102,
//     rating: 4.7,
//     owner: zachProfile);
//
// const Place aspen = Place(
//     title: 'Cozy Cabin in Aspen',
//     type: PlaceType.cabin,
//     city: 'Aspen',
//     state: 'Colorado',
//     address: '123 Grizzly Dr.',
//     zipcode: '123456',
//     country: 'United States',
//     imageUrls: [cabinImageUrl, fireplaceImageUrl, emptyRoomImageUrl],
//     bathCount: 2,
//     bedCount: 3,
//     bedroomCount: 2,
//     costPerNight: 201,
//     guestCount: 6,
//     numberOfRatings: 802,
//     rating: 4.8,
//     owner: zachProfile);
//
// const PlaceList austinList =
// PlaceList(title: 'Austin', savedPlaces: [austinPlace1, austinPlace2]);
//
// const PlaceList aspenList =
// PlaceList(title: 'Aspen, Colorado', savedPlaces: [aspen]);
//
// Stay aspenStay = Stay(
//   place: aspen,
//   people: [zachProfile],
//   dateTimeRange: DateTimeRange(
//     start: DateTime(2020, 3, 13),
//     end: DateTime(2020, 3, 15),
//   ),
// );
//
// // Util
//
// // Copied from https://github.com/modulovalue/dart_intersperse/blob/master/lib/src/intersperse.dart
// /// Puts [element] between every element in [list].
// Iterable<T> intersperse<T>(T element, Iterable<T> iterable) sync* {
//   final iterator = iterable.iterator;
//   if (iterator.moveNext()) {
//     yield iterator.current;
//     while (iterator.moveNext()) {
//       yield element;
//       yield iterator.current;
//     }
//   }
// }
//
// const Map<int, String> monthMap = {
//   1: 'Jan',
//   2: 'Feb',
//   3: 'March',
//   4: 'April',
//   5: 'May',
//   6: 'June',
//   7: 'July',
//   8: 'Aug',
//   9: 'Sept',
//   10: 'Oct',
//   11: 'Nov',
//   12: 'Dec'
// };
