import 'package:flutter/material.dart';

class SLoadingWidget extends StatelessWidget {
  const SLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: const CircularProgressIndicator.adaptive());
  }
}
