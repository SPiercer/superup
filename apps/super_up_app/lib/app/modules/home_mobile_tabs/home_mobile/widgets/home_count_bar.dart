import 'dart:io';

import 'package:flutter/material.dart';
import 'package:super_up/app/modules/home_mobile_tabs/home_mobile/controllers/home_controller.dart';
import 'package:super_up_core/super_up_core.dart';

import 'home_tab_bar.dart';

class HomeCountAppbar extends StatefulWidget {
  final HomeController controller;
  const HomeCountAppbar({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomeCountAppbar> createState() => _HomeCountAppbarState();
}

class _HomeCountAppbarState extends State<HomeCountAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          InkWell(
            onTap: widget.controller.clearAllSelection,
            child: Platform.isIOS
                ? const Icon(Icons.arrow_back_ios)
                : const Icon(Icons.arrow_back),
          ),
          const SizedBox(
            width: 20,
          ),
          const Text("0"),
        ],
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      elevation: 1,
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
        ),
        Icon(Icons.push_pin_sharp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
        ),
        Icon(Icons.delete),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
        ),
        Icon(Icons.volume_off_sharp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
        ),
        AppIcons.archiveIcon,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
        ),
        Icon(Icons.more_vert),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
        ),
      ],
      bottom: homeTabBar(widget.controller, context),
    );
  }
}
