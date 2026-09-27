import 'package:roomly/core/error/failures.dart';
import 'package:roomly/core/localStorage/boxes.dart';
import 'package:roomly/core/localStorage/hive_helper.dart';
import 'package:roomly/core/localStorage/hive_manager.dart';
import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/features/register/data/model/user_model.dart';
import 'package:roomly/utilities/git_it.dart';

import '../local/register_local_data_source.dart';

class RegisterLocalDataSourceImpl implements RegisterLocalDataSource {
  RegisterLocalDataSourceImpl();

  @override
  Future<Either<AppException, void>> cacheUser(UserModel user) async {
    final hive = HiveHelper<UserModel>(
        hiveManager: sl<HiveManager>(), boxName: HiveBox.user);
    try {
      await hive.put(key: user.uid, value: user);
      return Either.right(null);
    } catch (e) {
      return Either.left(HiveExceptionHelper.handle(e));
    }
  }
}
