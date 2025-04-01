
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/components/text_field_components.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/core/util/funs.dart';
import 'package:school/src/features/student/diary/presentation/manager/diary_student_bloc.dart';
import 'package:school/src/features/student/home/data/models/quarter_student_model.dart';
import 'package:school/src/features/student/home/presentation/manager/home_student_bloc.dart';

class DiaryStudentPage extends StatefulWidget {
  const DiaryStudentPage({super.key});

  @override
  State<DiaryStudentPage> createState() => _DiaryStudentPageState();
}

class _DiaryStudentPageState extends State<DiaryStudentPage>{
  late final bloc = context.read<DiaryStudentBloc>();
  late final blocHome = context.read<HomeStudentBloc>();
  DateTime _selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  QuarterStudentModel? _selectedQuarter;

  @override
  void initState() {
    super.initState();
    _selectedQuarter=blocHome.state.currentQuarter?.number!=null? blocHome.state.quarters?.where((item)=>item.id==blocHome.state.currentQuarter?.id).toList().first:blocHome.state.quarters?.first;
    bloc.changeDate(_selectedDate);
    debugPrint(_selectedDate.toString());
    bloc.dateDiaries(dateFormat.format(_selectedDate));
    bloc.quarterlyDiaries(_selectedQuarter?.id??0);
    bloc.yearlyDiaries();
  }

  @override
  void dispose() {
    super.dispose();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).daily),
      ),
      backgroundColor: AppColors.bgColor,
      body: BlocConsumer<DiaryStudentBloc, DiaryStudentState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return DefaultTabController(
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
                Tab(text: S.of(context).daily),
                Tab(text: S.of(context).chorakBaho),
                Tab(text: S.of(context).yillikBaho),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
                children: [
                  //date daily
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        AppContainer(
                          radius: 16,
                          margin: EdgeInsets.zero,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    DateFormat.yMMMd().format(state.date??_selectedDate),
                                    style: CustomTextStyle.h18SB,
                                  ),
                                  const Spacer(),
                                  BlocBuilder<HomeStudentBloc, HomeStudentState>(
                                    builder: (context, homeState) {
                                      return IconButton(
                                        onPressed: ()=> _selectDate(
                                          context,
                                          homeState.currentQuarter?.startDate!=null? dateFormat.parse(homeState.currentQuarter?.startDate??''):DateTime(2021),
                                          homeState.currentQuarter?.endDate!=null?dateFormat.parse(homeState.currentQuarter?.endDate??''):DateTime(2100),
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
                                      bloc.changeDate(_selectedDate);
                                      bloc.dateDiaries(dateFormat.format(_selectedDate));
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
                                        bloc.changeDate(_selectedDate);
                                        bloc.dateDiaries(dateFormat.format(_selectedDate));
                                      },
                                      icon: const Icon(CupertinoIcons.forward)),
                                ],
                              ),
                              const Gap(8),
                              state.dateDiary!=null?
                              DataTable(
                                  horizontalMargin: 16,
                                  columnSpacing: 16,
                                  showCheckboxColumn: false,
                                  dividerThickness: 1,
                                  border:
                                  TableBorder.all(color: AppColors.dividerColor,borderRadius: BorderRadius.circular(8)),
                                  columns: [
                                    appDataColumn(S.of(context).no),
                                    appDataColumn(S.of(context).fanNomi),
                                    appDataColumn(S.of(context).baho),
                                  ],
                                  rows: List<DataRow>.generate(
                                    state.dateDiary?.length ?? 0, (index) => DataRow(
                                    onSelectChanged: (selected) {},
                                    cells: <DataCell>[
                                      DataCell(Center(child: Text('${index + 1}',textAlign: TextAlign.center,))),
                                      DataCell(
                                          Center(
                                            child: Text(state.dateDiary?[index].subjects!=null&&state.dateDiary?[index].subjects?.isNotEmpty==true?(state.dateDiary?[index].subjects?.map((e)=>e).toList().join(', ')??'-'):"-",
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                            ),
                                          )
                                      ),
                                      DataCell(
                                        state.dateDiary?[index].mark != null
                                            ? Center(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                            decoration:
                                            BoxDecoration(
                                                color: (() {
                                                  switch (state.dateDiary?[index].mark) {
                                                    case 2:
                                                      return AppColors.twoColor;
                                                    case 3:
                                                      return AppColors.threeColor;
                                                    case 4:
                                                      return AppColors.fourColor;
                                                    case 5:
                                                      return AppColors.fiveColor;
                                                    case 6 || 7:
                                                      return AppColors.twoColor.withOpacity(0.1);
                                                    default:
                                                      return Colors.grey;
                                                  }
                                                }()),
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    4)),
                                            child: Text(
                                              switch (state.dateDiary?[index].mark) {
                                                2 || 3 || 4 || 5 => '${state.dateDiary?[index].mark}',
                                                6 => S.of(context).sbl,
                                                7 => '-',
                                                _ => ''
                                              },
                                              style: TextStyle(
                                                fontWeight:
                                                FontWeight.w500,
                                                fontSize: 16,
                                                color: (state.dateDiary?[index].mark ?? 0) >= 2 && (state.dateDiary?[index].mark ?? 0) <= 5
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
                                  )):
                              const Center(child: CircularProgressIndicator(color: AppColors.mainColor,))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //quarterly diary
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        BlocBuilder<HomeStudentBloc, HomeStudentState>(
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
                                value: _selectedQuarter,
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
                                  bloc.quarterlyDiaries(val?.id??0);
                                },
                              ):const SizedBox(),
                            );
                          },
                        ),
                        Gap(16),
                        AppContainer(
                          radius: 16,
                          wight: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.zero,
                          child: state.quarterlyDiary!=null?
                          DataTable(
                              horizontalMargin: 16,
                              columnSpacing: 16,
                              showCheckboxColumn: false,
                              dividerThickness: 1,
                              border:
                              TableBorder.all(color: AppColors.dividerColor,borderRadius: BorderRadius.circular(8)),
                              columns: [
                                appDataColumn(S.of(context).no),
                                appDataColumn(S.of(context).fanNomi),
                                appDataColumn(S.of(context).chorakliknbaho),
                              ],
                              rows: List<DataRow>.generate(
                                state.quarterlyDiary?.length ?? 0, (index) => DataRow(
                                onSelectChanged: (selected) {},
                                cells: <DataCell>[
                                  DataCell(Center(child: Text('${index + 1}'))),
                                  DataCell(
                                      Center(
                                        child: Text(state.quarterlyDiary?[index].subjectName??'-',
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                        ),
                                      )
                                  ),
                                  DataCell(
                                    state.quarterlyDiary?[index].mark != null
                                        ? Center(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                        decoration:
                                        BoxDecoration(
                                            color: (() {
                                              switch (state.quarterlyDiary?[index].mark) {
                                                case 2:
                                                  return AppColors.twoColor;
                                                case 3:
                                                  return AppColors.threeColor;
                                                case 4:
                                                  return AppColors.fourColor;
                                                case 5:
                                                  return AppColors.fiveColor;
                                                case 6 || 7:
                                                  return AppColors.twoColor.withOpacity(0.1);
                                                default:
                                                  return Colors.grey;
                                              }
                                            }()),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                4)),
                                        child: Text(
                                          switch (state.quarterlyDiary?[index].mark) {
                                            2 || 3 || 4 || 5 => '${state.quarterlyDiary?[index].mark}',
                                            6 => S.of(context).sbl,
                                            7 => '-',
                                            _ => ''
                                          },
                                          style: TextStyle(
                                            fontWeight:
                                            FontWeight.w500,
                                            fontSize: 16,
                                            color: (state.quarterlyDiary?[index].mark ?? 0) >= 2 && (state.quarterlyDiary?[index].mark ?? 0) <= 5
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
                              )):
                          const Center(child: CircularProgressIndicator(color: AppColors.mainColor,)),
                        ),
                      ],
                    ),
                  ),
                  //yearly diary
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        AppContainer(
                          wight: MediaQuery.of(context).size.width,
                          radius: 16,
                          margin: EdgeInsets.zero,
                          child: state.yearlyDiary!=null?
                          DataTable(
                              horizontalMargin: 16,
                              columnSpacing: 16,
                              showCheckboxColumn: false,
                              dividerThickness: 1,
                              border:
                              TableBorder.all(color: AppColors.dividerColor,borderRadius: BorderRadius.circular(8)),
                              columns: [
                                appDataColumn(S.of(context).no),
                                appDataColumn(S.of(context).fanNomi),
                                appDataColumn(S.of(context).yillikBaho1),
                              ],
                              rows: List<DataRow>.generate(
                                state.yearlyDiary?.length ?? 0, (index) => DataRow(
                                onSelectChanged: (selected) {},
                                cells: <DataCell>[
                                  DataCell(Center(child: Text('${index + 1}'))),
                                  DataCell(
                                      Center(
                                        child: Text(state.yearlyDiary?[index].subjectName??'-',
                                          textAlign: TextAlign.center,
                                        maxLines: 2,),
                                      )
                                  ),
                                  DataCell(
                                    state.yearlyDiary?[index].mark != null
                                        ? Center(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                        decoration:
                                        BoxDecoration(
                                            color: (() {
                                              switch (state.yearlyDiary?[index].mark) {
                                                case 2:
                                                  return AppColors.twoColor;
                                                case 3:
                                                  return AppColors.threeColor;
                                                case 4:
                                                  return AppColors.fourColor;
                                                case 5:
                                                  return AppColors.fiveColor;
                                                case 6 || 7:
                                                  return AppColors.twoColor.withOpacity(0.1);
                                                default:
                                                  return Colors.grey;
                                              }
                                            }()),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                4)),
                                        child: Text(
                                          switch (state.yearlyDiary?[index].mark) {
                                            2 || 3 || 4 || 5 => '${state.yearlyDiary?[index].mark}',
                                            6 => S.of(context).sbl,
                                            7 => '-',
                                            _ => ''
                                          },
                                          style: TextStyle(
                                            fontWeight:
                                            FontWeight.w500,
                                            fontSize: 16,
                                            color: (state.yearlyDiary?[index].mark ?? 0) >= 2 && (state.yearlyDiary?[index].mark ?? 0) <= 5
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
                              )):
                          const Center(child: CircularProgressIndicator(color: AppColors.mainColor,)),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),

        ],
      ),
    );
  },
),
    );
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
      bloc.changeDate(_selectedDate);
      bloc.dateDiaries(dateFormat.format(_selectedDate));
    }
  }
}