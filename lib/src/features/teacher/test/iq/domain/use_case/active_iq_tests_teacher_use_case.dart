import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/teacher/test/iq/data/models/active_iq_tests_teacher_model.dart';
import 'package:school/src/features/teacher/test/iq/domain/repository/iq_test_teacher_repository.dart';

class ActiveIqTestsTeacherUseCase
    implements UseCase<DataState<ActiveIqTestsTeacherModel>, PagingBody> {
  final IqTestTeacherRepository _repository;

  ActiveIqTestsTeacherUseCase(this._repository);

  @override
  Future<DataState<ActiveIqTestsTeacherModel>> call(
          {required PagingBody params}) async =>
      await _repository.activeTests(params);
}
