import 'package:flutter/material.dart';

class SErrorWidget extends StatelessWidget {
  const SErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text("Some thing went wrong try again!"),
    );
  }
}
