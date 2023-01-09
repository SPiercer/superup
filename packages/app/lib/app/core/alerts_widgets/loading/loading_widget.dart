import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class LoadingWidget extends StatelessWidget {
  final String text;

  const LoadingWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircularProgressIndicator.adaptive(),
        const SizedBox(
          width: 25,
        ),
        text.text
      ],
    );
  }
}
