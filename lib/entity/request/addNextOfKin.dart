
class addNextOfKin {
    String address;
    String city;
    String email;
    double lat;
    String lga;
    double long;
    String name;
    var phone;
    String state;

    addNextOfKin({this.address, this.city, this.email, this.lat, this.lga, this.long, this.name, this.phone, this.state});

    factory addNextOfKin.fromJson(Map<String, dynamic> json) {
        return addNextOfKin(
            address: json['address'], 
            city: json['city'], 
            email: json['email'], 
            lat: json['lat'], 
            lga: json['lga'], 
            long: json['long'], 
            name: json['name'], 
            phone: json['phone'], 
            state: json['state'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['city'] = this.city;
        data['email'] = this.email;
        data['lat'] = this.lat;
        data['lga'] = this.lga;
        data['long'] = this.long;
        data['name'] = this.name;
        data['phone'] = this.phone;
        data['state'] = this.state;
        return data;
    }
}