import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_divider.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/features/student/home/data/models/menu_model.dart';
import 'package:school/src/features/student/home/presentation/manager/home_student_bloc.dart';
import 'package:school/src/features/student/main/widgets/menu_item.dart';

class NutritionStudentPage extends StatefulWidget {
  const NutritionStudentPage({super.key});

  @override
  State<NutritionStudentPage> createState() => _NutritionStudentPageState();
}

class _NutritionStudentPageState extends State<NutritionStudentPage> {
  late final bloc = context.read<HomeStudentBloc>();

  final List<bool> _selectedFruits = <bool>[true, false];

  List<MenuModel> monday = [];
  List<MenuModel> tuesday = [];
  List<MenuModel> wednesday = [];
  List<MenuModel> thursday = [];
  List<MenuModel> friday = [];

  int _order = 1;

  @override
  void initState() {
    bloc.menu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeStudentBloc, HomeStudentState>(
  listener: (context, state) {
    if (state.isMenu) {
      setState(() {
        monday = state.menu?.where((element) => element.weekday == 0 && element.order==_order).toList() ?? [];
        tuesday = state.menu?.where((element) => element.weekday == 1 && element.order==_order).toList() ?? [];
        wednesday = state.menu?.where((element) => element.weekday == 2 && element.order==_order).toList() ?? [];
        thursday = state.menu?.where((element) => element.weekday == 3 && element.order==_order).toList() ?? [];
        friday = state.menu?.where((element) => element.weekday == 4 && element.order==_order).toList() ?? [];
      });
    }
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text(S.of(context).nutrition),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        ToggleButtons(
          onPressed: (int index) {
            setState(() {
              // The button that is tapped is set to true, and the others to false.
              for (int i = 0; i < _selectedFruits.length; i++) {
                _selectedFruits[i] = i == index;
              }
              index==0? _order = 1 : _order = 2;
              setState(() {
                monday = state.menu?.where((element) => element.weekday == 0 && element.order==_order).toList() ?? [];
                tuesday = state.menu?.where((element) => element.weekday == 1 && element.order==_order).toList() ?? [];
                wednesday = state.menu?.where((element) => element.weekday == 2 && element.order==_order).toList() ?? [];
                thursday = state.menu?.where((element) => element.weekday == 3 && element.order==_order).toList() ?? [];
                friday = state.menu?.where((element) => element.weekday == 4 && element.order==_order).toList() ?? [];
              });
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedColor: AppColors.mainColor,
          fillColor: AppColors.mainColor.withValues(alpha: 0.2),
          constraints: const BoxConstraints(minHeight: 40.0, minWidth: 100.0),
          isSelected: _selectedFruits,
          children: [
            Text(S.of(context).weekByIndex(1),style: CustomTextStyle.h16M,),
            Text(S.of(context).weekByIndex(2),style: CustomTextStyle.h16M,),
          ],
        ),
      ],
      body: DefaultTabController(
        length: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 16.0,
          children: [
            Gap(0),
            Container(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white),
              child: TabBar(
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.mainColor.withValues(alpha: 0.2)),
                indicatorSize: TabBarIndicatorSize.tab,
                splashBorderRadius: BorderRadius.circular(8),
                labelStyle: CustomTextStyle.h16R,
                labelColor: AppColors.mainColor,
                tabAlignment: TabAlignment.start,
                unselectedLabelStyle: CustomTextStyle.h16R,
                isScrollable: true,
                tabs: <Widget>[
                  Tab(text: S.of(context).monday),
                  Tab(text: S.of(context).tuesday),
                  Tab(text: S.of(context).wednesday),
                  Tab(text: S.of(context).thursday),
                  Tab(text: S.of(context).friday),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                monday.isNotEmpty
                    ? ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: monday[0].items?.length,
                  itemBuilder: (context, index) => MenuItem(
                    model: monday[0].items?[index],
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
                                      monday[0].items?[index].subject?.label??'-',
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
                                    imageUrl: monday[0].items?[index].image?.file??'',
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
                                      monday[0].items?[index].dishes?.length ?? 0, (index1) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              monday[0].items?[index].dishes?[index1].name ?? "-",
                                              style: CustomTextStyle.h16M,
                                            ),
                                            Text(
                                              S.of(context).kcal(monday[0].items?[index].dishes?[index1].calorie??0),
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
                )
                    : Center(
                    child: Text(
                      S.of(context).noInfoFound,
                      style: CustomTextStyle.h18R,
                    )),
                tuesday.isNotEmpty
                    ? ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: tuesday[0].items?.length,
                  itemBuilder: (context, index) => MenuItem(
                    model: tuesday[0].items?[index],
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
                                      tuesday[0].items?[index].subject?.label??'-',
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
                                    imageUrl: tuesday[0].items?[index].image?.file??'',
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
                                      tuesday[0].items?[index].dishes?.length ?? 0, (index1) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              tuesday[0].items?[index].dishes?[index1].name ?? "-",
                                              style: CustomTextStyle.h16M,
                                            ),
                                            Text(
                                              S.of(context).kcal(tuesday[0].items?[index].dishes?[index1].calorie??0),
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
                )
                    : Center(
                    child: Text(
                      S.of(context).noInfoFound,
                      style: CustomTextStyle.h18R,
                    )),
                wednesday.isNotEmpty
                    ? ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: wednesday[0].items?.length,
                  itemBuilder: (context, index) => MenuItem(
                    model: wednesday[0].items?[index],
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
                                      wednesday[0].items?[index].subject?.label??'-',
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
                                    imageUrl: wednesday[0].items?[index].image?.file??'',
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
                                      wednesday[0].items?[index].dishes?.length ?? 0, (index1) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              wednesday[0].items?[index].dishes?[index1].name ?? "-",
                                              style: CustomTextStyle.h16M,
                                            ),
                                            Text(
                                              S.of(context).kcal(wednesday[0].items?[index].dishes?[index1].calorie??0),
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
                )
                    : Center(
                    child: Text(
                      S.of(context).noInfoFound,
                      style: CustomTextStyle.h18R,
                    )),
                thursday.isNotEmpty
                    ? ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: thursday[0].items?.length,
                  itemBuilder: (context, index) => MenuItem(
                    model: thursday[0].items?[index],
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
                                      thursday[0].items?[index].subject?.label??'-',
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
                                    imageUrl: thursday[0].items?[index].image?.file??'',
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
                                      thursday[0].items?[index].dishes?.length ?? 0, (index1) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              thursday[0].items?[index].dishes?[index1].name ?? "-",
                                              style: CustomTextStyle.h16M,
                                            ),
                                            Text(
                                              S.of(context).kcal(thursday[0].items?[index].dishes?[index1].calorie??0),
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
                )
                    : Center(
                    child: Text(
                      S.of(context).noInfoFound,
                      style: CustomTextStyle.h18R,
                    )),
                friday.isNotEmpty
                    ? ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: friday[0].items?.length,
                  itemBuilder: (context, index) => MenuItem(
                    model: friday[0].items?[index],
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
                                      friday[0].items?[index].subject?.label??'-',
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
                                    imageUrl: friday[0].items?[index].image?.file??'',
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
                                      friday[0].items?[index].dishes?.length ?? 0, (index1) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              friday[0].items?[index].dishes?[index1].name ?? "-",
                                              style: CustomTextStyle.h16M,
                                            ),
                                            Text(
                                              S.of(context).kcal(friday[0].items?[index].dishes?[index1].calorie??0),
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
                )
                    : Center(
                    child: Text(
                      S.of(context).noInfoFound,
                      style: CustomTextStyle.h18R,
                    )),
              ]),
            )
          ],
        ),
      )
    );
  },
);
  }
}
