import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:spelling_matching_game/animal/animal_animation.dart';
import 'package:spelling_matching_game/animal/animal_controller.dart';

class AnProgressBar extends StatefulWidget {
  const AnProgressBar({super.key});

  @override
  State<AnProgressBar> createState() => _AnProgressBarState();
}

class _AnProgressBarState extends State<AnProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double begin = 0, end = 0;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);

    _animation = Tween<double>(begin: begin, end: end).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AnimalController, double>(
        selector: (_, controller) => controller.percentCompleted,
        builder: (_, percent, __) {
          end = percent;
          if (!_controller.isAnimating) {
            _animation = Tween<double>(begin: begin, end: end).animate(
                CurvedAnimation(
                    parent: _controller, curve: Curves.elasticInOut));
            _controller.reset();
            _controller.forward();
            begin = end;
            if (begin == 1) {
              begin = 0;
              end = 0;
            }
          }
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => LinearProgressIndicator(
              value: _animation.value,
            ),
          );
        });
  }
}
