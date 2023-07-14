import 'package:booking_app/core/config/typedef.dart';
import 'package:booking_app/features/auth/data/models/auth_response.dart';

abstract class AuthRepository {
  DataResponse<AuthResponse> login(BodyMap body);

  DataResponse<AuthResponse> register(BodyMap body);
}
