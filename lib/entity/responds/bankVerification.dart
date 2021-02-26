
class BankVerification {
    String account_name;
    String account_number;
    String bank_code;
    String bank_name;
    String execution_time;
    String requests;

    BankVerification({this.account_name, this.account_number, this.bank_code, this.bank_name, this.execution_time, this.requests});

    factory BankVerification.fromJson(Map<String, dynamic> json) {
        return BankVerification(
            account_name: json['account_name'], 
            account_number: json['account_number'], 
            bank_code: json['bank_code'], 
            bank_name: json['bank_name'], 
            execution_time: json['execution_time'], 
            requests: json['requests'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['account_name'] = this.account_name;
        data['account_number'] = this.account_number;
        data['bank_code'] = this.bank_code;
        data['bank_name'] = this.bank_name;
        data['execution_time'] = this.execution_time;
        data['requests'] = this.requests;
        return data;
    }
}