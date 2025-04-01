import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/components/app_divider.dart';
import 'package:school/src/config/components/text_field_components.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/core/router/app_routes.dart';
import 'package:school/src/features/student/home/data/models/timetable_student_model.dart';
import 'package:school/src/features/student/main/widgets/news_item.dart';
import 'package:school/src/features/student/main/widgets/see_all_widget.dart';
import 'package:school/src/features/teacher/home/data/bodies/record_body.dart';
import 'package:school/src/features/teacher/home/data/models/chart_data.dart';
import 'package:school/src/features/teacher/home/presentation/manager/home_teacher_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeTeacherPage extends StatefulWidget {
  const HomeTeacherPage({super.key});

  @override
  State<HomeTeacherPage> createState() => _HomeTeacherPageState();
}

class _HomeTeacherPageState extends State<HomeTeacherPage>
    with SingleTickerProviderStateMixin {
  late final bloc = context.read<HomeTeacherBloc>();
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  int _record = -1;
  int _quarter = -1;

  @override
  void initState() {
    super.initState();
    bloc.news();
    _tabController = TabController(length: 2, vsync: this);
    bloc.timetable();
    bloc.times();
    bloc.quarters();
    bloc.currentQuarter();
    bloc.myRecords();
    bloc.changeCurrentDate(DateTime.now());
  }

  @override
  void dispose() {
    _scrollController.dispose();
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

  late final TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: BlocConsumer<HomeTeacherBloc, HomeTeacherState>(
  listener: (context, state) {
    if(state.isMyRecord){
      bloc.record(RecordBody(record: state.myRecords?.first.id,quarter: state.currentQuarter?.number));
    }
    if(state.isCurrentQuarter){
      bloc.record(RecordBody(record: state.myRecords?.first.id,quarter: state.currentQuarter?.number));
    }
  },
  builder: (context, state) {
    return NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: AppColors.mainColor,
              title: Text(
                S.of(context).home,
                style: CustomTextStyle.h24SB,
              ),
              titleTextStyle: CustomTextStyle.h14M,
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 88),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                  child: TabBar(
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: CustomTextStyle.h16SB,
                    labelColor: Colors.black,
                    unselectedLabelStyle: CustomTextStyle.h16SB,
                    unselectedLabelColor: Colors.white,
                    tabs: <Tab>[
                      Tab(text: S.of(context).home),
                      Tab(text: S.of(context).statistics),
                    ],
                    controller: _tabController,
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            //MAIN
            SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    AppContainer(
                      radius: 16,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.of(context).darsJadvali,style: CustomTextStyle.h18SB,),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  DateFormat.MMMEd().format(state.currentDate??DateTime.now()),
                                  style: CustomTextStyle.h16M,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Gap(16),
                              IconButton(
                                onPressed: () {
                                  final date=state.currentDate?.subtract(const Duration(days: 1));
                                  bloc.changeCurrentDate(date??DateTime.now());
                                },
                                icon: const Icon(CupertinoIcons.back),
                                style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(color: AppColors.dividerColor, width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              IconButton(
                                  style: IconButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(color: AppColors.dividerColor, width: 2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    final date=state.currentDate?.add(const Duration(days: 1));
                                    bloc.changeCurrentDate(date??DateTime.now());
                                  },
                                  icon: const Icon(CupertinoIcons.forward)),
                            ],
                          ),
                          const Gap(8),
                          const AppDivider(),
                          state.timetables!=null&&state.times!=null?
                          Column(
                            children: List.generate(state.times?.length ?? 0, (index) {
                              List<TimetableStudentModel> lessons = state.timetables?.where((item) => item.weekday == ((state.currentDate?.weekday??DateTime.now().weekday) - 1) && item.sequence == state.times?[index].id).toList() ?? [];
                              return Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 60,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.times?[index].startTime ?? '--',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            state.times?[index].endTime ?? '--',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: AppColors.secondaryTextColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 2.5,
                                      height: 50,
                                      color: Colors.redAccent,
                                    ),
                                    lessons.isNotEmpty
                                        ? Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                          children: List.generate(lessons[0].lessons?.length ?? 0, (index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 12),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${lessons[0].classRef?.number}-${lessons[0].classRef?.letter}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                lessons[0].lessons?[index].subject?.name??'--',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: AppColors.secondaryTextColor,
                                                ),
                                              ),
                                              if((lessons[0].lessons?.length??0)>1)
                                                SizedBox(
                                                    width: 200,
                                                    child: AppDivider())
                                            ],
                                          ),
                                        );
                                          }),
                                    )
                                        : const SizedBox()
                                  ],
                                ),
                              );
                            }),
                          ):const Center(child: CircularProgressIndicator(color: AppColors.mainColor,))
                        ],
                      ),
                    ),
                    const Gap(16),
                    SeeAllWidget(text: S.of(context).schoolNews, onClick: () {
                      context.pushNamed(AppRoutes.allNewsTeacher.name);
                    }),
                    state.places.isNotEmpty?
                    SizedBox(
                      height: 300,
                      child: LazyLoadScrollView(
                        scrollDirection: Axis.horizontal,
                        isLoading: state.isPaging,
                        onEndOfPage: () => bloc.pagingNews(),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
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
                    ):const Center(child: CircularProgressIndicator(color: AppColors.mainColor,)),
                  ],
                )),
            //Statistics
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AppContainer(
                    margin: EdgeInsets.zero,
                    radius: 8,
                    child: Row(
                      children: [
                        state.myRecords?.isNotEmpty==true?
                        Expanded(
                          child: DropdownButtonFormField(
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
                            value: state.myRecords?.first,
                            hint: Text(S.of(context).classes),
                            isDense: true,
                            borderRadius: BorderRadius.circular(8),
                            items: state.myRecords?.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text("${e.classRef?.number}-${e.classRef?.letter}"),
                              );
                            }).toList(),
                            onChanged: (val) {
                              _record = val?.id ?? -1;
                                bloc.record(RecordBody(
                                  record: _record,
                                  quarter: _quarter!=-1?_quarter:state.currentQuarter?.number,
                                ));
                            },
                          ),
                        ):const SizedBox(),
                        const Gap(16),
                        state.quarters?.isNotEmpty==true&&state.currentQuarter!=null?
                        Expanded(
                          child: DropdownButtonFormField(
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
                            value:state.currentQuarter?.number!=null? state.quarters?.where((item)=>item.id==state.currentQuarter?.id).toList().first??state.quarters?.first:state.quarters?.first,
                            hint: Text(S.of(context).quarter),
                            isDense: true,
                            borderRadius: BorderRadius.circular(8),
                            items: state.quarters?.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(S.of(context).quarterByIndex(e.number??0)),
                              );
                            }).toList(),
                            onChanged: (val) {
                              _quarter = val?.number ?? -1;
                              if (_record != -1 && _quarter != -1) {
                                bloc.record(RecordBody(
                                  record: _record,
                                  quarter: _quarter,
                                ));
                              }
                            },
                          ),
                        ):const SizedBox(),
                      ],
                    ),
                  ),
                  const Gap(16),
                  AppContainer(
                    margin: EdgeInsets.zero,
                    radius: 8,
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        state.recordTeacherModel!=null?
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
                                      "${(state.recordTeacherModel?.markStat?.zero??0) +
                                          (state.recordTeacherModel?.markStat?.two??0) +
                                          (state.recordTeacherModel?.markStat?.three??0) +
                                          (state.recordTeacherModel?.markStat?.four??0) +
                                          (state.recordTeacherModel?.markStat?.five??0)}",
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
                                  ChartData(S.of(context).baholanmagan, state.recordTeacherModel?.markStat?.zero?.toDouble()??0),
                                  ChartData(S.of(context).score2, state.recordTeacherModel?.markStat?.two?.toDouble()??0),
                                  ChartData(S.of(context).score3, state.recordTeacherModel?.markStat?.three?.toDouble()??0),
                                  ChartData(S.of(context).score4, state.recordTeacherModel?.markStat?.four?.toDouble()??0),
                                  ChartData(S.of(context).score5, state.recordTeacherModel?.markStat?.five?.toDouble()??0),
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
                    padding: EdgeInsets.zero,
                    radius: 8,
                    child: Column(
                      children: [
                        Text(S.of(context).attendance,style: CustomTextStyle.h18SB,),
                        SfCircularChart(
                            margin: EdgeInsets.zero,
                            tooltipBehavior: TooltipBehavior(enable: true),
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
                                  "${state.recordTeacherModel?.attendancePercentage?.toStringAsFixed(1)}%",
                                  style: CustomTextStyle.h18SB,
                                ),
                              ),
                            ],
                            series: <CircularSeries<ChartData, String>>[
                              DoughnutSeries<ChartData, String>(
                                explode: true,
                                innerRadius: '60',
                                legendIconType: LegendIconType.circle,
                                dataSource:state.recordTeacherModel?.nbStat?.isNotEmpty==true? [
                                  ChartData(S.of(context).validReason, state.recordTeacherModel?.nbStat?[0].count?.toDouble()??0),
                                  if((state.recordTeacherModel?.nbStat?.length??0)>1)
                                  ChartData(S.of(context).noReason, state.recordTeacherModel?.nbStat?[1].count?.toDouble()??0),
                                ]:[],
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                dataLabelMapper: (data,_)=>data.y.toInt().toString(),
                                dataLabelSettings: const DataLabelSettings(
                                    isVisible: true,
                                    labelPosition: ChartDataLabelPosition.outside,
                                    useSeriesColor: true
                                ),
                              )
                            ])
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  },
),
    );
  }
}