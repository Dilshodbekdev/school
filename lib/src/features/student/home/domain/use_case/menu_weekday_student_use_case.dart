import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/bodies/menu_weekday_body.dart';
import 'package:school/src/features/student/home/data/models/menu_model.dart';
import 'package:school/src/features/student/home/domain/repository/home_student_repository.dart';

class MenuWeekdayStudentUseCase
    implements UseCase<DataState<MenuModel>, MenuWeekdayBody> {
  final HomeStudentRepository _repository;

  MenuWeekdayStudentUseCase(this._repository);

  @override
  Future<DataState<MenuModel>> call({required MenuWeekdayBody params}) async =>
      await _repository.menuByWeekday(params);
}
