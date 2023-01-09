import 'package:flutter/material.dart';

class CallModel {
  final String imgurl;
  final String name;
  final String time;
  final Icon type;
  final Icon st;

  CallModel(
      {required this.name,
      required this.time,
      required this.imgurl,
      required this.st,
      required this.type});
}

List<CallModel> dummc = [
  CallModel(
      name: "Jack",
      time: "Today, 4:33AM",
      imgurl:
          "https://pbs.twimg.com/profile_images/760249570085314560/yCrkrbl3_400x400.jpg",
      st: const Icon(Icons.call_made, color: Colors.green),
      type: const Icon(
        Icons.phone,
      )),
  CallModel(
      name: "Hero",
      time: "Today, 2:52AM",
      imgurl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB0qsqzuV2X3LCCSeJujDyK8vg5SIz1JNAP-f5N_Tc2MQsNEEWGA",
      st: const Icon(Icons.call_received, color: Colors.green),
      type: const Icon(Icons.videocam)),
  CallModel(
      name: "John",
      time: "Today, 1:32AM",
      imgurl:
          "https://pbs.twimg.com/profile_images/760249570085314560/yCrkrbl3_400x400.jpg",
      st: const Icon(Icons.call_received, color: Colors.red),
      type: const Icon(Icons.phone)),
];
