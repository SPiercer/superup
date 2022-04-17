import 'package:flutter/material.dart';
import 'package:status_view/status_view.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/constants/colors.dart';
import 'package:superup/app/modules/home_tabs/status_tab/widgets/peer_status_item.dart';
import 'package:superup/app/routes/app_pages.dart';
import 'package:textless/textless.dart';

import '../controllers/status_tab_controller.dart';

class StatusTabView extends GetView<StatusTabController> {
  const StatusTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: controller.onFlatEditIconPress,
            child: const Icon(Icons.edit),
          ),
          const SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            backgroundColor: AppColors.buttonBackground,
            onPressed: controller.onFlatCameraIconPress,
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: controller.onMyStatusClicked,
                  child: Row(
                    children: [
                      StatusView(
                        radius: 28,
                        spacing: 15,
                        strokeWidth: 2,
                        indexOfSeenStatus: 2,
                        numberOfStatus: 3,
                        padding: 4,
                        centerImageUrl: "https://picsum.photos/200/300",
                        seenColor: Colors.grey,
                        unSeenColor: Colors.red,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "My Status".text.bold,
                          const SizedBox(
                            height: 6,
                          ),
                          const Text(
                            "Today, 1:53 PM",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.MY_STATUS_DETAILS);
                  },
                  icon: const Icon(Icons.more_horiz_rounded),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            "Recent updates".text.medium,
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => PeerStatusItem(
                  status: controller.statuses[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: controller.statuses.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
