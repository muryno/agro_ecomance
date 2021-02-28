
class OtpError {
    otpErrors errors;
    String message;
    int status_code;

    OtpError({this.errors, this.message, this.status_code});

    factory OtpError.fromJson(Map<String, dynamic> json) {
        return OtpError(
            errors: json['errors'] != null ? otpErrors.fromJson(json['errors']) : null,
            message: json['message'], 
            status_code: json['status_code'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status_code'] = this.status_code;
        if (this.errors != null) {
            data['errors'] = this.errors.toJson();
        }
        return data;
    }
}


class otpErrors {
    List<String> otp;

    otpErrors({this.otp});

    factory otpErrors.fromJson(Map<String, dynamic> json) {
        return otpErrors(
            otp: json['otp'] != null ? new List<String>.from(json['otp']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.otp != null) {
            data['otp'] = this.otp;
        }
        return data;
    }
}