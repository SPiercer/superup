import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superup/app/core/constants/colors.dart';
import 'package:textless/textless.dart';

import 'record_controller.dart';

class RecordWidget extends StatefulWidget {
  const RecordWidget(
      {Key? key, required this.controller, required this.onClose})
      : super(key: key);
  final RecordController controller;
  final VoidCallback onClose;

  @override
  State<RecordWidget> createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() {
            return widget.controller.currentTime.value.text.black
                .color(Colors.red);
          }),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: widget.onClose,
                child: const Icon(
                  Icons.delete,
                  color: AppColors.iconGrayColor,
                  size: 30,
                ),
              ),
              const InkWell(
                child: Icon(
                  Icons.pause_circle_outline,
                  size: 30,
                  color: AppColors.iconGrayColor,
                ),
              ),
              const SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}
