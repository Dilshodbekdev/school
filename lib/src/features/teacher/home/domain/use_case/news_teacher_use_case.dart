import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/home/data/models/news_student_model.dart';
import 'package:school/src/features/teacher/home/domain/repository/home_teacher_repository.dart';

class NewsTeacherUseCase
    implements UseCase<DataState<NewsStudentModel>, PagingBody> {
  final HomeTeacherRepository _repository;

  NewsTeacherUseCase(this._repository);

  @override
  Future<DataState<NewsStudentModel>> call(
          {required PagingBody params}) async =>
      await _repository.news(params);
}
