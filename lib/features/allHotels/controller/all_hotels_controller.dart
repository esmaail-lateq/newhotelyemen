import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/class/failer.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/function/user_city_location_mang.dart';
import 'package:newhotelyemeni/features/home/data/home_data.dart';
import 'package:newhotelyemeni/features/home/data/hotel_modle.dart';

class AllHotelsController extends GetxController {
  HomeData homeData = HomeData(Get.find());

  final List<HotelsModle> hoteldata = [];

  StatusRquest statusRquest = StatusRquest.nune;
  int? selectcate;

  // chaingCateo(int index, String cato) {
  //   selectcate = index;
  //   getHotelItems(cato);
  //   update();
  // }

  Future<void> filterData({Map<String, dynamic>? filterData}) async {
    _prepareForFetch();
    print(filterData);

    try {
      final response = await homeData.getData(filterData ?? {});
      _handleResponse(response);
    } catch (e) {
      _handleError(e);
    }

    update();
  }

  // Future<void> refresh() async {
  //   await filterData();
  // }

  // getHotelItems(String cateo) async {
  //   hotelitems.clear();
  //   update();
  //   statusRquest = StatusRquest.loading;
  //   update();
  //   var response = await hotelItemsData.postData(cateo);
  //   statusRquest = handling(response);
  //   update();
  //   if (statusRquest == StatusRquest.success) {
  //     if (response['status'] == "success") {
  //       List responsedata = response['data'];
  //       hotelitems.addAll(responsedata.map((e) => ModelHotelitems.fromJson(e)));
  //     } else {
  //       statusRquest = StatusRquest.failure;
  //       update();
  //     }
  //   } else {}
  // }

  void _prepareForFetch() {
    hoteldata.clear();
    statusRquest = StatusRquest.loading;
    update();
  }

  void _handleResponse(Either<Failure, dynamic> response) {
    response.fold(
      (failure) {
        print('Failure: ${failure.toString()}');
        statusRquest = failure.status;
        update();
      },
      (data) {
        final List<dynamic> dataResponse = data['data']['data'];
        hoteldata.addAll(dataResponse.map((e) => HotelsModle.fromJson(e)));
        statusRquest = StatusRquest.success;
      },
    );
  }

  void _handleError(dynamic error) {
    print('Exception: $error');
    Get.back();
    Get.defaultDialog(
      title: "failed".tr,
      middleText: "enternal failer".tr,
    );
    statusRquest = StatusRquest.serverfailure;
  }
  // getDataBy(
  //     {Map<String, dynamic>? filterData }) async {
  //   hoteldata.clear();
  //   print(filterData);
  //   statusRquest = StatusRquest.loading;
  //   update();
  //   try {
  //     final resposn = await homeData.getData(filterData!);
  //     print(resposn);

  //     resposn.fold(
  //       (faileur) {
  //         print(faileur);
  //         statusRquest = faileur.status;
  //         update();
  //       },
  //       (data) {
  //         List dataResponse = data['data']['data'];
  //         hoteldata.addAll(dataResponse.map(
  //           (e) => HotelsModle.fromJson(e),
  //         ));

  //         statusRquest = StatusRquest.success;
  //       },
  //     );
  //   } catch (e) {
  //     Get.back();
  //     print('error: $e');
  //     Get.defaultDialog(title: "failed".tr, middleText: 'enternal  failer'.tr);
  //     statusRquest = StatusRquest.serverfailure;
  //   }
  //   // print(hoteldata[1].images!.length);

  //   update();
  // }

  @override
  void onInit() {
    filterData(filterData: {'city': getUserCity()});
    // setUserCity('صنعاء');
    // getDataBy(filterData: {'city': getUserCity()});
    super.onInit();
  }
}
