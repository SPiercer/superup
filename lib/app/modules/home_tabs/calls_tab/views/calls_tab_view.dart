import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:superup/app/core/constants/colors.dart';

import '../../../../models/call.dart';
import '../controllers/calls_tab_controller.dart';

class CallsTabView extends GetView<CallsTabController> {
  const CallsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.buttonBackground,
        onPressed: controller.onFlatCallIconPress,
        child: const Icon(
          Icons.add_call,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: dummc.length,
          itemBuilder: (context, i) => Column(
            children: <Widget>[
              const Divider(
                height: 10.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  foregroundColor: Theme.of(context).colorScheme.secondary,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(dummc[i].imgurl),
                ),
                title: Text(
                  dummc[i].name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      children: <Widget>[
                        dummc[i].st, //type1
                        Text(dummc[i].time,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15.0)),
                      ],
                    )),
                trailing: Icon(
                  dummc[i].type.icon,
                  color: Theme.of(context).primaryColor,
                ), //type 2
              )
            ],
          )),
    );
  }
}
