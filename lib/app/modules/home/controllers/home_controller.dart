import 'dart:convert';
import 'package:fundamental_submission/app/data/api_service.dart';
import 'package:fundamental_submission/app/model/list_restaurant.dart';
import 'package:fundamental_submission/app/model/restaurant.dart';
import 'package:fundamental_submission/app/modules/detail/bindings/detail_binding.dart';
import 'package:fundamental_submission/app/modules/detail/views/detail_view.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var listRestaurant = <Restaurant>[].obs;

  @override
  void onInit() {
    getListRestaurants();
    super.onInit();
  }

  void moveToDetail(String id) {
    Future.delayed(const Duration(milliseconds: 5000));
    DetailBinding().dependencies();
    Get.to(() => DetailView(),
        arguments: id,
        transition: Transition.leftToRight,
        duration: const Duration(milliseconds: 500));
  }

  void getListRestaurants() async {
    try {
      isLoading(true);
      var restaurants = await ApiService.getListRestaurants();
      if (restaurants != null) {
        listRestaurant.assignAll(restaurants.restaurants);
      }
    } finally {
      isLoading(false);
    }
  }
}
