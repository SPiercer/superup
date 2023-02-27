import 'package:flutter/material.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import 'notifications_controller.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final controller = NotificationsController();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            context.toPage(const NestedView());
          },
          child: const Text("NotificationsPage"),
        ),
      ),
    );
  }
}

class NestedView extends StatelessWidget {
  const NestedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
