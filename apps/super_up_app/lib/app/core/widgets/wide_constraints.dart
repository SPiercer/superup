import 'package:flutter/material.dart';

class WideConstraints extends StatelessWidget {
  final Widget child;
  final bool enable;

  const WideConstraints({Key? key, required this.child, this.enable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!enable) {
      return child;
    }
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 700,
          maxHeight: 1000,
        ),
        child: child,
      ),
    );
  }
}
