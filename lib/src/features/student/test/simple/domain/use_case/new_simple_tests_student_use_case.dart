import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/test/simple/data/models/new_simple_tests_student_model.dart';
import 'package:school/src/features/student/test/simple/domain/repository/simple_test_student_repository.dart';

class NewSimpleTestsStudentUseCase
    implements UseCase<DataState<NewSimpleTestsStudentModel>, PagingBody> {
  final SimpleTestStudentRepository _repository;

  NewSimpleTestsStudentUseCase(this._repository);

  @override
  Future<DataState<NewSimpleTestsStudentModel>> call(
          {required PagingBody params}) async =>
      await _repository.newTests(params);
}
