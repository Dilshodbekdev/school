import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/auth/data/bodies/change_hobby_body.dart';
import 'package:school/src/features/auth/domain/repository/auth_repository.dart';

class ChangeHobbyUseCase
    implements UseCase<DataState<dynamic>, ChangeHobbyBody> {
  final AuthRepository _repository;

  ChangeHobbyUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required ChangeHobbyBody params}) async =>
      await _repository.changeHobby(params);
}
