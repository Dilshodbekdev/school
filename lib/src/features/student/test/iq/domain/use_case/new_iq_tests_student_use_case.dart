import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/test/iq/data/models/new_iq_tests_student_model.dart';
import 'package:school/src/features/student/test/iq/domain/repository/iq_test_student_repository.dart';

class NewIqTestsStudentUseCase
    implements UseCase<DataState<NewIqTestsStudentModel>, PagingBody> {
  final IqTestStudentRepository _repository;

  NewIqTestsStudentUseCase(this._repository);

  @override
  Future<DataState<NewIqTestsStudentModel>> call(
          {required PagingBody params}) async =>
      await _repository.newTests(params);
}
