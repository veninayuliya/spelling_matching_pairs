import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BdAnimation extends StatefulWidget {
  BdAnimation({required this.child, required this.animate, super.key});

  final Widget child;
  bool animate;

  @override
  State<BdAnimation> createState() => _BdAnimationState();
}

class _BdAnimationState extends State<BdAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    double begin = 0, end = 1;
    final flip = Random().nextBool();
    if (flip) {
      begin = 1;
      end = 0;
    }

    _rotationAnimation = Tween<double>(begin: begin, end: end).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine));

    super.initState();
  }

  @override
  void didUpdateWidget(covariant BdAnimation oldWidget) {
    if (widget.animate && !_controller.isAnimating) {
      _controller.reset();
      _controller.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => RotationTransition(
        turns: _rotationAnimation,
        child: ScaleTransition(scale: _controller, child: widget.child),
      ),
    );
  }
}
