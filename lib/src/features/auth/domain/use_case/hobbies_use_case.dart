import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/auth/data/models/hobby_model.dart';
import 'package:school/src/features/auth/domain/repository/auth_repository.dart';

class HobbiesUseCase implements UseCase<DataState<List<HobbyModel>>, int> {
  final AuthRepository _repository;

  HobbiesUseCase(this._repository);

  @override
  Future<DataState<List<HobbyModel>>> call({required int params}) async =>
      await _repository.hobbies();
}
