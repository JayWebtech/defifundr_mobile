import 'package:dartz/dartz.dart';
import 'package:defiraiser_mobile/core/network/api_error.dart';
import 'package:defiraiser_mobile/features/authentication/domain/entities/base_entity/base_entity.dart';
import 'package:defiraiser_mobile/features/authentication/domain/entities/login_entity/login_response_entity.dart';
import 'package:defiraiser_mobile/features/authentication/domain/entities/register_entity/create_account_response.dart';

abstract class AuthenticationRepository {
  Future<Either<ApiError, CreateAccountResponse>> createAccount(
      {required String username,
      required String email,
      required String password});

  Future<Either<ApiError, LoginResponse>> login(
      {required String username, required String password});

  Future<Either<ApiError, BaseEntity>> verifyOtp(
      {required String username, required String otpCode});
  Future<Either<ApiError, BaseEntity>> resendOTP({required String userId});
  Future<Either<ApiError, BaseEntity>> resetPassword(
      {required String username});
  Future<Either<ApiError, BaseEntity>> verifyPasswordResetCode(
      {required String username,
      required String otpCode,
      required String password});
}
