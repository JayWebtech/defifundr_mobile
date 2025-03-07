import 'package:defifundr_mobile/core/cache/app_cache_key.dart';
import 'package:defifundr_mobile/core/global/error/exceptions.dart';
import 'package:defifundr_mobile/features/authentication/domain/entities/login_entity/login_response_entity.dart';
import 'package:get_storage/get_storage.dart';

abstract class AppCache {
  saveUser(UserResponse userDetails);
  UserResponse getUserDetails();
  saveUserToken(String token);
  String getToken();
}

class AppCacheImpl implements AppCache {
  final box = GetStorage();
  @override
  String getToken() {
    try {
      final token = box.read(AppCacheKey.token);
      if (token != null) {
        return token;
      } else {
        final token = box.read(AppCacheKey.token) ?? '';
        return token;
      }
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  UserResponse getUserDetails() {
    try {
      final userDetails = box.read(AppCacheKey.userDetails);
      print('Details $userDetails');
      if (userDetails != null) {
        return UserResponse.fromJson(userDetails);
      } else {
        return UserResponse();
      }
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  saveUser(UserResponse userDetails) async {
    try {
      await box.write(AppCacheKey.userDetails, userDetails.toJson());
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  saveUserToken(String token) async {
    try {
      await box.write(AppCacheKey.token, token);
    } on CacheException {
      throw CacheException();
    }
  }

 
}
