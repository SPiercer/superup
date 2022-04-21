import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

import '../../../core/constants/colors.dart';

class SliverHeader extends StatelessWidget {
  final String peerImage;
  final VoidCallback onImagePress;
  final List<Widget> actions;

  const SliverHeader(
      {Key? key,
      required this.peerImage,
      required this.onImagePress,
      required this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: InkWell(
        onTap: Get.back,
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.accentColor,
          size: 26,
        ),
      ),
      pinned: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: actions,

      flexibleSpace: CustomizableSpaceBar(

        builder: (context, p) {
          p = 1 - p;

          var maxValue = p * 150;

          if (maxValue < 50) {
            maxValue = 50;
          }
          /// Example content
          return Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: (){
                print("object");
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.network(
                  peerImage,
                  height:maxValue,
                  width: maxValue,
                ),
              ),
            ),
          );
        },
      ),
      expandedHeight: 200,

    );

    return SliverPersistentHeader(
      pinned: true,
      delegate: FlexibleHeaderDelegate(
        expandedHeight: 170,
        backgroundColor: context.isDarkMode ? Colors.black26 : Colors.white,
        collapsedElevation: 1,
        builder: (c, p) {
          p = 1 - p;
          var maxValue = p * 150;
          if (maxValue < 50) {
            maxValue = 50;
          }

          return UnconstrainedBox(
            child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: InkWell(
                onTap: () {
                  print("xxxxxxxxxxxxx");
                },
                child: Image.network(
                  peerImage,
                  height: maxValue.toDouble(),
                  width: maxValue.toDouble(),
                ),
              ),
            ),
          );
        },
        leading: InkWell(
          onTap: Get.back,
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.accentColor,
            size: 26,
          ),
        ),
        actions: actions,
      ),
    );
  }
}
