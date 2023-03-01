import 'package:flutter/material.dart';

import '../controllers/create_text_status_controller.dart';

class CreateTextStatusView extends StatefulWidget {
  const CreateTextStatusView({Key? key}) : super(key: key);

  @override
  State<CreateTextStatusView> createState() => _CreateTextStatusViewState();
}

class _CreateTextStatusViewState extends State<CreateTextStatusView> {
  late final CreateTextStatusController controller;

  @override
  void initState() {
    super.initState();
    controller = CreateTextStatusController(context);
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
          title: const Text('CreateTextStatusView'),
        ),
        body: const Text("ddfhg"));
  }
}
