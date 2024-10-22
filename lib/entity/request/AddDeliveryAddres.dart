
class AddDeliveryAddres {
    String address;
    String city;
    double lat;
    String lga;
    double long;
    String state;

    AddDeliveryAddres({this.address, this.city, this.lat, this.lga, this.long, this.state});

    factory AddDeliveryAddres.fromJson(Map<String, dynamic> json) {
        return AddDeliveryAddres(
            address: json['address'], 
            city: json['city'], 
            lat: json['lat'], 
            lga: json['lga'], 
            long: json['long'], 
            state: json['state'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['city'] = this.city;
        data['lat'] = this.lat;
        data['lga'] = this.lga;
        data['long'] = this.long;
        data['state'] = this.state;
        return data;
    }
}