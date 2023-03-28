import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fundamental_submission/app/theme/color.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DetailView'),
          centerTitle: true,
        ),
        body: Obx(() {
          print("${controller.isLoading.value}");
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                // Stack(
                //   children: [
                //     InkWell(
                //       onTap: () {},
                //       child: Container(
                //         height: 50,
                //         width: 50,
                //         padding: const EdgeInsets.all(defaultPadding * 0.75),
                //         margin: const EdgeInsets.symmetric(
                //             horizontal: defaultPadding / 2),
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           border: Border.all(
                //               width: 2, color: primaryColor.withOpacity(0.15)),
                //           borderRadius:
                //               const BorderRadius.all(Radius.circular(10)),
                //         ),
                //         child: const Icon(Icons.search, color: primaryColor),
                //       ),
                //     ),
                //     CachedNetworkImage(
                //       fit: BoxFit.fill,
                //       imageUrl:
                //           "https://restaurant-api.dicoding.dev/images/medium/14",
                //       placeholder: (context, url) =>
                //           const Center(child: CircularProgressIndicator()),
                //     ),
                //   ],
                // ),
                // Row(
                //   children: [
                //     Text(
                //       controller.detailRestaurant!.name.toString(),
                //       overflow: TextOverflow.ellipsis,
                //     ),
                //     Container(
                //       padding: const EdgeInsets.all(defaultPadding / 4),
                //       decoration: const BoxDecoration(
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         color: primaryColor,
                //       ),
                //       child: Row(
                //         children: [
                //           Text(
                //             controller.detailRestaurant!.city.toString(),
                //             overflow: TextOverflow.ellipsis,
                //           ),
                //           Text(
                //             controller.detailRestaurant!.address.toString(),
                //             overflow: TextOverflow.ellipsis,
                //           ),
                //         ],
                //       ),
                //     )
                //   ],
                // )
              ],
            );
          }
        }));
  }
}
