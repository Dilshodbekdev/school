import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/features/student/test/simple/data/models/started_simple_tests_student_model.dart';

class StartedSimpleTestItem extends StatefulWidget {
  final StartedSimpleTestModel model;
  final VoidCallback onClick;

  const StartedSimpleTestItem({
    super.key,
    required this.model,
    required this.onClick,
  });

  @override
  State<StartedSimpleTestItem> createState() => _StartedSimpleTestItemState();
}

class _StartedSimpleTestItemState extends State<StartedSimpleTestItem>
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
                Row(
                  children: [
                    Text(S.of(context).toTest,style: CustomTextStyle.h14R,),
                    const Gap(4),
                    const Icon(Icons.arrow_forward_ios,size: 20,)
                  ],
                )
              ],
            ),
          )),
    );
  }
}
