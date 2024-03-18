import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../shared/shared.dart';
import '../../../data.dart';

class DioExceptionMapper extends ExceptionMapper<NetworkingException> {
  DioExceptionMapper();

  @override
  NetworkingException map(Object? exception) {
    if (exception is NetworkingException) {
      return exception;
    }
    if (exception is Exception) {
      try {
        if (exception is DioException) {
          switch (exception.type) {
            case DioExceptionType.cancel:
              return NetworkingException(
                  networkExceptions: const NetworkExceptions.requestCancelled());

            case DioExceptionType.connectionTimeout:
              return NetworkingException(
                  networkExceptions: const NetworkExceptions.requestTimeout());

            case DioExceptionType.receiveTimeout:
              return NetworkingException(networkExceptions: const NetworkExceptions.sendTimeout());

            case DioExceptionType.sendTimeout:
              return NetworkingException(networkExceptions: const NetworkExceptions.sendTimeout());

            case DioExceptionType.badResponse:
              return NetworkingException(networkExceptions: handleBadResponse(exception.response));

            case DioExceptionType.connectionError:
              return NetworkingException(
                  networkExceptions: const NetworkExceptions.serviceUnavailable());

            case DioExceptionType.unknown:
              if (exception.error is SocketException) {
                return NetworkingException(
                    networkExceptions: const NetworkExceptions.noInternetConnection());
              }

              if (exception.error is NetworkingException) {
                return exception.error as NetworkingException;
              }

            default:
              return NetworkingException(
                  networkExceptions: const NetworkExceptions.unexpectedError());
          }
        }
      } on FormatException catch (_) {
        return NetworkingException(networkExceptions: const NetworkExceptions.formatExceptions());
      } catch (_) {
        return NetworkingException(networkExceptions: const NetworkExceptions.unexpectedError());
      }
    } else {
      if (exception.toString().contains('is not a subtype of')) {
        return NetworkingException(networkExceptions: const NetworkExceptions.unableToProcess());
      }
    }
    return NetworkingException(networkExceptions: const NetworkExceptions.unexpectedError());
  }

  NetworkExceptions handleBadResponse(Response? response) {
    ResponeException? responeException;

    try {
      responeException = ResponeException.fromJson(response?.data);
    } catch (e) {}

    final int statusCode = response?.statusCode ?? 0;
    switch (statusCode) {
      case 400:
        return NetworkExceptions.badRequest(responeException?.message ?? 'Not found');
      case 401:
        return NetworkExceptions.unauthorizedRequest(responeException?.message ?? 'Not found');
      case 403:
        return NetworkExceptions.unauthorizedRequest(responeException?.message ?? 'Not found');
      case 404:
        return NetworkExceptions.notFound(responeException?.message ?? 'Not found');
      case 409:
        return const NetworkExceptions.conflict();
      case 408:
        return const NetworkExceptions.requestTimeout();
      case 500:
        return const NetworkExceptions.internalServerError();
      case 503:
        return const NetworkExceptions.serviceUnavailable();
      default:
        return NetworkExceptions.defaultError('Received invalid status code: $statusCode');
    }
  }
}
