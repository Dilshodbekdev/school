import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/features/student/home/data/models/menu_model.dart';

class MenuItem extends StatefulWidget {
  final MenuItems? model;
  final VoidCallback onClick;

  const MenuItem({
    super.key,
    required this.model,
    required this.onClick,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem>
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
            padding: const EdgeInsets.all(8),
            wight: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    width: 120,
                    height: 120,
                    imageUrl: widget.model?.image?.file ?? '',
                    fit: BoxFit.fill,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                      color: AppColors.mainColor,
                    )),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/img_placeholder.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(24)),
                        child: Text(
                          widget.model?.subject?.label ?? '--',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                      const Gap(12),
                      Text(
                        widget.model?.dishes
                                ?.map((e) => e.name ?? '')
                                .toList()
                                .join(', ') ??
                            '-',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyle.h14M,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
