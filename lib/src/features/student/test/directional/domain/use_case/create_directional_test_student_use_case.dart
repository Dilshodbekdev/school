import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/test/directional/domain/repository/directional_test_student_repository.dart';
import 'package:school/src/features/student/test/simple/data/bodies/create_simple_test_student_body.dart';
import 'package:school/src/features/student/test/simple/data/models/get_simple_test_student_model.dart';

class CreateDirectionalTestStudentUseCase
    implements
        UseCase<DataState<GetSimpleTestStudentModel>,
            CreateSimpleTestStudentBody> {
  final DirectionalTestStudentRepository _repository;

  CreateDirectionalTestStudentUseCase(this._repository);

  @override
  Future<DataState<GetSimpleTestStudentModel>> call(
          {required CreateSimpleTestStudentBody params}) async =>
      await _repository.createTest(params);
}
