import 'package:ecomly_frontend/ui/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SuccessAnimation extends StatefulWidget {
  const SuccessAnimation({super.key});

  @override
  State<SuccessAnimation> createState() => _SuccessAnimationState();
}

class _SuccessAnimationState extends State<SuccessAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _circleScaleAnimation;
  late final Animation<double> _circleOpacityAnimation;
  late final Animation<double> _checkScaleAnimation;
  late final Animation<double> _checkOpacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    final circleAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    );

    final checkAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    );

    _circleOpacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(circleAnimation);

    _circleScaleAnimation = Tween<double>(
      begin: 0.3,
      end: 1,
    ).animate(circleAnimation);

    _checkOpacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(checkAnimation);

    _checkScaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(checkAnimation);

    _controller.forward();
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
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: _circleOpacityAnimation.value,
              child: Transform.scale(
                scale: _circleScaleAnimation.value,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.success, width: 6),
                    shape: BoxShape.circle,
                    color: AppColors.success.withAlpha(50),
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: _checkOpacityAnimation.value,
              child: Transform.scale(
                scale: _checkScaleAnimation.value,
                child: const Icon(
                  Icons.check_rounded,
                  color: AppColors.success,
                  size: 70,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
