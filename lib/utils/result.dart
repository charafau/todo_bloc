import 'package:built_value/built_value.dart';
import 'package:todo_bloc/utils/status.dart';

class Result<T> {
  Status status;
  @nullable
  String message;
  @nullable
  T data;

  Result(this.status, this.message, this.data);

  factory Result.loading({@nullable T data}) =>
      new Result<T>(Status.LOADING, "", data);

  factory Result.success(@nullable T data) =>
      new Result<T>(Status.SUCCESS, "", data);

  factory Result.error(String msg, {@nullable T data}) =>
      new Result<T>(Status.ERROR, msg, data);

  @override
  String toString() {
    return 'Result{status: $status, message: $message, data: $data}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Result &&
              runtimeType == other.runtimeType &&
              status == other.status &&
              message == other.message &&
              data == other.data;

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}
