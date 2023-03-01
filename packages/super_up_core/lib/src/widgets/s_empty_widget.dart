import 'package:flutter/material.dart';

class SEmptyWidget extends StatelessWidget {
  const SEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text("Empty Data"),
    );
  }
}
