import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/teacher/test/simple/data/bodies/get_students_simple_test_body.dart';
import 'package:school/src/features/teacher/test/simple/data/models/get_students_simple_test_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/domain/repository/simple_test_teacher_repository.dart';

class GetStudentsSimpleTestTeacherUseCase
    implements
        UseCase<DataState<List<GetStudentsSimpleTestTeacherModel>>,
            GetStudentsSimpleTestBody> {
  final SimpleTestTeacherRepository _repository;

  GetStudentsSimpleTestTeacherUseCase(this._repository);

  @override
  Future<DataState<List<GetStudentsSimpleTestTeacherModel>>> call(
          {required GetStudentsSimpleTestBody params}) async =>
      await _repository.getStudentsSimpleTest(params);
}
