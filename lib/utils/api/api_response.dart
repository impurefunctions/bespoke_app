class ApiResponse<T> {
  Status? status;

  T? data;

  String? message;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.created(this.data) : status = Status.CREATED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.validation(this.data) : status = Status.VALID;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR, VALID, CREATED }
