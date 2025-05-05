import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/features/MyReservations/booking_screen.dart';
import 'package:newhotelyemeni/features/home/data/model/hotel_model.dart';
import 'package:newhotelyemeni/features/hotelDetiles/view/hotel_information.dart';
import 'package:newhotelyemeni/features/hotelDetiles/view/rooms_hotel.dart';
import 'package:newhotelyemeni/features/hotelDetiles/view/widget/cutom_appbar.dart';
import 'package:newhotelyemeni/features/hotelDetiles/view/widget/small_loaction_map.dart';
import 'package:newhotelyemeni/features/hotelDetiles/view/widget/top_page_section.dart';
import 'package:newhotelyemeni/features/hotelDetiles/hotel_details_screen.dart';
import 'package:expandable_text/expandable_text.dart';

class HotelDetailsScreenNew extends StatefulWidget {
  const HotelDetailsScreenNew({super.key});

  @override
  State<HotelDetailsScreenNew> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<HotelDetailsScreenNew>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  double _headerHeight = 330;
  bool _isTabBarVisible = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final scrollOffset = _scrollController.offset;
    final triggerOffset = _headerHeight - kToolbarHeight;

    if (scrollOffset >= triggerOffset && !_isTabBarVisible) {
      setState(() => _isTabBarVisible = true);
    } else if (scrollOffset < triggerOffset && _isTabBarVisible) {
      setState(() => _isTabBarVisible = false);
    }
  }

  final List<ModelHotel> hoteldata = [
    ModelHotel(
        addressCity: 'صنعاء',
        addressCuntry: 'adsa',
        addressHotelid: 'asdsa',
        addressId: '1',
        addressStreet: 'شارع الستين',
        hotelDescription: 'askjxk',
        hotelId: '65',
        hotelImage: 'assets/images/test2.png',
        hotelName: 'ajhxs',
        hotelNamear: 'فايف استار',
        hotelRating: '4.5',
        hotelDescriptionar: 'khk',
        addressLat: '565',
        addressLong: '565'),
    ModelHotel(
        addressCity: 'صنعاء',
        addressCuntry: 'adsa',
        addressHotelid: 'asdsa',
        addressId: '1',
        addressStreet: 'جولة عمران',
        hotelDescription: 'askjxk',
        hotelId: '65',
        hotelImage: 'assets/images/test7.png',
        hotelName: 'ajhxs',
        hotelNamear: 'فندق عمران',
        hotelRating: '4.5',
        hotelDescriptionar: 'khk',
        addressLat: '565',
        addressLong: '565'),
    ModelHotel(
        addressCity: 'صنعاء',
        addressCuntry: 'adsa',
        addressHotelid: 'asdsa',
        addressId: '1',
        addressStreet: 'حدة',
        hotelDescription: 'askjxk',
        hotelId: '65',
        hotelImage: 'assets/images/test6.webp',
        hotelName: 'ajhxs',
        hotelNamear: 'فندق حدة',
        hotelRating: '4.5',
        hotelDescriptionar: 'khk',
        addressLat: '565',
        addressLong: '565'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(150),
            child: buildCustomAppBar('فندق فايف استار')),
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              toolbarHeight: 1,
              forceMaterialTransparency: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              floating: true,
              automaticallyImplyLeading: false,
              expandedHeight: _headerHeight,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // buildCustomAppBar('فندق فايف استار'),
                      buildImageSlider(),
                      buildHotelInfo(),
                    ]),
              ),
              pinned: false,
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickyTabBarDelegate(
                tabBar: TabBar(
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: false,
                  controller: _tabController,
                  automaticIndicatorColorAdjustment: true,
                  // indicatorPadding: const EdgeInsets.symmetric(horizontal: 0),
                  indicatorColor: AppColors.text4,
                  labelColor: AppColors.text4,
                  unselectedLabelColor: Colors.grey,
                  // automaticIndicatorColorAdjustment: false,
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Tab(
                      text: "معلومات الفندق",
                    ),
                    Tab(text: "اختر غرفتك"),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: [
              BookingScreen(
                hotel: {},
              ),
              // HotleInformation(
              //   tabController: _tabController,
              // ),
              RoomsHotel(),

              // _TabContent(title: 'خريطة الموقع'),
            ],
          ),
        ),
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _StickyTabBarDelegate({required this.tabBar});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) => false;
}
