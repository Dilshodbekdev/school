import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/features/teacher/test/simple/data/models/active_simple_tests_teacher_model.dart';

class ActiveSimpleTestItem extends StatefulWidget {
  final ActiveSimpleTestTeacherModel model;
  final VoidCallback onClick;

  const ActiveSimpleTestItem({
    super.key,
    required this.model,
    required this.onClick,
  });

  @override
  State<ActiveSimpleTestItem> createState() => _ActiveSimpleTestItemState();
}

class _ActiveSimpleTestItemState extends State<ActiveSimpleTestItem>
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
          () => widget.onClick.call(),
        );
        _shrinkButtonSize();
        _restoreButtonSize();
      },
      onTapDown: (_) => _shrinkButtonSize(),
      onTapCancel: _restoreButtonSize,
      child: Transform.scale(
          scale: _scaleTransformValue,
          child: AppContainer(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.model.name??'--',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColors.mainColor
                        ),
                      ),
                      const Gap(12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text(
                          S.of(context).until(widget.model.endedDate??'--'),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.redAccent
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios,size: 20,)
              ],
            ),
          )),
    );
  }
}
