class VerifyOtpResponse {
  Data? data;

  VerifyOtpResponse({this.data});

  VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? phoneNumber;
  String? status;
  bool? valid;

  Data({this.phoneNumber, this.status, this.valid});

  Data.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    status = json['status'];
    valid = json['valid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    data['status'] = status;
    data['valid'] = valid;
    return data;
  }
}
