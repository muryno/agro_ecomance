
class EwalletResp {
    EwalletData data;

    EwalletResp({this.data});

    factory EwalletResp.fromJson(Map<String, dynamic> json) {
        return EwalletResp(
            data: json['data'] != null ? EwalletData.fromJson(json['data']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        return data;
    }
}


class EwalletData {
    var ledger_balance;
    var main_balance;
    var uuid;
    var withdrawable_balance;

    EwalletData({this.ledger_balance, this.main_balance, this.uuid, this.withdrawable_balance});

    factory EwalletData.fromJson(Map<String, dynamic> json) {
        return EwalletData(
            ledger_balance: json['ledger_balance'],
            main_balance: json['main_balance'],
            uuid: json['uuid'],
            withdrawable_balance: json['withdrawable_balance'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['ledger_balance'] = this.ledger_balance;
        data['main_balance'] = this.main_balance;
        data['uuid'] = this.uuid;
        data['withdrawable_balance'] = this.withdrawable_balance;
        return data;
    }
}