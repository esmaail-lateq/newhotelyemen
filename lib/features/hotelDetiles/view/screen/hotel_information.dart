import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/app_string.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/features/home/data/hotel_modle.dart';
import 'package:newhotelyemeni/features/hotelDetiles/controller/hotelsdetails_controller.dart';
import 'package:newhotelyemeni/features/hotelDetiles/view/widget/small_loaction_map.dart';

class HotleInformation extends StatelessWidget {
  final TabController tabController;
  final HotelsModle hotelsModle;
  const HotleInformation(
      {super.key, required this.tabController, required this.hotelsModle});

  @override
  Widget build(BuildContext context) {
    HotelsDetailsController controller = Get.put(HotelsDetailsController());
    List<String> serviceList = hotelsModle.services == null
        ? []
        : hotelsModle.services!.split(',').map((e) => e.trim()).toList();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          tabController.animateTo(1);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
                color: AppColors.text4,
                borderRadius: BorderRadius.circular(12)),
            child: Text(
              AppString.choseYourRoom,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  child: Column(
                    children: [
                      Container(
                          height: 150,
                          child: SmallLoactionMap(
                            hotelsModle: hotelsModle,
                          )),
                      Container(
                          // height: 150,
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text(
                              '${hotelsModle.country!} _ ${hotelsModle.city!} _ ${hotelsModle.address!}')
                        ],
                      )),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppString.hotelServes,
                    style: TextThemsCustom.font22BlackBolde,
                  )),
              SizedBox(
                height: 5,
              ),
              serviceList.isEmpty
                  ? Text(AppString.noService)
                  : Container(
                      // width: 200,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 0.5)),
                      child: GridView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 30, crossAxisCount: 2),
                        children: serviceList.map(
                          (e) {
                            final info = controller.serviceInfo[e];
                            if (info == null) return SizedBox();
                            return buildHotelService(
                                info['icon'], info['lable']);
                          },
                        ).toList(),
                        // [
                        //   buildHotelService(Icons.wifi, 'انترنت'),
                        //   buildHotelService(Icons.pool_rounded, 'مسبح'),
                        //   buildHotelService(
                        //       Icons.local_parking_outlined, 'موقف سيارات'),
                        //   buildHotelService(Icons.restaurant, 'مصطعم'),
                        //   buildHotelService(
                        //       Icons.fastfood_rounded, 'الطعام والشراب'),
                        //   buildHotelService(Icons.shop_2_outlined, 'اسواق محلية'),
                        //   buildHotelService(
                        //       Icons.family_restroom_outlined, 'مناسب للعائلة'),
                        //   // buildHotelService(Icons.wifi, 'انترنت'),
                        // ],
                      )),
              SizedBox(
                height: 15,
              ),
              Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppString.hotelDecribe,
                    style: TextThemsCustom.font22BlackBolde,
                  )),
              SizedBox(
                height: 5,
              ),
              Container(
                // width: 200,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey, width: 0.5)),
                child: ExpandableText(
                  hotelsModle.description!,
                  expandText: 'عرض المزيد',
                  collapseText: 'اخفاء',
                  maxLines: 4,
                  linkColor: Colors.blue,
                  animation: true,
                  collapseOnTextTap: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // margin: EdgeInsets.only(bottom: 100),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey, width: 0.5)),
                child: Column(
                  children: [
                    buildExpandedText('معلومات مهمة',
                        'lug,lhj odkfgldfglkg dfkldfkg lkgldk lkdflkdsljd fg'),
                    buildExpandedText('معلومات مهمة',
                        'lug,lhj odkfgldfglkg dfkldfkg lkgldk lkdflkdsljd fg'),
                  ],
                ),
              ),
              SizedBox(
                height: 110,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHotelService(var icon, var servic) {
    return Row(
      children: [
        Icon(
          icon,
          size: 23,
          color: Colors.grey,
        ),
        SizedBox(
          width: 5,
        ),
        Text(servic)
      ],
    );
  }
}

Widget buildExpandedText(String title, String body) {
  return ExpansionTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      children: [
        ListTile(
          // selectedTileColor: Colorapp.avatarBackground,
          // focusColor: Colorapp.avatarBackground,
          // tileColor: AppColors.background,
          // hoverColor: Colorapp.avatarBackground,
          // splashColor: Colorapp.avatarBackground,
          // selectedColor: Colorapp.avatarBackground,
          minVerticalPadding: 5,
          minTileHeight: 20,
          title: Text(
            // maxLines: ,
            // softWrap: true,lskdjksdjfklj
            // overflow: TextOverflow.ellipsis,
            body,
            style: const TextStyle(fontSize: 13),
          ),
          // trailing: Icon(Icons.edit),
          onTap: () {},
        )
      ]);
}
