import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/features/student/home/presentation/manager/home_student_bloc.dart';

class NewDetailsStudentPage extends StatelessWidget {
  const NewDetailsStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeStudentBloc, HomeStudentState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.bgColor,
          appBar: AppBar(
            title: Text(S.of(context).schoolNews),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    width: MediaQuery.of(context).size.width,
                    imageUrl: state.newDetailsStudentModel?.images?.isNotEmpty==true?  state.newDetailsStudentModel?.images?.first ?? '':'',
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: AppColors.mainColor,
                            )),
                    errorWidget: (context, url, error) =>  Image.asset('assets/images/img_placeholder.jpg',fit: BoxFit.cover,),
                  ),
                ),
                const Gap(8),
                Text(
                  state.newDetailsStudentModel?.title ?? '--',
                  style: CustomTextStyle.h16SB,
                ),
                const Gap(8),
                Text(
                  state.newDetailsStudentModel?.content ?? '--',
                  style: CustomTextStyle.h14R,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
