
class BankDetailResponds {
    BankData data;
    String message;
    int status_code;

    BankDetailResponds({this.data, this.message, this.status_code});

    factory BankDetailResponds.fromJson(Map<String, dynamic> json) {
        return BankDetailResponds(
            data: json['data'] != null ? BankData.fromJson(json['data']) : null,
            message: json['message'], 
            status_code: json['status_code'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status_code'] = this.status_code;
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        return data;
    }
}

class BankData {
    String account_name;
    String account_number;
    String bank_name;
    String created_at;
    String updated_at;
    String uuid;



    BankData({this.account_name, this.account_number, this.bank_name, this.created_at, this.updated_at, this.uuid});

    factory BankData.fromJson(Map<String, dynamic> json) {
        return BankData(
            account_name: json['account_name'],
            account_number: json['account_number'],
            bank_name: json['bank_name'],
            created_at: json['created_at'],
            updated_at: json['updated_at'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['account_name'] = this.account_name;
        data['account_number'] = this.account_number;
        data['bank_name'] = this.bank_name;
        data['created_at'] = this.created_at;
        data['updated_at'] = this.updated_at;
        data['uuid'] = this.uuid;
        return data;
    }
}