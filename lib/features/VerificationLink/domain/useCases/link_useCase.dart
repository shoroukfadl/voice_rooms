import 'package:roomly/core/error/failures.dart';
import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/features/VerificationLink/domain/repository/link_repo.dart';

class LinkUseCase {
  final LinkRep repo;
  LinkUseCase(this.repo);
  Future<Either<AppException, void>> call() async => await repo.link();
}
