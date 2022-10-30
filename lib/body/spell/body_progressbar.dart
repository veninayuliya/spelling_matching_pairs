import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/body/spell/body_controller.dart';

class BodyProgressBar extends StatefulWidget {
  const BodyProgressBar({super.key});

  @override
  State<BodyProgressBar> createState() => _BodyProgressBarState();
}

class _BodyProgressBarState extends State<BodyProgressBar>
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
    return Selector<BodyController, double>(
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
            builder: (context, child) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: LinearProgressIndicator(
                  color: Colors.red,
                  backgroundColor: Colors.grey,
                  value: _animation.value,
                ),
              ),
            ),
          );
        });
  }
}
