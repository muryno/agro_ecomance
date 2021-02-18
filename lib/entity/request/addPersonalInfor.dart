
class addPersonalInfor {
    String address;
    String city;
    String display_name;
    String email;
    String first_name;
    String last_name;
    double lat;
    String lga;
    double long;
    String phone;
    String state;
    bool use_as_delivery_address;

    bool  set_default;
    String nearest_bus_stop;


    //    //  "first_name": "Nath",
    //     //     "last_name": "Abolarin",
    //     //     "email": "nath@gmail.com",
    //     //     "phone": "234703140487",
    //     //     "address": "Blessing Avenue, Iyana Ipaja, Lagos.",
    //     //     "city": "Ikeja",
    //     //     "nearest_bus_stop": "Aboru",
    //     //     "state": "Lagos",
    //     //     "lat": 1.488484,
    //     //     "long": 6.997979,
    //     //     "set_default": true

    addPersonalInfor({this.address, this.city, this.display_name, this.email, this.first_name, this.last_name, this.lat, this.lga, this.long, this.phone, this.state, this.use_as_delivery_address,this.set_default,this.nearest_bus_stop});

    factory addPersonalInfor.fromJson(Map<String, dynamic> json) {
        return addPersonalInfor(
            address: json['address'], 
            city: json['city'], 
            display_name: json['display_name'], 
            email: json['email'], 
            first_name: json['first_name'], 
            last_name: json['last_name'], 
            lat: json['lat'], 
            lga: json['lga'], 
            long: json['long'],
            phone: json['phone'], 
            state: json['state'],

            set_default: json['set_default'],
            nearest_bus_stop: json['nearest_bus_stop'],

            use_as_delivery_address: json['use_as_delivery_address'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['city'] = this.city;
        data['display_name'] = this.display_name;
        data['email'] = this.email;
        data['first_name'] = this.first_name;
        data['last_name'] = this.last_name;
        data['lat'] = this.lat;
        data['lga'] = this.lga;
        data['long'] = this.long;
        data['phone'] = this.phone;
        data['state'] = this.state;

        data['set_default'] = this.set_default;
        data['nearest_bus_stop'] = this.nearest_bus_stop;

        data['use_as_delivery_address'] = this.use_as_delivery_address;
        return data;
    }
}