import 'package:flutter/material.dart';
import 'package:super_up_core/src/models/model.dart';

class SWaitingPage extends StatelessWidget {
  final SMyProfile profile;
  const SWaitingPage({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(profile.toMap().toString()),
    );
  }
}
