import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/features/teacher/home/data/models/my_record_teacher_model.dart';

class MagazineItem extends StatefulWidget {
  final MyRecordTeacherModel? model;
  final VoidCallback onClick;

  const MagazineItem({
    super.key,
    required this.model,
    required this.onClick,
  });

  @override
  State<MagazineItem> createState() => _MagazineItemState();
}

class _MagazineItemState extends State<MagazineItem>
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
            wight: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "${widget.model?.classRef?.number}-${widget.model?.classRef?.letter} (${widget.model?.subject?.label})",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cardColor,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      S.of(context).readMore,
                      style: CustomTextStyle.h14R,
                    ),
                    const Gap(4),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
