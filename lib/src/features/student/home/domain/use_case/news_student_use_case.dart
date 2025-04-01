import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/bodies/paging_body.dart';
import 'package:school/src/features/student/home/data/models/news_student_model.dart';
import 'package:school/src/features/student/home/domain/repository/home_student_repository.dart';

class NewsStudentUseCase
    implements UseCase<DataState<NewsStudentModel>, PagingBody> {
  final HomeStudentRepository _repository;

  NewsStudentUseCase(this._repository);

  @override
  Future<DataState<NewsStudentModel>> call(
          {required PagingBody params}) async =>
      await _repository.news(params);
}
