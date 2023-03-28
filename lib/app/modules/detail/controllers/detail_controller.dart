import 'dart:convert';

import 'package:fundamental_submission/app/data/api_service.dart';
import 'package:fundamental_submission/app/model/DetailRestaurant.dart';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class DetailController extends GetxController {
  late String id;
  late DetailRestaurant detailRestaurant;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments;
    getDetailRestaurant(id);
    isLoading.value = false;
    getDetailRestaurant(id);
  }

  void getDetailRestaurant(String id) async {
    try {
      isLoading(true);
      var datas = await ApiService.getDetailRestaurants(id);
      if (datas != null) {
        detailRestaurant = datas.restaurant;
      }
    } finally {
      isLoading(false);
    }
  }
}
