import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';



class ArrowDown extends StatelessWidget {
  final VoidCallback onPress;
  const ArrowDown({Key? key,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_downward,
          color: AppColors.iconGrayColor,
        ),
      ),
    );
  }
}
