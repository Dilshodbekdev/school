import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/test/simple/data/bodies/create_simple_test_student_body.dart';
import 'package:school/src/features/student/test/simple/data/models/get_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/domain/repository/simple_test_student_repository.dart';

class CreateSimpleTestStudentUseCase
    implements
        UseCase<DataState<GetSimpleTestStudentModel>,
            CreateSimpleTestStudentBody> {
  final SimpleTestStudentRepository _repository;

  CreateSimpleTestStudentUseCase(this._repository);

  @override
  Future<DataState<GetSimpleTestStudentModel>> call(
          {required CreateSimpleTestStudentBody params}) async =>
      await _repository.createTest(params);
}
