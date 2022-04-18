import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:superup/app/modules/message_modules/message/controllers/message_controller.dart';

import '../../../../core/widgets/get_full.dart';


class BroadcastMessageScreenView extends StatefulWidget {
  const BroadcastMessageScreenView({Key? key}) : super(key: key);

  @override
  State<BroadcastMessageScreenView> createState() => _BroadcastMessageScreenViewState();
}

class _BroadcastMessageScreenViewState extends GetFull<BroadcastMessageScreenView,MessageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BroadcastMessageScreenView'),
        centerTitle: true,
      ),
        body: Stack(
          children: [
            Image.asset("assets/message/default_wallpaper.png",fit: BoxFit.cover,)
          ],
        )
    );
  }

}
