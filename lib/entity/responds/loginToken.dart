

class loginToken {
    DataToken data;

    String message;


    loginToken({this.data,this.message});

    factory loginToken.fromJson(Map<String, dynamic> json) {
        return loginToken(
            message: json['message'],
        data: json['data'] != null ? DataToken.fromJson(json['data']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        data['message'] = this.message;
        return data;
    }
}


class DataToken {
    String access_token;
    String client;
    int expires_in;
    String token_type;

    DataToken({this.access_token, this.client, this.expires_in, this.token_type});

    factory DataToken.fromJson(Map<String, dynamic> json) {
        return DataToken(
            access_token: json['access_token'],
            client: json['client'],
            expires_in: json['expires_in'],
            token_type: json['token_type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['access_token'] = this.access_token;
        data['client'] = this.client;
        data['expires_in'] = this.expires_in;
        data['token_type'] = this.token_type;
        return data;
    }
}