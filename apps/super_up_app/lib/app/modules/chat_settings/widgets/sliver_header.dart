import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter/material.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class SliverHeader extends StatelessWidget {
  final String peerImage;
  final VoidCallback onImagePress;
  final List<Widget> actions;

  const SliverHeader({
    super.key,
    required this.peerImage,
    required this.onImagePress,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: const BackButton(),
      pinned: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: actions,
      flexibleSpace: CustomizableSpaceBar(
        builder: (context, p) {
          p = 1 - p;

          var maxValue = p * 130;

          if (maxValue < 50) {
            maxValue = 50;
          }
          return Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: onImagePress,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: VPlatformCacheImageWidget(
                  source: VPlatformFileSource.fromUrl(url: peerImage),
                  size: Size(maxValue, maxValue),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
      expandedHeight: 200,
    );
  }
}
