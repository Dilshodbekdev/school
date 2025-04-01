import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school/src/config/theme/app_colors.dart';

class AppElevatedButton extends StatefulWidget {
  final String text;
  final Color? textColor;
  final Color? bgColor;
  final IconData? icon;
  final VoidCallback? onClick;

  const AppElevatedButton({
    super.key,
    required this.text,
    required this.onClick,
    this.textColor,
    this.bgColor,
    this.icon,
  });

  @override
  State<AppElevatedButton> createState() => _AppElevatedButtonState();
}

class _AppElevatedButtonState extends State<AppElevatedButton>
    with SingleTickerProviderStateMixin {
  static const clickAnimationDurationMillis = 100;

  double _scaleTransformValue = 1;

  // needed for the "click" tap effect
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: clickAnimationDurationMillis),
      lowerBound: 0.0,
      upperBound: 0.05,
    )..addListener(() {
        setState(() => _scaleTransformValue = 1 - animationController.value);
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _shrinkButtonSize() {
    animationController.forward();
  }

  void _restoreButtonSize() {
    Future.delayed(
      const Duration(milliseconds: clickAnimationDurationMillis),
      () => animationController.reverse(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Future.delayed(
          const Duration(milliseconds: clickAnimationDurationMillis * 2),
          () => widget.onClick?.call(),
        );
        _shrinkButtonSize();
        _restoreButtonSize();
      },
      onTapDown: (_) => _shrinkButtonSize(),
      onTapCancel: _restoreButtonSize,
      child: Transform.scale(
        scale: _scaleTransformValue,
        child: Container(
          height: 46,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: widget.bgColor ?? AppColors.mainColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon != null
                  ? Icon(
                      widget.icon,
                      color: widget.textColor ?? Colors.white,
                    )
                  : const SizedBox(),
              Gap(widget.icon == null ? 0 : 4),
              Text(
                widget.text,
                style: TextStyle(
                  color: widget.textColor ?? Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
