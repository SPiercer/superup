import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/peer_profile_controller.dart';

class PeerProfileView extends GetView<PeerProfileController> {
  const PeerProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peer Profile View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '${controller.identifier}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
