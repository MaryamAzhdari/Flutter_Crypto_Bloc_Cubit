import 'package:dartz/dartz.dart';
import '../failures/failures.dart';

abstract class CryptoRepo {
  //Repository gets data from Datasource
  Future<Either<Failure, Map<String, dynamic>>> getCryptoFromDatasource();
}