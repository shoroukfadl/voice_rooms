import 'package:roomly/core/error/failures.dart';
import 'package:roomly/core/network/custom_either.dart';

abstract class LinkRep {
  Future<Either<AppException, void>> link();
}
