import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/simple/data/models/class_select_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/domain/repository/simple_test_teacher_repository.dart';

class ClassesSelectIqTestTeacherUseCase
    implements UseCase<DataState<List<ClassSelectTeacherModel>>, int> {
  final SimpleTestTeacherRepository _repository;

  ClassesSelectIqTestTeacherUseCase(this._repository);

  @override
  Future<DataState<List<ClassSelectTeacherModel>>> call(
          {required int params}) async =>
      await _repository.classesSelect();
}
