import 'package:flutter/material.dart';
import 'package:textless/textless.dart';

class BanWidget extends StatelessWidget {
  final bool isMy;

  const BanWidget({Key? key, required this.isMy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            "This person not available !".text.color(Colors.white).black,
          ],
        ),
      ),
    );
  }
}
