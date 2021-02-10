

class startSignupReq {
    String first_name;
    String last_name;
    String password;
    String phone;
    String type;

    startSignupReq({this.first_name, this.last_name, this.password, this.phone, this.type});

    factory startSignupReq.fromJson(Map<String, dynamic> json) {
        return startSignupReq(
            first_name: json['first_name'], 
            last_name: json['last_name'], 
            password: json['password'], 
            phone: json['phone'], 
            type: json['type'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['first_name'] = this.first_name;
        data['last_name'] = this.last_name;
        data['password'] = this.password;
        data['phone'] = this.phone;
        data['type'] = this.type;
        return data;
    }
}