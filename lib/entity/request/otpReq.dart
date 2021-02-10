

class otpReq {
    int otp;
    String otp_secret;

    otpReq({this.otp, this.otp_secret});

    factory otpReq.fromJson(Map<String, dynamic> json) {
        return otpReq(
            otp: json['otp'], 
            otp_secret: json['otp_secret'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['otp'] = this.otp;
        data['otp_secret'] = this.otp_secret;
        return data;
    }
}