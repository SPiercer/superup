import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/group_invite_link_controller.dart';

class GroupInviteLinkView extends GetView<GroupInviteLinkController> {
  const GroupInviteLinkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GroupInviteLinkView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GroupInviteLinkView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
