import 'package:crypto_bloc_cubit/0_data/datasources/crypto_remote_datasource.dart';
import 'package:crypto_bloc_cubit/0_data/exceptions/exceptions.dart';
import 'package:crypto_bloc_cubit/1_domain/failures/failures.dart';
import 'package:crypto_bloc_cubit/1_domain/repositories/crypto_repo.dart';
import 'package:dartz/dartz.dart';


class CryptoRepoImpl implements CryptoRepo {
  CryptoRepoImpl({required this.cryptoRemoteDatasource});
  final CryptoRemoteDatasource cryptoRemoteDatasource;
  
  @override
  Future<Either<Failure, Map<String, dynamic>>> getCryptoFromDatasource() async {
    try {
      final result = await cryptoRemoteDatasource.getRandomAdviceFromApi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
  
}