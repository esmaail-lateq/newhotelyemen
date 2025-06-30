import 'package:get/get.dart';
import 'package:newhotelyemeni/core/class/statusRquest.dart';
import 'package:newhotelyemeni/core/function/handling.dart';


class HotelsDetailsController extends GetxController {
  late List cateData = [];
  // ServesViewData servesViewData = ServesViewData(Get.find());
  StatusRquest statusRquest = StatusRquest.nune;
  late String hotelid;
  List serves = [];

  getServes() async {
    print("dfgfdsgdfsgsdfgdsfgsdfgsdfg");
    statusRquest = StatusRquest.loading;
    update();
    var response = {};
    print("dfgfdsgdfsgsdfgdsfgsdfgsdfg");
    statusRquest = handling(response);
    update();
    if (statusRquest == StatusRquest.success) {
      serves.addAll(response['data']);
      print(response['data']);
    } else {}
  }

  @override
  void onInit() {
    // cateData = Get.arguments['cateogry'];
    // hotelid = Get.arguments['hotelId'];
    hotelid = '1';
    getServes();
    super.onInit();
  }
}
