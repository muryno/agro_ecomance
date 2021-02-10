
class completeSignUpReq {
    String address;
    String city;
    String email;
    String first_name;
    String last_name;
    String lga;
    String password;
    String phone;
    String state;
    String type;
    double lat;
    double long;

    completeSignUpReq({this.address, this.city, this.email, this.first_name, this.last_name, this.lga, this.password, this.phone, this.state, this.type,this.lat,this.long});

    factory completeSignUpReq.fromJson(Map<String, dynamic> json) {
        return completeSignUpReq(
            address: json['address'], 
            city: json['city'], 
            email: json['email'], 
            first_name: json['first_name'], 
            last_name: json['last_name'], 
            lga: json['lga'], 
            password: json['password'], 
            phone: json['phone'], 
            state: json['state'], 
            type: json['type'],
            lat: json['lat'],
            long: json['long'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['city'] = this.city;
        data['email'] = this.email;
        data['first_name'] = this.first_name;
        data['last_name'] = this.last_name;
        data['lga'] = this.lga;
        data['password'] = this.password;
        data['phone'] = this.phone;
        data['state'] = this.state;
        data['type'] = this.type;
        data['long'] = this.long;
        data['lat'] = this.lat;
        return data;
    }
}