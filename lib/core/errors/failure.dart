import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            message: 'Connection timeout. Please try again later.');
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            message: 'Request send timeout. Please try again later.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            message: 'Response receive timeout. Please try again later.');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            message:
                'Invalid certificate. Please check your security settings.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!);
      case DioExceptionType.cancel:
        return ServerFailure(
            message: 'Request was cancelled. Please try again.');
      case DioExceptionType.connectionError:
        return ServerFailure(
            message:
                'Connection error. Please check your internet connection.');
      case DioExceptionType.unknown:
        return ServerFailure(
            message: 'An unknown error occurred. Please try again.');
      default:
        return ServerFailure(message: 'An unexpected error occurred.');
    }
  }

  factory ServerFailure.fromResponse(Response response) {
    String errorMessage;
    switch (response.statusCode) {
      case 400:
        errorMessage = 'Bad request. Please check your input and try again.';
        break;
      case 401:
        errorMessage = 'Unauthorized. Please check your credentials.';
        break;
      case 403:
        errorMessage =
            'Forbidden. You do not have permission to access this resource.';
        break;
      case 404:
        errorMessage =
            'Not found. The resource you are looking for could not be found.';
        break;
      case 500:
        errorMessage = 'Internal server error. Please try again later.';
        break;
      case 502:
        errorMessage = 'Bad gateway. Please try again later.';
        break;
      case 503:
        errorMessage = 'Service unavailable. Please try again later.';
        break;
      case 504:
        errorMessage = 'Gateway timeout. Please try again later.';
        break;
      default:
        errorMessage =
            'Received an unexpected status code: ${response.statusCode}';
        break;
    }
    return ServerFailure(message: errorMessage);
  }
}
