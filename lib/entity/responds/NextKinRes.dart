
import 'NextData.dart';

class NextKinRes {
    NextData data;

    NextKinRes({this.data});

    factory NextKinRes.fromJson(Map<String, dynamic> json) {
        return NextKinRes(
            data: json['data'] != null ? NextData.fromJson(json['data']) : null,
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

class NextOfKin {
    String address;
    String city;
    String email;
    double lat;
    String lga;
    double long;
    String name;
    String phone;
    String state;

    NextOfKin({this.address, this.city, this.email, this.lat, this.lga, this.long, this.name, this.phone, this.state});

    factory NextOfKin.fromJson(Map<String, dynamic> json) {
        return NextOfKin(
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