import 'dart:io';

import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/magazine/data/models/read_column_teacher_model.dart';
import 'package:school/src/features/teacher/magazine/domain/repository/magazine_teacher_repository.dart';

class ReadColumnsTeacherUseCase
    implements UseCase<DataState<List<ReadColumnTeacherModel>>, File> {
  final MagazineTeacherRepository _repository;

  ReadColumnsTeacherUseCase(this._repository);

  @override
  Future<DataState<List<ReadColumnTeacherModel>>> call(
          {required File params}) async =>
      await _repository.readColumns(params);
}
