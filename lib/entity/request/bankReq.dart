
class bankReq {
    String account_name;
    String account_number;
    String bank_name;
    String sort_code;
    int amount;


    bankReq({this.account_name, this.account_number, this.bank_name, this.sort_code,this.amount});

    factory bankReq.fromJson(Map<String, dynamic> json) {
        return bankReq(
            account_name: json['account_name'], 
            account_number: json['account_number'], 
            bank_name: json['bank_name'], 
            sort_code: json['sort_code'],
            amount: json['amount'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['account_name'] = this.account_name;
        data['account_number'] = this.account_number;
        data['bank_name'] = this.bank_name;
        data['sort_code'] = this.sort_code;
        data['amount'] = this.amount;
        return data;
    }
}