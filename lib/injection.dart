import 'package:crypto_bloc_cubit/0_data/datasources/crypto_remote_datasource.dart';
import 'package:crypto_bloc_cubit/0_data/repositories/crypto_repo_impl.dart';
import 'package:crypto_bloc_cubit/1_domain/repositories/crypto_repo.dart';
import 'package:crypto_bloc_cubit/1_domain/usecases/crypto_usecases.dart';
import 'package:crypto_bloc_cubit/2_application/core/cubit/crypto_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;



final sl = GetIt.I; // sl == Service Locator

Future<void> init() async {
// ! application Layer
  // Factory = every time a new/fresh instance of that class
  sl.registerFactory(() => CryptoCubit(cryptoUsecases: sl()));

// ! domain Layer
  sl.registerFactory(() => CryptoUsecases(cryptoRepo: sl()));

// ! data Layer
  sl.registerFactory<CryptoRepo>(
      () => CryptoRepoImpl(cryptoRemoteDatasource: sl()));
  sl.registerFactory<CryptoRemoteDatasource>(
      () => CryptoRemoteDatasourceImpl(client: sl()));

// ! externs
  sl.registerFactory(() => http.Client());
}
