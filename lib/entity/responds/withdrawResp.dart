

class withdrawResp {
    String message;
    int status_code;
    WithdrawData withdrawData;

    withdrawResp({this.message, this.status_code, this.withdrawData});

    factory withdrawResp.fromJson(Map<String, dynamic> json) {
        return withdrawResp(
            message: json['message'], 
            status_code: json['status_code'], 
            withdrawData: json['withdrawData'] != null ? WithdrawData.fromJson(json['withdrawData']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status_code'] = this.status_code;
        if (this.withdrawData != null) {
            data['withdrawData'] = this.withdrawData.toJson();
        }
        return data;
    }
}
class WithdrawData {
    String account_name;
    String account_number;
    String bank_name;
    String created_at;

    WithdrawData({this.account_name, this.account_number, this.bank_name, this.created_at});

    factory WithdrawData.fromJson(Map<String, dynamic> json) {
        return WithdrawData(
            account_name: json['account_name'],
            account_number: json['account_number'],
            bank_name: json['bank_name'],
            created_at: json['created_at'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['account_name'] = this.account_name;
        data['account_number'] = this.account_number;
        data['bank_name'] = this.bank_name;
        data['created_at'] = this.created_at;
        return data;
    }
}