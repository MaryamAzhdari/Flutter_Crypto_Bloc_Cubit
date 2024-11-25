import 'dart:convert';
import 'package:crypto_bloc_cubit/0_data/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;


abstract class CryptoRemoteDatasource {
  Future<Map<String, dynamic>> getRandomAdviceFromApi();
}

class CryptoRemoteDatasourceImpl implements CryptoRemoteDatasource {
  final http.Client client;
  CryptoRemoteDatasourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> getRandomAdviceFromApi() async {
    final response = await client.get(
      Uri.parse(
          'https://min-api.cryptocompare.com/data/top/mktcapfull?limit=10&tsym=USD'),
      headers: {
        "Content-Type": 'application/json; charset=UTF-8',
        'authorization':
            'Apikey {01644ea6e1e3fe654d8a296fa1d51f007d597c782b413d85717fdeeea3ef75e1}'
      },
    );
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      //return CryptoModel.fromJson(responseBody);
      return responseBody;
    }
  }
}
