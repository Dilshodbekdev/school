import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/core/router/app_routes.dart';
import 'package:school/src/features/student/home/presentation/manager/home_student_bloc.dart';
import 'package:school/src/features/student/main/widgets/news_item.dart';
import 'package:school/src/features/teacher/home/presentation/manager/home_teacher_bloc.dart';

class AllNewsStudentPage extends StatelessWidget {
  const AllNewsStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    late final bloc = context.read<HomeTeacherBloc>();

    return BlocBuilder<HomeStudentBloc, HomeStudentState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.bgColor,
          appBar: AppBar(
            title: Text(S.of(context).schoolNews),
          ),
          body: LazyLoadScrollView(
            isLoading: state.isPaging,
            onEndOfPage: () => bloc.pagingNews(),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 3),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: state.places.length + (state.isPaging ? 1 : 0),
              itemBuilder: (context, index) => index == state.places.length
                  ? const Center(child: CircularProgressIndicator())
                  : NewsItem(
                model: state.places[index],
                onClick: () {
                  bloc.newDetails(state.places[index].id??0);
                  context.pushNamed(AppRoutes.newDetailsTeacher.name);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
