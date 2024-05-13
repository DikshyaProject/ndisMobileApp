
import 'package:equatable/equatable.dart';

import '../Helpers/utils/utils.dart';

class NetworkApiCallState<T> extends Equatable {
  final NetworkRequestStatus? status;
  final T? data;
  final String? message;
  final NetworkErrorType? errorType;

  NetworkApiCallState.loading(this.message)
      : status = NetworkRequestStatus.LOADING,
        data = null,
        errorType = null;

  NetworkApiCallState.completed(this.data, this.message)
      : status = NetworkRequestStatus.COMPLETED,
        errorType = null;

  NetworkApiCallState.error(this.message, this.errorType)
      : status = NetworkRequestStatus.ERROR,
        data = null;

  NetworkApiCallState.pending(this.message, this.errorType)
      : status = NetworkRequestStatus.PENDING,
        data = null;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data \n errorType = $errorType";
  }

  @override
  List<Object> get props => [status!, data!, message!, errorType!];
}
