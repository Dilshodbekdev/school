
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/components/app_divider.dart';
import 'package:school/src/config/components/text_field_components.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/core/app_state/cubit/app_cubit.dart';
import 'package:school/src/core/router/app_routes.dart';
import 'package:school/src/features/student/home/data/bodies/menu_weekday_body.dart';
import 'package:school/src/features/student/home/data/models/statistic_student_attendance_model.dart';
import 'package:school/src/features/student/home/data/models/timetable_student_model.dart';
import 'package:school/src/features/student/home/presentation/manager/home_student_bloc.dart';
import 'package:school/src/features/student/main/widgets/home_card_widget.dart';
import 'package:school/src/features/student/main/widgets/menu_item.dart';
import 'package:school/src/features/student/main/widgets/news_item.dart';
import 'package:school/src/features/student/main/widgets/see_all_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeStudentPage extends StatefulWidget {
  const HomeStudentPage({super.key});

  @override
  State<HomeStudentPage> createState() => _HomeStudentPageState();
}

class _HomeStudentPageState extends State<HomeStudentPage>
    with SingleTickerProviderStateMixin {
  late final bloc = context.read<HomeStudentBloc>();

  @override
  void initState() {
    super.initState();
    bloc.news();
    _tabController = TabController(length: 2, vsync: this);
    bloc.changeCurrentDate(DateTime.now());
    bloc.currentDayMenu(MenuWeekdayBody(weekday: null));
    bloc.currentQuarter();
    bloc.timetable();
    bloc.times();
    bloc.quarters();
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
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return Scaffold(
          backgroundColor: AppColors.bgColor,
          body: NestedScrollView(
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
                  /*actions: [
                    IconButton(onPressed: (){}, icon: Badge.count(
                        count: 1,
                        child: const Icon(Icons.notifications_outlined,color: Colors.white,size: 27,)))
                  ],*/
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
            body: BlocBuilder<HomeStudentBloc, HomeStudentState>(
              builder: (context, state) {
                return TabBarView(
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
                                      Text(
                                        DateFormat.MMMEd().format(state.currentDate??DateTime.now()),
                                        style: CustomTextStyle.h16M,
                                      ),
                                      const Spacer(),
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
                                    children: List.generate(
                                        state.times?.length ?? 0, (index) {
                                      List<TimetableStudentModel> lessons = state.timetables?.where((item) =>
                                          item.weekday == ((state.currentDate?.weekday??DateTime.now().weekday)-1) && item.sequence == state.times?[index].id).toList() ?? [];
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
                                                              lessons[0].lessons?[index].subject?.name ?? '-',
                                                              style: const TextStyle(
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 18,
                                                                  color: Colors.black,
                                                              ),
                                                            ),
                                                            Text(
                                                              lessons[0].lessons?[index].teacher?.lastName ?? '-',
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
                            /*const Gap(16),
                            HomeCardWidget(
                                title: S.of(context).recommendationsforyou,
                                content: S.of(context).seeai,
                                onClick: () {
                                },
                                img: 'assets/images/img_for_you.png'),*/
                            SeeAllWidget(
                                text: S.of(context).nutrition,
                                onClick: () {
                                  context.pushNamed(AppRoutes.nutritionStudent.name);
                                }),
                            state.currentDayMenu!=null?
                            SizedBox(
                                height: 144,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  itemCount: state.currentDayMenu?.items?.length,
                                  itemBuilder: (context, index) => MenuItem(
                                      model: state.currentDayMenu?.items?[index],
                                      onClick: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          backgroundColor: Colors.white,
                                          builder: (BuildContext context) {
                                            return Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child: Column(
                                                spacing: 16.0,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        state.currentDayMenu?.items?[index].subject?.label??'-',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                      IconButton(onPressed: (){
                                                        context.pop();
                                                      }, icon: Icon(Icons.close))
                                                    ],
                                                  ),
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(12),
                                                    child: CachedNetworkImage(
                                                      width: 120,
                                                      height: 120,
                                                      imageUrl: state.currentDayMenu?.items?[index].image?.file??'',
                                                      fit: BoxFit.fill,
                                                      progressIndicatorBuilder:
                                                          (context, url, downloadProgress) => Center(
                                                          child: CircularProgressIndicator(
                                                            value: downloadProgress.progress,
                                                            color: AppColors.mainColor,
                                                          )),
                                                      errorWidget: (context, url, error) =>  Image.asset('assets/images/img_placeholder.jpg',fit: BoxFit.cover,),
                                                    ),
                                                  ),
                                                  Column(
                                                    children: List.generate(
                                                        state.currentDayMenu?.items?[index].dishes?.length ?? 0, (index1) {
                                                      return Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                                state.currentDayMenu?.items?[index].dishes?[index1].name ?? "-",
                                                                style: CustomTextStyle.h16M,
                                                              ),
                                                              Text(
                                                                S.of(context).kcal(state.currentDayMenu?.items?[index].dishes?[index1].calorie??0),
                                                                style: const TextStyle(
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.w500,
                                                                    color: Colors.grey),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                                                            child: AppDivider(),
                                                          )
                                                        ],
                                                      );
                                                    }),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                  ),
                                )):const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: CircularProgressIndicator(color: AppColors.mainColor,),
                                ),
                            SeeAllWidget(text: S.of(context).schoolNews, onClick: () {
                              context.pushNamed(AppRoutes.allNewsStudent.name);
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
                                            context.pushNamed(AppRoutes.newDetailsStudent.name);
                                          },
                                  ),
                                ),
                              ),
                            ):const Center(child: CircularProgressIndicator(color: AppColors.mainColor,)),
                          ],
                        )),
                    //Statistics
                    SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        children: [
                          HomeCardWidget(
                              title: S.of(context).rating,
                              content: S.of(context).seeai,
                              onClick: () {
                                context.pushNamed(AppRoutes.ratingStudent.name);
                              },
                              img: 'assets/images/img_rating.png'),
                          AppContainer(
                            margin: const EdgeInsets.all(16),
                            radius: 8,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      S.of(context).attendance,
                                      style: CustomTextStyle.h18SB,
                                    ),
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
                                        hint: Text(S.of(context).quarter),
                                        value:state.currentQuarter?.number!=null? state.quarters?.where((item)=>item.id==state.currentQuarter?.id).toList().first:state.quarters?.first,
                                        isDense: true,
                                        borderRadius: BorderRadius.circular(8),
                                        items: state.quarters?.map((e) {
                                          return DropdownMenuItem(
                                            value: e,
                                            child: Text(S.of(context).quarterByIndex(e.number??0),style: CustomTextStyle.h14R,),
                                          );
                                        }).toList(),
                                        onChanged: (val) {
                                          bloc.statisticStudentAttendance(val?.number??0);
                                        },
                                      ),
                                    ):const SizedBox(),
                                  ],
                                ),
                                const Gap(16),
                                state.statisticStudentAttendance!=null?
                                SizedBox(
                                  height: 600,
                                  child: SfCartesianChart(
                                    margin: EdgeInsets.zero,
                                    series: [
                                      BarSeries<StatisticStudentAttendanceModel, String> (
                                        dataSource: state.statisticStudentAttendance??[],
                                        xValueMapper: (StatisticStudentAttendanceModel exp, _) => exp.name,
                                        yValueMapper: (StatisticStudentAttendanceModel exp, _) => exp.percent,
                                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                        color: Colors.amber,
                                        dataLabelMapper: (a,s){
                                          return '${a.percent?.toInt()}%';
                                        },
                                        width: 0.5,
                                        dataLabelSettings: const DataLabelSettings(
                                            isVisible: true,
                                            labelAlignment: ChartDataLabelAlignment.top,
                                          textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white)
                                        ),
                                      ),
                                    ],
                                    primaryXAxis: const CategoryAxis(
                                      labelPosition: ChartDataLabelPosition.inside,

                                    ),
                                    primaryYAxis: const NumericAxis(
                                        minimum: 0,
                                        maximum: 100,
                                        interval: 20,
                                        majorTickLines: MajorTickLines(size: 0)),
                                    borderWidth: 2,
                                  ),
                                )
                                    :const Center(child: CircularProgressIndicator(color: AppColors.mainColor,)),
                              ],
                            ),
                          ),
                          AppContainer(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            radius: 8,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      S.of(context).appropriation,
                                      style: CustomTextStyle.h18SB,
                                    ),
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
                                        hint: Text(S.of(context).quarter),
                                        isDense: true,
                                        borderRadius: BorderRadius.circular(8),
                                        value:state.currentQuarter?.number!=null? state.quarters?.where((item)=>item.id==state.currentQuarter?.id).toList().first:state.quarters?.first,
                                        items: state.quarters?.map((e) {
                                          return DropdownMenuItem(
                                            value: e,
                                            child:
                                            Text(S.of(context).quarterByIndex(e.number??0),style: CustomTextStyle.h14R,),
                                          );
                                        }).toList(),
                                        onChanged: (val) {
                                          bloc.statisticStudentAppropriation(val?.number??0);
                                        },
                                      ),
                                    ):const SizedBox.shrink(),
                                  ],
                                ),
                                state.statisticStudentAppropriation!=null?
                                Column(
                                  children: List.generate(state.statisticStudentAppropriation?.length??0, (index){
                                    return Container(
                                      padding: const EdgeInsets.all(16),
                                      margin: const EdgeInsets.only(top: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.mainColor.withValues(alpha: 0.1)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex:2,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(state.statisticStudentAppropriation?[index].name??'--',style: CustomTextStyle.h16SB.copyWith(color: AppColors.cardColor),),
                                                Text(S.of(context).ratingCount(state.statisticStudentAppropriation?[index].count??0),style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.grey),),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          Flexible(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                CircularPercentIndicator(
                                                  radius: 32.0,
                                                  lineWidth: 6,
                                                  percent: (state.statisticStudentAppropriation?[index].avgMark??1) / 5,
                                                  circularStrokeCap: CircularStrokeCap.round,
                                                  animation: true,
                                                  center: Text(state.statisticStudentAppropriation?[index].avgMark?.toStringAsFixed(1)??'0',style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.black),),
                                                  progressColor: AppColors.mainColor,
                                                  backgroundColor: Colors.white,
                                                ),
                                                Text(
                                                  S.of(context).averageRating,
                                                  style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: AppColors.mainColor),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                ):const Center(child: CircularProgressIndicator(color: AppColors.mainColor,))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}