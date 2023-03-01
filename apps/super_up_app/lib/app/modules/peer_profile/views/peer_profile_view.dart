import 'package:flutter/material.dart';

import '../controllers/peer_profile_controller.dart';

class PeerProfileView extends StatefulWidget {
  final String identifier;
  const PeerProfileView({Key? key, required this.identifier}) : super(key: key);

  @override
  State<PeerProfileView> createState() => _PeerProfileViewState();
}

class _PeerProfileViewState extends State<PeerProfileView> {
  late final PeerProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = PeerProfileController(widget.identifier, context);
    controller.onInit();
  }

  @override
  void dispose() {
    controller.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peer Profile View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          controller.identifier,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
