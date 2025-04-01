import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/components/app_divider.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/core/router/app_routes.dart';
import 'package:school/src/features/teacher/home/presentation/manager/home_teacher_bloc.dart';
import 'package:school/src/features/teacher/magazine/presentation/manager/magazine_teacher_bloc.dart';
import 'package:school/src/features/teacher/main/widgets/magazine_item.dart';

class MagazineTeacherPage extends StatefulWidget {
  const MagazineTeacherPage({super.key});

  @override
  State<MagazineTeacherPage> createState() => _MagazineTeacherPageState();
}

class _MagazineTeacherPageState extends State<MagazineTeacherPage> {
  late final bloc = context.read<MagazineTeacherBloc>();
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');

  @override
  void initState() {
    super.initState();
    bloc.curatorClasses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).magazine),
      ),
      backgroundColor: AppColors.bgColor,
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            AppContainer(
              margin: const EdgeInsets.only(
                  right: 16, left: 16, top: 16, bottom: 8),
              padding: const EdgeInsets.all(4),
              radius: 8,
              child: TabBar(
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.mainColor,
                ),
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorSize: TabBarIndicatorSize.tab,
                splashBorderRadius: BorderRadius.circular(8),
                labelStyle: CustomTextStyle.h16M,
                labelColor: Colors.white,
                unselectedLabelStyle: CustomTextStyle.h16M,
                tabs: <Widget>[
                  Tab(text: S.of(context).magazines),
                  Tab(text: S.of(context).plan),
                  Tab(text: S.of(context).myClass),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                BlocBuilder<HomeTeacherBloc, HomeTeacherState>(
                  builder: (context, state) {
                    return ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: state.myRecords?.length,
                        itemBuilder: (context, index) {
                          return MagazineItem(
                              model: state.myRecords?[index], onClick: () {
                            bloc.changeDateMarks(date: dateFormat.format(DateTime.now()), record: state.myRecords?[index].id);
                                context.pushNamed(
                                  AppRoutes.recordMagazineTeacher.name,
                                  pathParameters: {
                                    'id':state.myRecords?[index].id.toString()??'0',
                                    'name':"${state.myRecords?[index].classRef?.number}-${state.myRecords?[index].classRef?.letter} (${state.myRecords?[index].subject?.label})",
                                    'curator':'false'
                                  },
                                );
                          });
                        });
                  },
                ),
                BlocBuilder<HomeTeacherBloc, HomeTeacherState>(
                  builder: (context, state) {
                    return ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: state.myRecords?.length,
                        itemBuilder: (context, index) {
                          return MagazineItem(
                              model: state.myRecords?[index], onClick: () {
                            context.pushNamed(
                              AppRoutes.planTeacher.name,
                              pathParameters: {
                                'id':state.myRecords?[index].id.toString()??'0',
                                'name':"${state.myRecords?[index].classRef?.number}-${state.myRecords?[index].classRef?.letter} (${state.myRecords?[index].subject?.label})",
                                'quarter':state.currentQuarter?.id.toString()??'0'
                              },
                            );
                          });
                        });
                  },
                ),
                BlocBuilder<MagazineTeacherBloc, MagazineTeacherState>(
                  builder: (context, state) {
                    return ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: state.curatorClasses?.length,
                        itemBuilder: (context, index) {
                          return AppContainer(
                            padding: EdgeInsets.zero,
                            child: ExpansionTile(
                              shape: const Border(),
                              title: Text(
                                "${state.curatorClasses?[index].number}-${state.curatorClasses?[index].letter}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cardColor,
                                ),
                              ),
                              onExpansionChanged: (val){
                                if(val){
                                  bloc.classRecords(state.curatorClasses?[index].id??0);
                                }
                              },
                              iconColor: Theme.of(context).colorScheme.tertiary,
                              children:  List.generate(state.classRecords?.length??0, (i)=>Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: AppDivider(),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      bloc.changeDateMarks(date: dateFormat.format(DateTime.now()), record: state.classRecords?[index].id);
                                      context.pushNamed(
                                        AppRoutes.recordMagazineTeacher.name,
                                        pathParameters: {
                                          'id':state.classRecords?[i].id.toString()??'0',
                                          'name':"${state.curatorClasses?[index].number}-${state.curatorClasses?[index].letter} (${state.classRecords?[i].subjectName})",
                                          'curator':'true'
                                        },
                                      );
                                    },
                                    title: Text(
                                      state.classRecords?[i].subjectName??'-',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),)
                            ),
                          );
                        });
                  },
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
