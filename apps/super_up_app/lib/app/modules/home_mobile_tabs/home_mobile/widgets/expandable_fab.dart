import 'package:flutter/material.dart';
import 'dart:math' as math;

class ExpandableFab extends StatefulWidget {
  const ExpandableFab(
      {super.key,
      this.child,
      this.backgroundColor,
      required this.onPressed,
      this.smallButton});

  final Widget? child;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final FloatingActionButton? smallButton;

  @override
  State<ExpandableFab> createState() => ExpandableFabState();
}

class ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void hide() {
    setState(() {
      isVisible = false;
      _controller.reverse();
    });
  }

  void show() {
    setState(() {
      isVisible = true;
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          AnimatedBuilder(
            animation: _expandAnimation,
            builder: (context, child) {
              final offset = Offset.fromDirection(
                90 * (math.pi / 180.0),
                _expandAnimation.value * 61,
              );
              return Positioned(
                right: 4.0,
                bottom: offset.dy, // bottom: 61.0,
                child: child!,
              );
            },
            child: FadeTransition(
              opacity: _expandAnimation,
              child: widget.smallButton,
            ),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: widget.onPressed,
            backgroundColor: widget.backgroundColor,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
