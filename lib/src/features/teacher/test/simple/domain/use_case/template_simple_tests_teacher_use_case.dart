import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/teacher/test/simple/data/models/active_simple_tests_teacher_model.dart';
import 'package:school/src/features/teacher/test/simple/domain/repository/simple_test_teacher_repository.dart';

class TemplateSimpleTestsTeacherUseCase
    implements UseCase<DataState<ActiveSimpleTestsTeacherModel>, PagingBody> {
  final SimpleTestTeacherRepository _repository;

  TemplateSimpleTestsTeacherUseCase(this._repository);

  @override
  Future<DataState<ActiveSimpleTestsTeacherModel>> call(
          {required PagingBody params}) async =>
      await _repository.templateSimpleTests(params);
}
