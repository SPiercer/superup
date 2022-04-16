import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/group_invite_link_controller.dart';

class GroupInviteLinkView extends GetView<GroupInviteLinkController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GroupInviteLinkView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'GroupInviteLinkView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
