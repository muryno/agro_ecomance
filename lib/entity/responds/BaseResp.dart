
class BaseResp {
    String message;
    int status_code;

    BaseResp({this.message, this.status_code});

    factory BaseResp.fromJson(Map<String, dynamic> json) {
        return BaseResp(
            message: json['message'], 
            status_code: json['status_code'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status_code'] = this.status_code;
        return data;
    }
}