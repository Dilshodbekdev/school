import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:school/generated/l10n.dart';
import 'package:school/src/config/components/app_container.dart';
import 'package:school/src/config/components/text_field_components.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/config/theme/text_styles.dart';
import 'package:school/src/core/services/services.dart';
import 'package:school/src/core/util/app_constants.dart';
import 'package:school/src/core/util/funs.dart';
import 'package:school/src/features/student/home/data/bodies/rating_body.dart';
import 'package:school/src/features/student/home/data/bodies/science_body.dart';
import 'package:school/src/features/student/home/presentation/manager/home_student_bloc.dart';

class RatingStudentPage extends StatefulWidget {
  const RatingStudentPage({super.key});

  @override
  State<RatingStudentPage> createState() => _RatingStudentPageState();
}

class _RatingStudentPageState extends State<RatingStudentPage> {
  late final bloc = context.read<HomeStudentBloc>();
  int _science = -1;
  int _quarter = -1;

  @override
  void initState() {
    super.initState();
    Prefs.getInt(AppConstants.kClassRef).then((onValue) {
      bloc.sciences(ScienceBody(type: 1, classRef: onValue));
    });
    _quarter=bloc.state.currentQuarter?.number??-1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text(S.of(context).rating),
      ),
      body: BlocBuilder<HomeStudentBloc, HomeStudentState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                AppContainer(
                  margin: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          state.sciences?.isNotEmpty==true?
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
                              isDense: true,
                              isExpanded: true,
                              value: state.sciences?.first,
                              borderRadius: BorderRadius.circular(8),
                              items: state.sciences?.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e.label ?? '--',
                                    style: CustomTextStyle.h14R,
                                  ),
                                );
                              }).toList(),
                              onChanged: (val) {
                                _science = val?.value ?? -1;
                                if (_science != -1 && _quarter != -1) {
                                  bloc.rating(RatingBody(
                                      science: _science,
                                      quarterNumber: _quarter));
                                }
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
                              isDense: true,
                              borderRadius: BorderRadius.circular(8),
                              value:state.currentQuarter?.number!=null? state.quarters?.where((item)=>item.id==state.currentQuarter?.id).toList().first:state.quarters?.first,
                              items: state.quarters?.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    S.of(context).quarterByIndex(e.number??0),
                                    style: CustomTextStyle.h14R,
                                  ),
                                );
                              }).toList(),
                              onChanged: (val) {
                                _quarter = val?.number ?? -1;
                                if (_science != -1 && _quarter != -1) {
                                  bloc.rating(RatingBody(
                                      science: _science,
                                      quarterNumber: _quarter));
                                }
                              },
                            ),
                          ):const SizedBox(),
                        ],
                      ),
                      const Gap(16),
                      state.rating?.isNotEmpty==true?
                      DataTable(
                          showCheckboxColumn: false,
                          dividerThickness: 1,
                          border:
                              TableBorder.all(color: AppColors.dividerColor),
                          columns: [
                            appDataColumn(S.of(context).no),
                            appDataColumn(S.of(context).fanNomi),
                            appDataColumn(S.of(context).baho),
                          ],
                          rows: List<DataRow>.generate(
                            state.rating?.length ?? 0,
                            (index) => DataRow(
                              onSelectChanged: (selected) {},
                              cells: <DataCell>[
                                DataCell(Text('${index + 1}')),
                                DataCell(Text("${state.rating?[index].lastName} ${state.rating?[index].firstName}")),
                                DataCell(Text(state.rating?[index].rank?.toStringAsFixed(1) ?? '0',style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.green),)),
                              ],
                            ),
                          ),
                      ):const Center(child: CircularProgressIndicator(color: AppColors.mainColor,))
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
