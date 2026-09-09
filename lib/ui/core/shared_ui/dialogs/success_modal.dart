import 'package:ecomly_frontend/ui/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SuccessModal extends StatefulWidget {
  const new({super.key});

  @override
  State<SuccessModal> createState() => SuccessModalState();
}

class SuccessModalState extends State<SuccessModal>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _checkScaleAnimation;
  late Animation<double> _checkOpacityAnimation;
  late Animation<double> _circleScaleAnimation;
  late Animation<double> _circleOpacityAnimation;

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
      end: 1.0,
    ).animate(circleAnimation);
    _circleScaleAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(circleAnimation);
    _checkScaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(checkAnimation);

    _checkOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
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
            // Circle
            Opacity(
              opacity: _circleOpacityAnimation.value,
              child: Transform.scale(
                scale: _circleScaleAnimation.value,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
              ),
            ),

            // Check
            Opacity(
              opacity: _checkOpacityAnimation.value,
              child: Transform.scale(
                scale: _checkScaleAnimation.value,
                child: const Icon(
                  Icons.check,
                  color: AppColors.success,
                  size: 55,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
