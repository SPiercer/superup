import 'package:flutter/material.dart';

class SLoadingWidget extends StatelessWidget {
  const SLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}
