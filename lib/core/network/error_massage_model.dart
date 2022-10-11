import 'package:equatable/equatable.dart';

class ErrorMassageModel extends Equatable {
  final bool success ;
  final int statusCode ;
  final String statusMessage ;

 const ErrorMassageModel({
   required this.success,
   required this.statusCode,
   required this.statusMessage});
 factory ErrorMassageModel.fromJson(Map<String, dynamic>json)
 {
   return ErrorMassageModel(
       success: json['success'],
       statusCode: json['status_code'],
       statusMessage: json['status_message']
   );
 }

  @override
  // TODO: implement props
  List<Object?> get props => [
    success,
    statusCode,
    statusMessage
  ];

}