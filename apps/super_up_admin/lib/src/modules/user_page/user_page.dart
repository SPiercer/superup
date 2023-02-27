import 'package:flutter/material.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import 'user_controller.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final controller = UserController();

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
      appBar: AppBar(),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: "xxxx  $index".text,
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: 29,
      ),
    );
  }
}
