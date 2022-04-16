import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class UserStatusController extends GetxController {
  final controller = StoryController();
  final List<StoryItem> storyItems = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    storyItems.addAll([
      StoryItem.text(
          title:
          '''Mobil kodlama dersini anlatan hocalarımıza destekleri için teşekkür ederiz.''',
          backgroundColor: Colors.blueGrey),
      StoryItem.text(
          title:
          "Bize elbette tebrik etmek düşer. Daha iyilerini yapacağından şüphemiz yok \n\n #Mobil Kodlama dersini anlatan hocalar. \n😉",
          backgroundColor: Colors.blueGrey),
      StoryItem.pageImage(
          url:
          "https://images.unsplash.com/photo-1553531384-cc64ac80f931?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bW91bnRhaW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
          controller: controller),
      StoryItem.pageImage(
          url: "https://wp-modula.com/wp-content/uploads/2018/12/gifgif.gif",
          controller: controller,
          imageFit: BoxFit.contain),
    ]);
  }
}
