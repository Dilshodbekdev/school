import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/auth/data/models/user_model.dart';
import 'package:school/src/features/auth/domain/repository/auth_repository.dart';

class MeUseCase implements UseCase<DataState<UserModel>, int> {
  final AuthRepository _repository;

  MeUseCase(this._repository);

  @override
  Future<DataState<UserModel>> call({required int params}) async =>
      await _repository.me();
}
