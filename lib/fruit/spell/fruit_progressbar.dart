import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spelling_matching_game/fruit/spell/fruit_controller.dart';

class FrProgressBar extends StatefulWidget {
  const FrProgressBar({super.key});

  @override
  State<FrProgressBar> createState() => _FrProgressBarState();
}

class _FrProgressBarState extends State<FrProgressBar>
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
    return Selector<FruitController, double>(
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
                  color: Colors.purple,
                  backgroundColor: Colors.grey,
                  value: _animation.value,
                ),
              ),
            ),
          );
        });
  }
}
