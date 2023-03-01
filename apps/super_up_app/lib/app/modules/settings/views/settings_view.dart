import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:super_up/app/modules/settings/controllers/settings_controller.dart';
import 'package:super_up_core/super_up_core.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late final SettingsController controller;

  @override
  void initState() {
    super.initState();
    controller = SettingsController(
      GetIt.I.get<ProfileApiService>(),
      GetIt.I.get<AuthApiService>(),
      context,
    );
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
        title: const Text('SettingsView'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("log out"),
            onTap: controller.logout,
          )
        ],
      ),
    );
  }
}
