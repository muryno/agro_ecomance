

class SignUpRes {
    SignUpRespData data;
    String message;
    int otp;
    String otp_secret;
    int status_code;

    SignUpRes({this.data, this.message, this.otp, this.otp_secret, this.status_code});

    factory SignUpRes.fromJson(Map<String, dynamic> json) {
        return SignUpRes(
            data: json['data'] != null ? SignUpRespData.fromJson(json['data']) : null,
            message: json['message'], 
            otp: json['otp'], 
            otp_secret: json['otp_secret'], 
            status_code: json['status_code'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['otp'] = this.otp;
        data['otp_secret'] = this.otp_secret;
        data['status_code'] = this.status_code;
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        return data;
    }
}




class SignUpRespData {
    String avatar_url;
    String blocked;
    String cid;
    String created_at;
    String date_of_birth;
    String display_name;
    String email;
    String first_name;
    String ip;
    String last_login;
    String last_name;
    String phone;
    String username;
    String uuid;

    SignUpRespData({this.avatar_url, this.blocked, this.cid, this.created_at, this.date_of_birth, this.display_name, this.email, this.first_name, this.ip, this.last_login, this.last_name, this.phone, this.username, this.uuid});

    factory SignUpRespData.fromJson(Map<String, dynamic> json) {
        return SignUpRespData(
            avatar_url: json['avatar_url'],
            blocked: json['blocked'],
            cid: json['cid'],
            created_at: json['created_at'],
            date_of_birth: json['date_of_birth'],
            display_name: json['display_name'],
            email: json['email'],
            first_name: json['first_name'],
            ip: json['ip'],
            last_login: json['last_login'],
            last_name: json['last_name'],
            phone: json['phone'],
            username: json['username'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['avatar_url'] = this.avatar_url;
        data['blocked'] = this.blocked;
        data['cid'] = this.cid;
        data['created_at'] = this.created_at;
        data['date_of_birth'] = this.date_of_birth;
        data['display_name'] = this.display_name;
        data['email'] = this.email;
        data['first_name'] = this.first_name;
        data['ip'] = this.ip;
        data['last_login'] = this.last_login;
        data['last_name'] = this.last_name;
        data['phone'] = this.phone;
        data['username'] = this.username;
        data['uuid'] = this.uuid;
        return data;
    }
}