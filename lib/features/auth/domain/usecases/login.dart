import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/auth_response.dart';
import '../repositories/auth_repository.dart';

class Login implements UseCase<AuthResponse, LoginParams> {
  final AuthRepository authRepository;

  Login(this.authRepository);
  @override
  DataResponse<AuthResponse> call(LoginParams params) async {
    return authRepository.login(params.getBody());
  }
}

class LoginParams with Params {
  final String username;
  final String password;

  LoginParams({
    required this.username,
    required this.password,
  });
  @override
  BodyMap getBody() {
    return {
      "username": username,
      "password": password,
    };
  }
}
