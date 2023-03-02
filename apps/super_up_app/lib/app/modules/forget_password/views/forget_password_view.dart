import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/widgets/wide_constraints.dart';
import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  late final ForgetPasswordController controller;

  @override
  void initState() {
    super.initState();
    controller = ForgetPasswordController(context);
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
        title: const Text('ForgetPasswordView'),
      ),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return WideConstraints(
            enable: sizingInformation.isDesktop,
            child: const Text("ForgetPasswordView"),
          );
        },
      ),
    );
  }
}
