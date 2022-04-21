import 'package:flutter/material.dart';
import 'package:superup/app/core/constants/colors.dart';

class ModalTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

    const ModalTile({Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      onTap: onTap,
      leading: Container(
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.grey[300],
        ),
        padding: const EdgeInsets.all(5),
        child: Icon(
          icon,
          size: 30,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: AppColors.iconGrayColor,
          fontSize: 14,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
