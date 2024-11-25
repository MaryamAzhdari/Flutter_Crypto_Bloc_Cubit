part of 'crypto_cubit.dart';

sealed class CryptoCubitState extends Equatable {
  const CryptoCubitState();

  @override
  List<Object> get props => [];
}

class CryptoInitial extends CryptoCubitState {
  const CryptoInitial();
}


class CryptoStateLoading extends CryptoCubitState {
  const CryptoStateLoading();
}

class CryptoStateLoaded extends CryptoCubitState {
  final Map<String, dynamic> data;
  const CryptoStateLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class CryptoStateError extends CryptoCubitState {
  final String message;
  const CryptoStateError({required this.message});
  @override
  List<Object> get props => [message];
}