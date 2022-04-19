import 'package:flutter/material.dart';

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
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          InkWell(
            onTap: widget.onClose,
            child: const Icon(Icons.close),
          )
        ],
      ),
    );
  }
}
