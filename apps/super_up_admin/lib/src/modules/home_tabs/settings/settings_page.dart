import 'package:flutter/material.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import 'settings_controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final controller = SettingsController();

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
          child: const Text("settingsPage"),
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
