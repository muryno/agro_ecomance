
class addPersonalInfor {
    String address;
    String city;
    String email;
    String first_name;
    String last_name;
    double lat;
    double long;
    String nearest_bus_stop;
    String phone;
    bool set_default;
    String state;

    addPersonalInfor({this.address, this.city, this.email, this.first_name, this.last_name, this.lat, this.long, this.nearest_bus_stop, this.phone, this.set_default, this.state});

    factory addPersonalInfor.fromJson(Map<String, dynamic> json) {
        return addPersonalInfor(
            address: json['address'], 
            city: json['city'], 
            email: json['email'], 
            first_name: json['first_name'], 
            last_name: json['last_name'], 
            lat: json['lat'], 
            long: json['long'], 
            nearest_bus_stop: json['nearest_bus_stop'], 
            phone: json['phone'], 
            set_default: json['set_default'], 
            state: json['state'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['city'] = this.city;
        data['email'] = this.email;
        data['first_name'] = this.first_name;
        data['last_name'] = this.last_name;
        data['lat'] = this.lat;
        data['long'] = this.long;
        data['nearest_bus_stop'] = this.nearest_bus_stop;
        data['phone'] = this.phone;
        data['set_default'] = this.set_default;
        data['state'] = this.state;
        return data;
    }
}