import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/core/app_state/cubit/app_cubit.dart';
import 'package:school/src/features/teacher/main/tabs/magazine_teacher_page.dart';
import 'package:school/src/features/teacher/main/tabs/home_teacher_page.dart';
import 'package:school/src/features/teacher/main/tabs/profile_teacher_page.dart';
import 'package:school/src/features/teacher/main/tabs/test_teacher_page.dart';

class MainTeacherPage extends StatelessWidget {
  const MainTeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    List pages = [
      const HomeTeacherPage(),
      const MagazineTeacherPage(),
      const TestTeacherPage(),
      const ProfileTeacherPage()
    ];

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: pages[state.selectedIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            child: BottomNavigationBar(
                currentIndex: state.selectedIndex,
                onTap: (index) {
                  context.read<AppCubit>().selectTab(index);
                },
                type: BottomNavigationBarType.fixed,
                iconSize: 24,
                backgroundColor: AppColors.mainColor,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      'assets/icons/ic_home_active.svg',
                    ),
                    icon: SvgPicture.asset(
                      'assets/icons/ic_home.svg',
                    ),
                    label: S.of(context).home,
                  ),
                  BottomNavigationBarItem(
                      icon:
                          SvgPicture.asset('assets/icons/ic_book.svg'),
                      activeIcon: SvgPicture.asset(
                        'assets/icons/ic_book_active.svg',
                      ),
                      label: S.of(context).magazine),
                  BottomNavigationBarItem(
                      icon:
                          SvgPicture.asset('assets/icons/ic_task.svg'),
                      activeIcon: SvgPicture.asset(
                        'assets/icons/ic_task_active.svg',
                      ),
                      label: S.of(context).task),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'assets/icons/ic_profile.svg'),
                      activeIcon: SvgPicture.asset(
                        'assets/icons/ic_profile_active.svg',
                      ),
                      label: S.of(context).profile),
                ]),
          ),
        );
      },
    );
  }
}
