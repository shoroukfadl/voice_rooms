import 'dart:convert';

import 'package:roomly/core/either.dart';
import 'package:roomly/core/error/failures.dart';
import 'package:roomly/core/localStorage/boxes.dart';
import 'package:roomly/core/localStorage/hive_helper.dart';
import 'package:roomly/core/localStorage/hive_manager.dart';
import 'package:roomly/features/login/data/datasources/local/login_local_data_source.dart';
import 'package:roomly/features/register/data/model/user_model.dart';
import 'package:roomly/utilities/git_it.dart';

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  static const String _userKey = 'cached_user';
  static const String _tokenKey = 'auth_token';

  LoginLocalDataSourceImpl();

  @override
  Future<Either<AppException, void>> cacheUser(UserModel user) async {
    final hive = HiveHelper<String>(
        hiveManager: sl<HiveManager>(), boxName: HiveBox.user);
    try {
      final userJson = user.toJson();
      await hive.put(key: _userKey, value: jsonEncode(userJson));
      return Either.right(null);
    } catch (e) {
      return Either.left(HiveExceptionHelper.handle(e));
    }
  }

  @override
  Future<Either<AppException, UserModel?>> getCachedUser() async {
    final hive = HiveHelper<String>(
        hiveManager: sl<HiveManager>(), boxName: HiveBox.user);
    try {
      final userString = await hive.get(_userKey);
      if (userString == null) return Either.right(null);
      final userJson = jsonDecode(userString);
      return Either.right(UserModel.fromJson(userJson));
    } catch (e) {
      return Either.left(HiveExceptionHelper.handle(e));
    }
  }

  @override
  Future<Either<AppException, void>> clearCachedUser() async {
    final hive = HiveHelper<String>(
        hiveManager: sl<HiveManager>(), boxName: HiveBox.user);
    try {
      await hive.delete(_userKey);
      return Either.right(null);
    } catch (e) {
      return Either.left(HiveExceptionHelper.handle(e));
    }
  }

  @override
  Future<Either<AppException, void>> saveAuthToken(String token) async {
    final hive = HiveHelper<String>(
        hiveManager: sl<HiveManager>(), boxName: HiveBox.user);
    try {
      await hive.put(key: _tokenKey, value: token);
      return Either.right(null);
    } catch (e) {
      return Either.left(HiveExceptionHelper.handle(e));
    }
  }

  @override
  Future<Either<AppException, String?>> getAuthToken() async {
    final hive = HiveHelper<String>(
        hiveManager: sl<HiveManager>(), boxName: HiveBox.user);
    try {
      final token = await hive.get(_tokenKey);
      return Either.right(token);
    } catch (e) {
      return Either.left(HiveExceptionHelper.handle(e));
    }
  }

  @override
  Future<Either<AppException, void>> clearAuthToken() async {
    final hive = HiveHelper<String>(
        hiveManager: sl<HiveManager>(), boxName: HiveBox.user);
    try {
      await hive.delete(_tokenKey);
      return Either.right(null);
    } catch (e) {
      return Either.left(HiveExceptionHelper.handle(e));
    }
  }
}
