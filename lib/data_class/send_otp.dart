class SendOtp {
  /*  Error Response
  * "statusCode": 400,
    "message": "Wrong phone number pass",
    "error": "Bad Request"
  *
  * Success Response
  * {
      "data": {
          "phoneNumber": "+919599540935",
          "status": "pending"
      }
    }
  * */

  Data? data;

  String? statusCode;
  String? message;
  String? error;

  SendOtp({this.data});

  SendOtp.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    statusCode = json['statusCode'];
    message = json['message'];
    error = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
      data['statusCode'] = statusCode;
      data['message'] = message;
      data['message'] = message;
    }
    return data;
  }
}

class Data {
  String? phoneNumber;
  String? status;

  Data({this.phoneNumber, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    data['status'] = status;
    return data;
  }
}
