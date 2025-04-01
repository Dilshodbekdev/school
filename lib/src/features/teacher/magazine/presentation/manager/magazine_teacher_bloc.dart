import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/date_marks_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/import_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/plan_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/quarterly_marks_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/select_rating_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/update_plan_body.dart';
import 'package:school/src/features/teacher/magazine/data/bodies/yearly_marks_body.dart';
import 'package:school/src/features/teacher/magazine/data/models/class_record_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/curator_class_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/date_marks_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/import_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/plan_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/quarterly_marks_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/read_column_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/data/models/yearly_marks_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/class_records_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/curator_classes_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/date_marks_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/delete_plan_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/import_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/plans_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/quarterly_marks_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/read_columns_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/select_rating_quarterly_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/select_rating_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/select_rating_yearly_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/update_plan_teacher_use_case.dart';
import 'package:school/src/features/teacher/magazine/domain/use_case/yearly_marks_teacher_use_case.dart';

part 'magazine_teacher_event.dart';

part 'magazine_teacher_state.dart';

class MagazineTeacherBloc
    extends Bloc<MagazineTeacherEvent, MagazineTeacherState> {
  final CuratorClassesTeacherUseCase _curatorClassesTeacherUseCase;
  final ClassRecordsTeacherUseCase _classRecordsTeacherUseCase;
  final DateMarksTeacherUseCase _dateMarksTeacherUseCase;
  final QuarterlyMarksTeacherUseCase _quarterlyMarksTeacherUseCase;
  final YearlyMarksTeacherUseCase _yearlyMarksTeacherUseCase;
  final SelectRatingTeacherUseCase _selectRatingTeacherUseCase;
  final SelectRatingQuarterlyTeacherUseCase _selectRatingQuarterlyTeacherUseCase;
  final SelectRatingYearlyTeacherUseCase _selectRatingYearlyTeacherUseCase;
  final PlansTeacherUseCase _plansTeacherUseCase;
  final UpdatePlanTeacherUseCase _updatePlanTeacherUseCase;
  final DeletePlanTeacherUseCase _deletePlanTeacherUseCase;
  final ReadColumnsTeacherUseCase _readColumnsTeacherUseCase;
  final ImportTeacherUseCase _importTeacherUseCase;

  MagazineTeacherBloc(
    this._curatorClassesTeacherUseCase,
    this._classRecordsTeacherUseCase,
    this._dateMarksTeacherUseCase,
    this._selectRatingTeacherUseCase,
    this._plansTeacherUseCase,
    this._updatePlanTeacherUseCase,
    this._deletePlanTeacherUseCase,
    this._readColumnsTeacherUseCase,
    this._importTeacherUseCase,
    this._quarterlyMarksTeacherUseCase,
    this._yearlyMarksTeacherUseCase,
    this._selectRatingQuarterlyTeacherUseCase,
    this._selectRatingYearlyTeacherUseCase,
  ) : super(MagazineTeacherState()) {
    on<CuratorClassesEvent>((event, emit) async {
      await emit.onEach(_onCuratorClasses(event), onData: emit.call);
    });

    on<ClassRecordsEvent>((event, emit) async {
      await emit.onEach(_onClassRecords(event), onData: emit.call);
    });

    on<DateMarksEvent>((event, emit) async {
      await emit.onEach(_onDateMarks(event), onData: emit.call);
    });

    on<QuarterlyMarksEvent>((event, emit) async {
      await emit.onEach(_onQuarterlyMarks(event), onData: emit.call);
    });

    on<YearlyMarksEvent>((event, emit) async {
      await emit.onEach(_onYearlyMarks(event), onData: emit.call);
    });

    on<SelectRatingEvent>((event, emit) async {
      await emit.onEach(_onSelectRatingMarks(event), onData: emit.call);
    });

    on<SelectRatingQuarterlyEvent>((event, emit) async {
      await emit.onEach(_onSelectRatingQuarterlyMarks(event),
          onData: emit.call);
    });

    on<SelectRatingYearlyEvent>((event, emit) async {
      await emit.onEach(_onSelectRatingYearlyMarks(event),
          onData: emit.call);
    });

    on<PlansEvent>((event, emit) async {
      await emit.onEach(_onPlans(event), onData: emit.call);
    });

    on<ReadColumnsEvent>((event, emit) async {
      await emit.onEach(_onReadColumns(event), onData: emit.call);
    });

    on<UpdatePlanEvent>((event, emit) async {
      await emit.onEach(_onUpdatePlan(event), onData: emit.call);
    });

    on<DeletePlanEvent>((event, emit) async {
      await emit.onEach(_onDeletePlan(event), onData: emit.call);
    });

    on<ImportEvent>((event, emit) async {
      await emit.onEach(_onImport(event), onData: emit.call);
    });

    on<DateMarksBodyEvent>((event, emit) async {
      emit(
        state.copyWith(
          dateMarksBody: state.dateMarksBody?.copyWith(
                record: event.record,
                date: event.date,
              ) ??
              DateMarksBody().copyWith(
                record: event.record,
                date: event.date,
              ),
        ),
      );
    });
  }

  curatorClasses() {
    add(CuratorClassesEvent());
  }

  classRecords(int id) {
    add(ClassRecordsEvent(id: id));
  }

  deletePlan(int id) {
    add(DeletePlanEvent(id: id));
  }

  dateMarks() {
    add(DateMarksEvent());
  }

  quarterlyMarks(PlanBody body) {
    add(QuarterlyMarksEvent(body: body));
  }

  yearlyMarks(int record) {
    add(YearlyMarksEvent(record: record));
  }

  plans(PlanBody body) {
    add(PlansEvent(body: body));
  }

  updatePlan(UpdatePlanBody body) {
    add(UpdatePlanEvent(body: body));
  }

  selectRating(SelectRatingBody body) {
    add(SelectRatingEvent(body: body));
  }

  selectRatingQuarterly(QuarterlyMarksBody body) {
    add(SelectRatingQuarterlyEvent(body: body));
  }

  selectRatingYearly(YearlyMarksBody body) {
    add(SelectRatingYearlyEvent(body: body));
  }

  readColumns(File file) {
    add(ReadColumnsEvent(file: file));
  }

  import(ImportBody body) {
    add(ImportEvent(body: body));
  }

  changeDateMarks({String? date, int? record}) {
    add(DateMarksBodyEvent(date, record));
  }

  Stream<MagazineTeacherState> _onCuratorClasses(
      CuratorClassesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _curatorClassesTeacherUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(curatorClasses: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MagazineTeacherState> _onClassRecords(ClassRecordsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _classRecordsTeacherUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(classRecords: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MagazineTeacherState> _onDateMarks(DateMarksEvent event) async* {
    yield state.copyWith(isLoading: false);

    final dataState =
        await _dateMarksTeacherUseCase.call(params: state.dateMarksBody!);

    if (dataState is DataSuccess) {
      yield state.copyWith(dateMarks: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MagazineTeacherState> _onQuarterlyMarks(
      QuarterlyMarksEvent event) async* {
    yield state.copyWith(isLoading: false);

    final dataState =
        await _quarterlyMarksTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(quarterlyMarks: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MagazineTeacherState> _onYearlyMarks(YearlyMarksEvent event) async* {
    yield state.copyWith(isLoading: false);

    final dataState =
        await _yearlyMarksTeacherUseCase.call(params: event.record);

    if (dataState is DataSuccess) {
      yield state.copyWith(yearlyMarks: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MagazineTeacherState> _onSelectRatingMarks(
      SelectRatingEvent event) async* {
    yield state.copyWith(isLoading: false);

    final dataState =
        await _selectRatingTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isSelectRating: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MagazineTeacherState> _onSelectRatingQuarterlyMarks(
      SelectRatingQuarterlyEvent event) async* {
    yield state.copyWith(isLoading: false);

    final dataState =
        await _selectRatingQuarterlyTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isSelectRatingQuarterly: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MagazineTeacherState> _onSelectRatingYearlyMarks(
      SelectRatingYearlyEvent event) async* {
    yield state.copyWith(isLoading: false);

    final dataState =
    await _selectRatingYearlyTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(isSelectRatingYearly: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MagazineTeacherState> _onPlans(PlansEvent event) async* {
    yield state.copyWith(isLoading: false);

    final dataState = await _plansTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(plans: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MagazineTeacherState> _onImport(ImportEvent event) async* {
    yield state.copyWith(isLoading: false);

    final dataState = await _importTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          importTeacherModel: dataState.data, isImported: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MagazineTeacherState> _onReadColumns(ReadColumnsEvent event) async* {
    yield state.copyWith(isLoading: false);

    final dataState = await _readColumnsTeacherUseCase.call(params: event.file);

    if (dataState is DataSuccess) {
      yield state.copyWith(readColumns: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MagazineTeacherState> _onUpdatePlan(UpdatePlanEvent event) async* {
    yield state.copyWith(isLoading: false);

    final dataState = await _updatePlanTeacherUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(updatePlan: dataState.data, isUpdatePlan: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<MagazineTeacherState> _onDeletePlan(DeletePlanEvent event) async* {
    yield state.copyWith(isLoading: false);

    final dataState = await _deletePlanTeacherUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(isDeletePlan: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
