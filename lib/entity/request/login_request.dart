
class login_request {
    String client;
    String email_or_phone;
    String password;

    login_request({this.client, this.email_or_phone, this.password});

    factory login_request.fromJson(Map<String, dynamic> json) {
        return login_request(
            client: json['client'], 
            email_or_phone: json['email_or_phone'], 
            password: json['password'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['client'] = this.client;
        data['email_or_phone'] = this.email_or_phone;
        data['password'] = this.password;
        return data;
    }
}