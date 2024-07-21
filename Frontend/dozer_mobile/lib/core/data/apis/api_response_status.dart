enum Status { loading, completed, error }

class ApiResponse<T> {
  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.error(this.message) : status = Status.error;
  Status? status;
  T? data;
  String? message;

  @override
  String toString() {
    return 'Status : $status \n Message : $message \n Data : $data';
  }
}
