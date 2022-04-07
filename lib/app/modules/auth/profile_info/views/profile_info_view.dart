import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:superup/app/core/constants/colors.dart';
import 'package:textless/textless.dart';

import '../controllers/profile_info_controller.dart';

class ProfileInfoView extends GetView<ProfileInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: 'Profile Info'.h4.size(22),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  'Please provide your name and an optional profile photo'
                      .text.color(AppColors.accentColor)
                      .alignCenter,
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/profile_info/ic_addphoto.png",
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "Type your name here",
                    ),
                  )
                ],
              ),
              ElevatedButton(onPressed: controller.nextPress, child: "Next".text)
            ],
          ),
        ),
      ),
    );
  }
}
