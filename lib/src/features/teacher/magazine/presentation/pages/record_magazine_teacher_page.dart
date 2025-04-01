import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/components/app_divider.dart';
import 'package:school/src/config/components/app_elevated_button.dart';
import 'package:school/src/config/components/no_info_text.dart';
import 'package:school/src/config/components/text_field_components.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/core/util/funs.dart';
import 'package:school/src/features/student/home/data/models/quarter_student_model.dart';
import 'package:school/src/features/teacher/home/data/bodies/record_body.dart';
import 'package:school/src/features/teacher/home/data/models/chart_data.dart';
import 'package:school/src/features/teacher/home/presentation/manager/home_teacher_bloc.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/plan_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/quarterly_marks_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/select_rating_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/yearly_marks_body.dart';
import 'package:school/src/features/teacher/magazine/presentation/manager/magazine_teacher_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:toastification/toastification.dart';

class RecordMagazineTeacherPage extends StatefulWidget {
  final int id;
  final String name;
  final bool curator;
  const RecordMagazineTeacherPage({super.key, required this.id, required this.name, required this.curator});

  @override
  State<RecordMagazineTeacherPage> createState() => _RecordMagazineTeacherPageState();
}

class _RecordMagazineTeacherPageState extends State<RecordMagazineTeacherPage> {
  late final bloc = context.read<MagazineTeacherBloc>();
  late final blocHome = context.read<HomeTeacherBloc>();
  DateTime _selectedDate = DateTime.now();
  QuarterStudentModel? _selectedQuarter;
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');

  @override
  void initState() {
    super.initState();
    _selectedQuarter=blocHome.state.currentQuarter?.number!=null? blocHome.state.quarters?.where((item)=>item.id==blocHome.state.currentQuarter?.id).toList().first:blocHome.state.quarters?.first;
    bloc.dateMarks();
    bloc.quarterlyMarks(PlanBody(quarter: _selectedQuarter?.id,record: widget.id));
    bloc.yearlyMarks(widget.id);
    blocHome.record(RecordBody(record: widget.id,quarter: _selectedQuarter?.number));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: BlocConsumer<MagazineTeacherBloc, MagazineTeacherState>(
  listener: (context, state) {
    if(state.isSelectRating){
      bloc.dateMarks();
    }
    if(state.isSelectRatingQuarterly){
      bloc.quarterlyMarks(PlanBody(quarter: _selectedQuarter?.id,record: widget.id));
    }
    if(state.hasError){
      toastification.show(
          title: Text(
            state.errorMessage,
            style: const TextStyle(fontSize: 16),
            maxLines: 4,
          ),
          type: ToastificationType.error,
          alignment: Alignment.bottomCenter,
          showProgressBar: false,
          style: ToastificationStyle.fillColored,
          autoCloseDuration: 5.seconds,
          primaryColor: AppColors.mainRedColor);
    }
  },
  builder: (context, state) {
    return DefaultTabController(
        length: 4,
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
                  Tab(text: S.of(context).magazine),
                  Tab(text: S.of(context).chorakBaho),
                  Tab(text: S.of(context).yillikBaho),
                  Tab(text: S.of(context).statistics),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                  children: [
                    //date marks
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          AppContainer(
                            margin: EdgeInsets.zero,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        DateFormat.MMMEd().format(dateFormat.parse(state.dateMarksBody?.date??'')),
                                        style: CustomTextStyle.h16M,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Gap(16),
                                    BlocBuilder<HomeTeacherBloc, HomeTeacherState>(
                                      builder: (context, homeState) {
                                        return IconButton(
                                          onPressed: () => _selectDate(
                                            context,
                                            dateFormat.parse(homeState.currentQuarter?.startDate??''),
                                            dateFormat.parse(homeState.currentQuarter?.endDate??''),
                                          ),
                                          icon: const Icon(CupertinoIcons.calendar),
                                          style: IconButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                color: AppColors.dividerColor,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        _selectedDate=_selectedDate.subtract(const Duration(days: 1));
                                        bloc.changeDateMarks(date: dateFormat.format(_selectedDate));
                                        bloc.dateMarks();
                                      },
                                      icon: const Icon(CupertinoIcons.back),
                                      style: IconButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                            color: AppColors.dividerColor,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        style: IconButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                              color: AppColors.dividerColor,
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                        onPressed: () {
                                          _selectedDate=_selectedDate.add(const Duration(days: 1));
                                          bloc.changeDateMarks(date: dateFormat.format(_selectedDate));
                                          bloc.dateMarks();
                                        },
                                        icon: const Icon(CupertinoIcons.forward)),
                                  ],
                                ),
                                const Gap(8),
                                const AppDivider(),
                                const Gap(8),
                                state.dateMarks?.dates?.isNotEmpty == true
                                    ? DataTable(
                                    horizontalMargin: 16,
                                    columnSpacing: 16,
                                    showCheckboxColumn: false,
                                    border: TableBorder.all(
                                      color: AppColors.dividerColor,
                                    ),
                                    columns: [
                                      appDataColumn(S.of(context).no),
                                      appDataColumn(S.of(context).fio),
                                      ...List.generate(state.dateMarks?.dates?.length??0, (index) => appDataColumn(S.of(context).baho))
                                    ],
                                    rows: List<DataRow>.generate(state.dateMarks?.students?.length ?? 0,
                                          (index) => DataRow(
                                        onSelectChanged: (selected) {},
                                        cells: <DataCell>[
                                          DataCell(Text('${index + 1}')),
                                          DataCell(Text("${state.dateMarks?.students?[index].student?.lastName} ${state.dateMarks?.students?[index].student?.firstName}")),
                                          ...List.generate(state.dateMarks?.students?[index].marks?.length??0, (markIndex)=>
                                              DataCell(
                                                onTap: !widget.curator ?(){
                                                  showDialog<void>(
                                                    context: context,
                                                    barrierDismissible: true, // user must tap button!
                                                    builder: (BuildContext context) {
                                                      return Dialog(
                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(16.0),
                                                          child: Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: [
                                                              Text(S.of(context).selectRating,style: CustomTextStyle.h22SB,),
                                                              const Gap(20),
                                                              AppElevatedButton(
                                                                text: '5', onClick: (){
                                                                selectRating(state.dateMarks?.dates?[markIndex], 5, state.dateMarks?.students?[index].student?.id);
                                                              },
                                                                bgColor: AppColors.fiveColor,
                                                              ),
                                                              const Gap(8),
                                                              AppElevatedButton(
                                                                text: '4', onClick: (){
                                                                selectRating(state.dateMarks?.dates?[markIndex], 4, state.dateMarks?.students?[index].student?.id);
                                                              },
                                                                bgColor: AppColors.fourColor,
                                                              ),
                                                              const Gap(8),
                                                              AppElevatedButton(
                                                                text: '3', onClick: (){
                                                                selectRating(state.dateMarks?.dates?[markIndex], 3, state.dateMarks?.students?[index].student?.id);
                                                              },
                                                                bgColor: AppColors.threeColor,
                                                              ),
                                                              const Gap(8),
                                                              AppElevatedButton(
                                                                text: '2', onClick: (){
                                                                selectRating(state.dateMarks?.dates?[markIndex], 2, state.dateMarks?.students?[index].student?.id);
                                                              },
                                                                bgColor: AppColors.twoColor,
                                                              ),
                                                              const Gap(8),
                                                              AppElevatedButton(
                                                                text: S.of(context).sbl, onClick: (){
                                                                selectRating(state.dateMarks?.dates?[markIndex], 6, state.dateMarks?.students?[index].student?.id);
                                                              },
                                                                bgColor: AppColors.twoColor.withValues(alpha: 0.2),
                                                                textColor: AppColors.twoColor,
                                                              ),
                                                              const Gap(8),
                                                              AppElevatedButton(
                                                                text: '-', onClick: (){
                                                                selectRating(state.dateMarks?.dates?[markIndex], 7, state.dateMarks?.students?[index].student?.id);
                                                              },
                                                                bgColor: AppColors.twoColor.withValues(alpha: 0.2),
                                                                textColor: AppColors.twoColor,
                                                              ),
                                                              const Gap(8),
                                                              AppElevatedButton(
                                                                text: S.of(context).clear, onClick: (){
                                                                selectRating(state.dateMarks?.dates?[markIndex], null, state.dateMarks?.students?[index].student?.id);
                                                              },
                                                                bgColor: AppColors.dividerColor,
                                                                textColor: AppColors.secondaryTextColor,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }:null,
                                                state.dateMarks?.students?[index].marks?[markIndex] != null
                                                    ? Center(
                                                  child: Container(
                                                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                                    decoration:
                                                    BoxDecoration(
                                                        color: (() {
                                                          switch (state.dateMarks?.students?[index].marks?[markIndex]) {
                                                            case 2:
                                                              return AppColors.twoColor;
                                                            case 3:
                                                              return AppColors.threeColor;
                                                            case 4:
                                                              return AppColors.fourColor;
                                                            case 5:
                                                              return AppColors.fiveColor;
                                                            case 6 || 7:
                                                              return AppColors.twoColor.withValues(alpha: 0.1);
                                                            default:
                                                              return Colors.grey;
                                                          }
                                                        }()),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            4)),
                                                    child: Text(
                                                      switch (state.dateMarks?.students?[index].marks?[markIndex]) {
                                                        2 || 3 || 4 || 5 => '${state.dateMarks?.students?[index].marks?[markIndex]}',
                                                        6 => S.of(context).sbl,
                                                        7 => '-',
                                                        _ => ''
                                                      },
                                                      style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 16,
                                                        color: (state.dateMarks?.students?[index].marks?[markIndex] ?? 0) >= 2 &&
                                                            (state.dateMarks?.students?[index].marks?[markIndex] ?? 0) <= 5
                                                            ? Colors.white
                                                            : AppColors.twoColor,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                    : const SizedBox(),
                                              )
                                          )
                                        ],
                                      ),
                                    ))
                                    : Text(
                                  S.of(context).buKundaMazkurDarsBolmaydi,
                                  style: CustomTextStyle.h16R,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    //quarterly marks
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          BlocBuilder<HomeTeacherBloc, HomeTeacherState>(
                            builder: (context, stateHome) {
                              return AppContainer(
                                margin: EdgeInsets.zero,
                                radius: 8,
                                child: stateHome.quarters?.isNotEmpty==true&&stateHome.currentQuarter!=null?
                                DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    isDense: true,
                                    fillColor: AppColors.bgColor,
                                    border: appTextFiledBorder(),
                                    enabledBorder: appTextFiledBorder(),
                                    disabledBorder: appTextFiledBorder(),
                                    focusedBorder: appTextFiledBorder(),
                                    errorBorder: appTextFiledErrorBorder(),
                                  ),
                                  value:_selectedQuarter,
                                  hint: Text(S.of(context).quarter),
                                  isDense: true,
                                  borderRadius: BorderRadius.circular(8),
                                  items: stateHome.quarters?.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child: Text(S.of(context).quarterByIndex(e.number??0)),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    _selectedQuarter=val;
                                    bloc.quarterlyMarks(PlanBody(quarter: val?.id,record: widget.id));
                                  },
                                ):const SizedBox(),
                              );
                            },
                          ),
                          Gap(16),
                          AppContainer(
                              margin: EdgeInsets.zero,
                              child: state.quarterlyMarks?.isNotEmpty==true
                                  ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                    child: DataTable(
                                    horizontalMargin: 16,
                                    columnSpacing: 16,
                                    showCheckboxColumn: false,
                                    border: TableBorder.all(
                                      color: AppColors.dividerColor,
                                    ),
                                    columns: [
                                      appDataColumn(S.of(context).no),
                                      appDataColumn(S.of(context).fio),
                                      appDataColumn(S.of(context).chorakliknbaho),
                                      appDataColumn(S.of(context).averageRating),
                                      appDataColumn(S.of(context).kelmagan),
                                    ],
                                    rows: List<DataRow>.generate(state.quarterlyMarks?.length ?? 0,
                                          (index) => DataRow(
                                        onSelectChanged: (selected) {},
                                        cells: <DataCell>[
                                          DataCell(Text('${index + 1}',textAlign: TextAlign.center,)),
                                          DataCell(Text("${state.quarterlyMarks?[index].lastName} ${state.quarterlyMarks?[index].firstName}")),
                                          DataCell(
                                            onTap:!widget.curator ?(){
                                              showDialog<void>(
                                                context: context,
                                                barrierDismissible: true, // user must tap button!
                                                builder: (BuildContext context) {
                                                  return Dialog(
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(16.0),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Text(S.of(context).selectRating,style: CustomTextStyle.h22SB,),
                                                          const Gap(20),
                                                          AppElevatedButton(
                                                            text: '5', onClick: (){
                                                            selectRatingQuarterly(_selectedQuarter?.id, 5, state.quarterlyMarks?[index].id);
                                                          },
                                                            bgColor: AppColors.fiveColor,
                                                          ),
                                                          const Gap(8),
                                                          AppElevatedButton(
                                                            text: '4', onClick: (){
                                                            selectRatingQuarterly(_selectedQuarter?.id, 4, state.quarterlyMarks?[index].id);
                                                          },
                                                            bgColor: AppColors.fourColor,
                                                          ),
                                                          const Gap(8),
                                                          AppElevatedButton(
                                                            text: '3', onClick: (){
                                                            selectRatingQuarterly(_selectedQuarter?.id, 3, state.quarterlyMarks?[index].id);
                                                          },
                                                            bgColor: AppColors.threeColor,
                                                          ),
                                                          const Gap(8),
                                                          AppElevatedButton(
                                                            text: '2', onClick: (){
                                                            selectRatingQuarterly(_selectedQuarter?.id, 2, state.quarterlyMarks?[index].id);
                                                          },
                                                            bgColor: AppColors.twoColor,
                                                          ),
                                                          const Gap(8),
                                                          AppElevatedButton(
                                                            text: S.of(context).clear, onClick: (){
                                                            selectRatingQuarterly(_selectedQuarter?.id, null, state.quarterlyMarks?[index].id);
                                                          },
                                                            bgColor: AppColors.dividerColor,
                                                            textColor: AppColors.secondaryTextColor,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }:null,
                                            state.quarterlyMarks?[index].mark != null
                                                ? Center(
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                                decoration:
                                                BoxDecoration(
                                                    color: (() {
                                                      switch (state.quarterlyMarks?[index].mark) {
                                                        case 2:
                                                          return AppColors.twoColor;
                                                        case 3:
                                                          return AppColors.threeColor;
                                                        case 4:
                                                          return AppColors.fourColor;
                                                        case 5:
                                                          return AppColors.fiveColor;
                                                        case 6 || 7:
                                                          return AppColors.twoColor.withValues(alpha: 0.1);
                                                        default:
                                                          return Colors.grey;
                                                      }
                                                    }()),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        4)),
                                                child: Text(
                                                  switch (state.quarterlyMarks?[index].mark) {
                                                    2 || 3 || 4 || 5 => '${state.quarterlyMarks?[index].mark}',
                                                    6 => S.of(context).sbl,
                                                    7 => '-',
                                                    _ => ''
                                                  },
                                                  style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 16,
                                                    color: (state.quarterlyMarks?[index].mark ?? 0) >= 2 &&
                                                        (state.quarterlyMarks?[index].mark ?? 0) <= 5
                                                        ? Colors.white
                                                        : AppColors.twoColor,
                                                  ),
                                                ),
                                              ),
                                            )
                                                : const SizedBox(),
                                          ),
                                          DataCell(Center(child: Text(state.quarterlyMarks?[index].avaMark?.toStringAsFixed(1)??''))),
                                          DataCell(Center(child: Text(state.quarterlyMarks?[index].nbCount.toString()??''))),
                                        ],
                                      ),
                                    )),
                                  )
                                  : const NoInfoText()
                          )
                        ],
                      ),
                    ),
                    //yearly marks
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: AppContainer(
                          margin: EdgeInsets.zero,
                          child: state.quarterlyMarks?.isNotEmpty==true
                              ? DataTable(
                                  horizontalMargin: 16,
                                  columnSpacing: 16,
                                  showCheckboxColumn: false,
                                  border: TableBorder.all(
                                    color: AppColors.dividerColor,
                                  ),
                                  columns: [
                                    appDataColumn(S.of(context).no),
                                    appDataColumn(S.of(context).fio),
                                    appDataColumn(S.of(context).yillikBaho1),
                                  ],
                                  rows: List<DataRow>.generate(state.yearlyMarks?.length ?? 0,
                                        (index) => DataRow(
                                      onSelectChanged: (selected) {},
                                      cells: <DataCell>[
                                        DataCell(Text('${index + 1}',textAlign: TextAlign.center,)),
                                        DataCell(Text("${state.yearlyMarks?[index].lastName} ${state.yearlyMarks?[index].firstName}")),
                                        DataCell(
                                          onTap: !widget.curator? (){
                                            showDialog<void>(
                                              context: context,
                                              barrierDismissible: true, // user must tap button!
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(16.0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Text(S.of(context).selectRating,style: CustomTextStyle.h22SB,),
                                                        const Gap(20),
                                                        AppElevatedButton(
                                                          text: '5', onClick: (){
                                                          selectRatingYearly(5, state.yearlyMarks?[index].id);
                                                        },
                                                          bgColor: AppColors.fiveColor,
                                                        ),
                                                        const Gap(8),
                                                        AppElevatedButton(
                                                          text: '4', onClick: (){
                                                          selectRatingYearly(4, state.yearlyMarks?[index].id);
                                                        },
                                                          bgColor: AppColors.fourColor,
                                                        ),
                                                        const Gap(8),
                                                        AppElevatedButton(
                                                          text: '3', onClick: (){
                                                          selectRatingYearly(3, state.yearlyMarks?[index].id);
                                                        },
                                                          bgColor: AppColors.threeColor,
                                                        ),
                                                        const Gap(8),
                                                        AppElevatedButton(
                                                          text: '2', onClick: (){
                                                          selectRatingYearly(2, state.yearlyMarks?[index].id);
                                                        },
                                                          bgColor: AppColors.twoColor,
                                                        ),
                                                        const Gap(8),
                                                        AppElevatedButton(
                                                          text: S.of(context).clear, onClick: (){
                                                          selectRatingYearly(null, state.yearlyMarks?[index].id);
                                                        },
                                                          bgColor: AppColors.dividerColor,
                                                          textColor: AppColors.secondaryTextColor,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }:null,
                                          state.yearlyMarks?[index].mark != null
                                              ? Center(
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                              decoration:
                                              BoxDecoration(
                                                  color: (() {
                                                    switch (state.yearlyMarks?[index].mark) {
                                                      case 2:
                                                        return AppColors.twoColor;
                                                      case 3:
                                                        return AppColors.threeColor;
                                                      case 4:
                                                        return AppColors.fourColor;
                                                      case 5:
                                                        return AppColors.fiveColor;
                                                      case 6 || 7:
                                                        return AppColors.twoColor.withValues(alpha: 0.1);
                                                      default:
                                                        return Colors.grey;
                                                    }
                                                  }()),
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      4)),
                                              child: Text(
                                                switch (state.yearlyMarks?[index].mark) {
                                                  2 || 3 || 4 || 5 => '${state.yearlyMarks?[index].mark}',
                                                  6 => S.of(context).sbl,
                                                  7 => '-',
                                                  _ => ''
                                                },
                                                style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  fontSize: 16,
                                                  color: (state.yearlyMarks?[index].mark ?? 0) >= 2 && (state.yearlyMarks?[index].mark ?? 0) <= 5
                                                      ? Colors.white
                                                      : AppColors.twoColor,
                                                ),
                                              ),
                                            ),
                                          )
                                              : const SizedBox(),
                                        ),
                                      ],
                                    ),
                                  ))
                              : const NoInfoText()
                      ),
                    ),
                    //Statistics
                    BlocBuilder<HomeTeacherBloc, HomeTeacherState>(
                      builder: (context, stateHome) {
                        return SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              AppContainer(
                                margin: EdgeInsets.zero,
                                radius: 8,
                                child: stateHome.quarters?.isNotEmpty==true&&stateHome.currentQuarter!=null?
                                DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    isDense: true,
                                    fillColor: AppColors.bgColor,
                                    border: appTextFiledBorder(),
                                    enabledBorder: appTextFiledBorder(),
                                    disabledBorder: appTextFiledBorder(),
                                    focusedBorder: appTextFiledBorder(),
                                    errorBorder: appTextFiledErrorBorder(),
                                  ),
                                  value:stateHome.currentQuarter?.number!=null? stateHome.quarters?.where((item)=>item.id==stateHome.currentQuarter?.id).toList().first:stateHome.quarters?.first,
                                  hint: Text(S.of(context).quarter),
                                  isDense: true,
                                  borderRadius: BorderRadius.circular(8),
                                  items: stateHome.quarters?.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child: Text(S.of(context).quarterByIndex(e.number??0)),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    blocHome.record(RecordBody(
                                      record: widget.id,
                                      quarter: val?.number,
                                    ));
                                  },
                                ):const SizedBox(),
                              ),
                              const Gap(16),
                              AppContainer(
                                margin: EdgeInsets.zero,
                                radius: 8,
                                child: Column(
                                  children: [
                                    stateHome.recordTeacherModel!=null?
                                    SfCircularChart(
                                        margin: EdgeInsets.zero,
                                        tooltipBehavior: TooltipBehavior(enable: true),
                                        title: ChartTitle(
                                          text: S.of(context).appropriation,
                                          textStyle: CustomTextStyle.h18SB,
                                          alignment: ChartAlignment.near,
                                        ),
                                        legend: Legend(
                                          isVisible: true,position:
                                        LegendPosition.top,
                                          isResponsive: false,
                                          itemPadding: 16.0,
                                          overflowMode: LegendItemOverflowMode.wrap,
                                          textStyle: CustomTextStyle.h14R,
                                          padding: 16.0,
                                        ),
                                        annotations: [
                                          CircularChartAnnotation(
                                            widget: Text(
                                              "${(stateHome.recordTeacherModel?.markStat?.zero??0) +
                                                  (stateHome.recordTeacherModel?.markStat?.two??0) +
                                                  (stateHome.recordTeacherModel?.markStat?.three??0) +
                                                  (stateHome.recordTeacherModel?.markStat?.four??0) +
                                                  (stateHome.recordTeacherModel?.markStat?.five??0)}",
                                              style: CustomTextStyle.h18SB,
                                            ),
                                          ),
                                        ],
                                        series: <CircularSeries<ChartData, String>>[
                                          DoughnutSeries<ChartData, String>(
                                            explode: true,
                                            innerRadius: '60',
                                            legendIconType: LegendIconType.circle,
                                            dataSource: [
                                              ChartData(S.of(context).baholanmagan, stateHome.recordTeacherModel?.markStat?.zero?.toDouble()??0),
                                              ChartData(S.of(context).score2, stateHome.recordTeacherModel?.markStat?.two?.toDouble()??0),
                                              ChartData(S.of(context).score3, stateHome.recordTeacherModel?.markStat?.three?.toDouble()??0),
                                              ChartData(S.of(context).score4, stateHome.recordTeacherModel?.markStat?.four?.toDouble()??0),
                                              ChartData(S.of(context).score5, stateHome.recordTeacherModel?.markStat?.five?.toDouble()??0),
                                            ],
                                            xValueMapper: (ChartData data, _) => data.x,
                                            yValueMapper: (ChartData data, _) => data.y,
                                            dataLabelMapper: (data,_)=>data.y.toInt().toString(),
                                            dataLabelSettings: const DataLabelSettings(
                                                isVisible: true,
                                                labelPosition: ChartDataLabelPosition.outside,
                                                useSeriesColor: true
                                            ),
                                          )
                                        ]):const Center(child: CircularProgressIndicator(color: AppColors.mainColor,)),
                                  ],
                                ),
                              ),
                              const Gap(16),
                              AppContainer(
                                margin: EdgeInsets.zero,
                                radius: 8,
                                child: Column(
                                  children: [
                                    SfCircularChart(
                                        margin: EdgeInsets.zero,
                                        tooltipBehavior: TooltipBehavior(enable: true),
                                        title: ChartTitle(
                                          text: S.of(context).attendance,
                                          textStyle: CustomTextStyle.h18SB,
                                          alignment: ChartAlignment.near,
                                        ),
                                        legend: Legend(
                                          isVisible: true,
                                          isResponsive: false,
                                          position: LegendPosition.top,
                                          itemPadding: 16.0,
                                          overflowMode: LegendItemOverflowMode.wrap,
                                          textStyle: CustomTextStyle.h14R,
                                          padding: 16.0,
                                        ),
                                        annotations: [
                                          CircularChartAnnotation(
                                            widget: Text(
                                              "${stateHome.recordTeacherModel?.attendancePercentage?.toStringAsFixed(1)}%",
                                              style: CustomTextStyle.h18SB,
                                            ),
                                          ),
                                        ],
                                        series: <CircularSeries<ChartData, String>>[
                                          DoughnutSeries<ChartData, String>(
                                            explode: true,
                                            innerRadius: '60',
                                            legendIconType: LegendIconType.circle,
                                            dataSource:stateHome.recordTeacherModel?.nbStat?.isNotEmpty==true? [
                                              ChartData(S.of(context).validReason, stateHome.recordTeacherModel?.nbStat?[0].count?.toDouble()??0),
                                              if((stateHome.recordTeacherModel?.nbStat?.length??0)>1)
                                              ChartData(S.of(context).noReason, stateHome.recordTeacherModel?.nbStat?[1].count?.toDouble()??0),
                                            ]:[],
                                            xValueMapper: (ChartData data, _) => data.x,
                                            yValueMapper: (ChartData data, _) => data.y,
                                            dataLabelMapper: (data,_)=>data.y.toInt().toString(),
                                            dataLabelSettings: const DataLabelSettings(
                                                isVisible: true,
                                                labelPosition: ChartDataLabelPosition.outside,
                                                useSeriesColor: true
                                            ),
                                            name: 'Gold',
                                          )
                                        ])
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
              ]),
            ),

          ],
        ),
      );
  },
),
    );
  }

  selectRating(int? date,int? mark,int? student){
    bloc.selectRating(SelectRatingBody(
      lessonDate: date,
      mark: mark,
      student: student,
      record: widget.id,
    ));
    context.pop();
  }

  selectRatingQuarterly(int? quarter,int? mark,int? student){
    bloc.selectRatingQuarterly(QuarterlyMarksBody(
      quarter: quarter,
      mark: mark,
      student: student,
      record: widget.id,
    ));
    context.pop();
  }

  selectRatingYearly(int? mark,int? student){
    bloc.selectRatingYearly(YearlyMarksBody(
      mark: mark,
      student: student,
      record: widget.id,
    ));
    context.pop();
  }

  Future<void> _selectDate(BuildContext context,DateTime firstDate,DateTime lastDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      // The earliest selectable date
      lastDate: DateTime(2100),
      // The latest selectable date
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(), // Optional: Apply custom theme
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate=pickedDate;
      bloc.changeDateMarks(date: dateFormat.format(pickedDate));
      bloc.dateMarks();
    }
  }
}
