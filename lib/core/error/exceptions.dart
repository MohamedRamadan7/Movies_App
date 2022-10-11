 import 'package:movies_app/core/network/error_massage_model.dart';

class ServerException implements Exception{
 final ErrorMassageModel errorMassageModel ;
 const ServerException({required this.errorMassageModel});
 }

 class LocalDatabaseException implements Exception{
  final String massage ;
  const LocalDatabaseException({required this.massage});
 }