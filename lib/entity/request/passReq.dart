
class passReq {
    String current_password;
    String new_password;
    String new_password_confirmation;

    String message;
    int status_code;

    passReq({this.current_password, this.new_password, this.new_password_confirmation, this.message, this.status_code});

    factory passReq.fromJson(Map<String, dynamic> json) {
        return passReq(
            current_password: json['current_password'], 
            new_password: json['new_password'], 
            new_password_confirmation: json['new_password_confirmation'],

            message: json['message'],
            status_code: json['status_code'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['current_password'] = this.current_password;
        data['new_password'] = this.new_password;
        data['new_password_confirmation'] = this.new_password_confirmation;

        data['message'] = this.message;
        data['status_code'] = this.status_code;
        return data;
    }
}