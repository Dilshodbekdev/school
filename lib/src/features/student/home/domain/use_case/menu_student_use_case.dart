import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/student/home/data/models/menu_model.dart';
import 'package:school/src/features/student/home/domain/repository/home_student_repository.dart';

class MenuStudentUseCase implements UseCase<DataState<List<MenuModel>>, int> {
  final HomeStudentRepository _repository;

  MenuStudentUseCase(this._repository);

  @override
  Future<DataState<List<MenuModel>>> call({required int params}) async =>
      await _repository.menu();
}
