import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fundamental_submission/app/data/api_service.dart';
import 'package:fundamental_submission/app/model/restaurant.dart';
import 'package:fundamental_submission/app/modules/detail/bindings/detail_binding.dart';
import 'package:fundamental_submission/app/modules/detail/views/detail_view.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController search = TextEditingController();

  var isLoading = true.obs;
  var listRestaurant = <Restaurant>[].obs;

  @override
  void onInit() {
    getListRestaurants();
    super.onInit();
  }

  void moveToDetail(String id) {
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

  void getSearchRestaurant(String query) async {
    try {
      isLoading(true);
      var restaurants = await ApiService.getResultSearch(query);
      if (restaurants != null) {
        listRestaurant.assignAll(restaurants.restaurant);
      }
    } finally {
      isLoading(false);
    }
  }
}
