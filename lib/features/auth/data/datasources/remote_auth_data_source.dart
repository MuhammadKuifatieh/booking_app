import 'package:booking_app/core/config/typedef.dart';
import 'package:booking_app/core/unified_api/api_variables.dart';
import 'package:booking_app/core/unified_api/post_api.dart';
import 'package:booking_app/features/auth/data/models/auth_response.dart';

class RemoteAuthDataSource {
  Future<AuthResponse> login(BodyMap body) async {
    PostApi postApi = PostApi(
      uri: ApiVariables.login(),
      body: body,
      fromJson: authResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }

  Future<AuthResponse> register(BodyMap body) async {
    PostApi postApi = PostApi(
      uri: ApiVariables.register(),
      body: body,
      fromJson: authResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }
}
