class ErrorResponse {
  String? error;

  ErrorResponse({this.error});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (error != null) {
      data['error'] = error;
    }
    return data;
  }
}

class Error {
  List<String>? errors;

  Error({this.errors});

  Error.fromJson(Map<String, dynamic> json) {
    errors = json['errors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['errors'] = errors;
    return data;
  }
}