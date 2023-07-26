import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/auth_response.dart';
import '../repositories/auth_repository.dart';

class Register implements UseCase<AuthResponse, RegisterParams> {
  final AuthRepository authRepository;

  Register(this.authRepository);
  @override
  DataResponse<AuthResponse> call(RegisterParams params) async {
    return authRepository.register(params.getBody());
  }
}

class RegisterParams with Params {
  final String username;
  final String name;
  final String password;
  final String confirmPassword;

  RegisterParams({
    required this.username,
    required this.name,
    required this.password,
    required this.confirmPassword,
  });
  @override
  BodyMap getBody() {
    return {
      "username": username,
      'name': name,
      "password": password,
      "password_confirmation": confirmPassword,
    };
  }
}
