
class BankRes {
    BankResX bankRes;

    BankRes({this.bankRes});

    factory BankRes.fromJson(Map<String, dynamic> json) {
        return BankRes(
            bankRes: json['data'] != null ? BankResX.fromJson(json['data']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.bankRes != null) {
            data['data'] = this.bankRes.toJson();
        }
        return data;
    }
}

class BankResX {
    String account_name;
    String account_number;
    String bank_name;
    String created_at;
    String updated_at;
    String uuid;

    BankResX({this.account_name, this.account_number, this.bank_name, this.created_at, this.updated_at, this.uuid});

    factory BankResX.fromJson(Map<String, dynamic> json) {
        return BankResX(
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