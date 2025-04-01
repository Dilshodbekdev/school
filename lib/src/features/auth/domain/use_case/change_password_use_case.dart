import 'package:school/src/core/resources/data_state.dart';
import 'package:school/src/core/usecase/use_case.dart';
import 'package:school/src/features/auth/data/bodies/change_password_body.dart';
import 'package:school/src/features/auth/domain/repository/auth_repository.dart';

class ChangePasswordUseCase
    implements UseCase<DataState<dynamic>, ChangePasswordBody> {
  final AuthRepository _repository;

  ChangePasswordUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required ChangePasswordBody params}) async =>
      await _repository.changePassword(params);
}
