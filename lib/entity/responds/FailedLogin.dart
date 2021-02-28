
import 'package:agro_ecomance/entity/responds/SignUpRes.dart';

class FailedLogin {
    SignUpRes data;
    String error;
    String  message;
    String type;

    FailedLogin({this.data, this.error, this.type,this.message});

    factory FailedLogin.fromJson(Map<String, dynamic> json) {
        return FailedLogin(
            data: json['data'] != null ? SignUpRes.fromJson(json['data']) : null,
            error: json['error'], 
            type: json['type'],
            message: json['message'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['error'] = this.error;
        data['type'] = this.type;
        data['message'] = this.message;
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        return data;
    }
}

