import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:status_view/status_view.dart';
import 'package:super_up/app/modules/my_status_details/views/my_status_details_view.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../controllers/status_tab_controller.dart';
import '../widgets/peer_status_item.dart';

class StatusTabView extends StatefulWidget {
  const StatusTabView({Key? key}) : super(key: key);

  @override
  State<StatusTabView> createState() => _StatusTabViewState();
}

class _StatusTabViewState extends State<StatusTabView> {
  late final StatusTabController controller;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get<StatusTabController>();

    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                onTap: () => controller.onMyStatusClicked(context),
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
                  context.toPage(const MyStatusDetailsView());
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
    );
  }
}
