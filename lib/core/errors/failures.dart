import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: "Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: "Send timeout with ApiServer");

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: "Receive timeout with ApiServer");

      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: "Invalid certificate with ApiServer");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: "Request to APIServer is canceled");

      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: "Connection error with ApiServer");

      case DioExceptionType.unknown:
        return ServerFailure(
            errMessage: "Unknown error occurred with ApiServer");
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'Your request not found, please try again!');
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: 'Internal server error, please try again');
    } else {
      return ServerFailure(
          errMessage: 'Opps, There was an error, please try again');
    }
  }
}
