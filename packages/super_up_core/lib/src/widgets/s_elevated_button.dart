import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class SElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const SElevatedButton({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      activeOpacity: 0.2,
      onTap: onPress,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: context.isDark ? Colors.white24 : Colors.green,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: title.h6.color(Colors.white),
      ),
    );
  }
}
