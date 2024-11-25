import 'package:bloc/bloc.dart';
import 'package:crypto_bloc_cubit/1_domain/failures/failures.dart';
import 'package:crypto_bloc_cubit/1_domain/usecases/crypto_usecases.dart';
import 'package:equatable/equatable.dart';

part 'crypto_state.dart';

const generalFailureMessage = 'Ups, something gone wrong. Please try again!';
const serverFailureMessage = 'Ups, API Error. please try again!';
const cacheFailureMessage = 'Ups, chache failed. Please try again!';

class CryptoCubit extends Cubit<CryptoCubitState> {
  final CryptoUsecases cryptoUsecases;
  CryptoCubit({required this.cryptoUsecases}) : super(const CryptoInitial());

  void cryptoRequested() async {
    emit(const CryptoStateLoading());
    final failureOrAdvice = await cryptoUsecases.getCrypto();
    failureOrAdvice.fold((failure) => emit(CryptoStateError(message: _mapFailureToMessage(failure))),
    // failureOrAdvice.fold(
    //     (failure) =>
    //         emit(CryptoStateError(message: failure.runtimeType.toString())),
        (crypto) => emit(CryptoStateLoaded(data: crypto)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        {
          print(failure.runtimeType.toString());
          return serverFailureMessage;
          //return failure.runtimeType.toString();
        }

      case CacheFailure _:
        {
          print(failure.runtimeType.toString());
          return cacheFailureMessage;
          //return failure.runtimeType.toString();
        }
      default:
        {
          print(failure.runtimeType.toString());
          return generalFailureMessage;
          //return failure.runtimeType.toString();
        }
    }
  }
}
