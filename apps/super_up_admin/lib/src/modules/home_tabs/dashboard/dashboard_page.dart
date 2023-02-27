import 'package:flutter/material.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import 'dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final controller = DashboardController();

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
      backgroundColor: Colors.white10,
      body: Center(
        child: InkWell(
          onTap: () {
            context.toPage(const NestedView());
          },
          child: const Text("DashboardPage"),
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
