

class DeliveryAddressResp {
    DeliveryAddres deliveryAddress;

    DeliveryAddressResp({this.deliveryAddress});

    factory DeliveryAddressResp.fromJson(Map<String, dynamic> json) {
        return DeliveryAddressResp(
            deliveryAddress: json['data'] != null ? DeliveryAddres.fromJson(json['data']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.deliveryAddress != null) {
            data['data'] = this.deliveryAddress.toJson();
        }
        return data;
    }
}

class DeliveryAddres {
    String address;
    String city;
    bool defaults;
    String email;
    String first_name;
    String last_name;
    double lat;
    double long;
    String nearest_bus_stop;
    String phone;
    String state;
    String uuid;

    DeliveryAddres({this.address, this.city, this.defaults, this.email, this.first_name, this.last_name, this.lat, this.long, this.nearest_bus_stop, this.phone, this.state, this.uuid});

    factory DeliveryAddres.fromJson(Map<String, dynamic> json) {
        return DeliveryAddres(
            address: json['address'],
            city: json['city'],
            defaults: json['default'],
            email: json['email'],
            first_name: json['first_name'],
            last_name: json['last_name'],
            lat: json['lat'],
            long: json['long'],
            nearest_bus_stop: json['nearest_bus_stop'],
            phone: json['phone'],
            state: json['state'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['city'] = this.city;
        data['default'] = this.defaults;
        data['email'] = this.email;
        data['first_name'] = this.first_name;
        data['last_name'] = this.last_name;
        data['lat'] = this.lat;
        data['long'] = this.long;
        data['nearest_bus_stop'] = this.nearest_bus_stop;
        data['phone'] = this.phone;
        data['state'] = this.state;
        data['uuid'] = this.uuid;
        return data;
    }
}