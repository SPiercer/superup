import 'package:flutter/material.dart';
import 'package:status_view/status_view.dart';
import 'package:super_up/app/modules/user_status/views/user_status_view.dart';
import 'package:super_up_core/super_up_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class PeerStatusItem extends StatelessWidget {
  final Status status;

  const PeerStatusItem({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.toPage(const UserStatusView());
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StatusView(
            radius: 28,
            spacing: 15,
            strokeWidth: 2,
            indexOfSeenStatus: 2,
            numberOfStatus: status.statusList.length,
            padding: 4,
            centerImageUrl:
                "https://picsum.photos/200/${200 + status.seenIndex}",
            seenColor: Colors.grey,
            unSeenColor: Colors.red,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SBaseUser.myUser.fullName.text.bold,
              const SizedBox(
                height: 2,
              ),
              "1 minute ago".s1.color(Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
