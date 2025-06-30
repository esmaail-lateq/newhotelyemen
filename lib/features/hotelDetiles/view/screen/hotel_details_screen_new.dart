import 'package:flutter/material.dart';
import 'package:newhotelyemeni/core/consttint/app_string.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/features/home/data/hotel_modle.dart';
import 'package:newhotelyemeni/features/hotelDetiles/view/screen/hotel_information.dart';
import 'package:newhotelyemeni/features/rooms/rooms_hotel.dart';
import 'package:newhotelyemeni/features/hotelDetiles/view/widget/cutom_appbar.dart';
import 'package:newhotelyemeni/features/hotelDetiles/view/widget/top_page_section.dart';

class HotelDetailsScreenNew extends StatefulWidget {
  final HotelsModle hotelsModle;
  const HotelDetailsScreenNew({super.key, required this.hotelsModle});

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(150),
            child: BuildCustomAppBar(hotelName: widget.hotelsModle.name!)),
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
                      BuildImageSlider(
                        hotleData: widget.hotelsModle,
                      ),
                      buildHotelInfo(double.parse(widget.hotelsModle.rating!)),
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
                      text: AppString.hotileDitels,
                    ),
                    Tab(text: AppString.choseYourRoom),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: [
              // BookingScreen(
              //   hotel: {},
              // ),
              HotleInformation(
                tabController: _tabController,
                hotelsModle: widget.hotelsModle,
              ),
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
