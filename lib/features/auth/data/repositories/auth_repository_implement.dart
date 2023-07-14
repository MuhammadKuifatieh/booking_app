import '../../../../core/config/typedef.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote_auth_data_source.dart';
import '../models/auth_response.dart';

class AuthRepositoryImplement
    with HandlingExceptionManager
    implements AuthRepository {
  final _remoteAuth = RemoteAuthDataSource();
  @override
  DataResponse<AuthResponse> login(BodyMap body) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteAuth.login(body);
      return result;
    });
  }

  @override
  DataResponse<AuthResponse> register(BodyMap body) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteAuth.register(body);
      return result;
    });
  }
}
