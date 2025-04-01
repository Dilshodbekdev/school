import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/test/simple/data/bodies/answer_body.dart';
import 'package:school/src/features/student/test/simple/data/models/answer_simple_test_student_model.dart';
import 'package:school/src/features/student/test/simple/domain/repository/simple_test_student_repository.dart';

class AnswerSimpleTestStudentUseCase
    implements
        UseCase<DataState<AnswerSimpleTestStudentModel>,
            AnswerBody> {
  final SimpleTestStudentRepository _repository;

  AnswerSimpleTestStudentUseCase(this._repository);

  @override
  Future<DataState<AnswerSimpleTestStudentModel>> call(
          {required AnswerBody params}) async =>
      await _repository.answerTest(params);
}
