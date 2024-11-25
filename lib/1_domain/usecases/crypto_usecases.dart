
import 'package:crypto_bloc_cubit/1_domain/failures/failures.dart';
import 'package:crypto_bloc_cubit/1_domain/repositories/crypto_repo.dart';
import 'package:dartz/dartz.dart';


class CryptoUsecases {
  CryptoUsecases({required this.cryptoRepo});
  //Usecase gets data from Repository
  final CryptoRepo cryptoRepo;

  Future<Either<Failure, Map<String, dynamic>>> getCrypto() async {
    return cryptoRepo.getCryptoFromDatasource();
    // space for business logic
  }
}
