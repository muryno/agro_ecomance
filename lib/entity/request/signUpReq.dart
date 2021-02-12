
class signUpReq {
    String email;
    String password;
    String phone;
    String referral_code;
    String username;

    signUpReq({this.email, this.password, this.phone, this.referral_code, this.username});

    factory signUpReq.fromJson(Map<String, dynamic> json) {
        return signUpReq(
            email: json['email'], 
            password: json['password'], 
            phone: json['phone'], 
            referral_code: json['referral_code'], 
            username: json['username'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['password'] = this.password;
        data['phone'] = this.phone;
        data['referral_code'] = this.referral_code;
        data['username'] = this.username;
        return data;
    }
}