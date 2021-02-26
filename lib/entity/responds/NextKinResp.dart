
import 'package:agro_ecomance/entity/responds/DeliveryAddressResp.dart';

class NextKinResp {
    NextKinData nextKinData;

    NextKinResp({this.nextKinData});

    factory NextKinResp.fromJson(Map<String, dynamic> json) {
        return NextKinResp(
            nextKinData: json['data'] != null ? NextKinData.fromJson(json['data']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.nextKinData != null) {
            data['data'] = this.nextKinData.toJson();
        }
        return data;
    }
}

class NextKinData {
    String avatar_url;
    bool blocked;
    String cid;
    String created_at;
    String date_of_birth;
    List<DeliveryAddres> delivery_address;
    String display_name;
    String email;
    String final_verified_at;
    String first_name;
    String ip;
    String last_login;
    String last_name;
    NextOfKin next_of_kin;
    var phone;
    String updated_at;
    String username;
    String uuid;

    NextKinData({this.avatar_url, this.blocked, this.cid, this.created_at, this.date_of_birth, this.delivery_address, this.display_name, this.email, this.final_verified_at, this.first_name, this.ip, this.last_login, this.last_name, this.next_of_kin, this.phone, this.updated_at, this.username, this.uuid});

    factory NextKinData.fromJson(Map<String, dynamic> json) {
        return NextKinData(
            avatar_url: json['avatar_url'],
            blocked: json['blocked'],
            cid: json['cid'],
            created_at: json['created_at'],
            date_of_birth: json['date_of_birth'],
            delivery_address: json['delivery_address'] != null ? (json['delivery_address'] as List).map((i) => DeliveryAddres.fromJson(i)).toList() : null,
            display_name: json['display_name'],
            email: json['email'],
            final_verified_at: json['final_verified_at'],
            first_name: json['first_name'],
            ip: json['ip'],
            last_login: json['last_login'],
            last_name: json['last_name'],
            next_of_kin: json['next_of_kin'] != null ? NextOfKin.fromJson(json['next_of_kin']) : null,
            phone: json['phone'],
            updated_at: json['updated_at'],
            username: json['username'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['avatar_url'] = this.avatar_url;
        data['blocked'] = this.blocked;
        data['cid'] = this.cid;
        data['created_at'] = this.created_at;
        data['date_of_birth'] = this.date_of_birth;
        data['display_name'] = this.display_name;
        data['email'] = this.email;
        data['final_verified_at'] = this.final_verified_at;
        data['first_name'] = this.first_name;
        data['ip'] = this.ip;
        data['last_login'] = this.last_login;
        data['last_name'] = this.last_name;
        data['phone'] = this.phone;
        data['updated_at'] = this.updated_at;
        data['username'] = this.username;
        data['uuid'] = this.uuid;
        if (this.delivery_address != null) {
            data['delivery_address'] = this.delivery_address.map((v) => v.toJson()).toList();
        }
        if (this.next_of_kin != null) {
            data['next_of_kin'] = this.next_of_kin.toJson();
        }
        return data;
    }
}

class NextOfKin {
    String address;
    String city;
    String email;
    var lat;
    String lga;
    var long;
    String name;
    var phone;
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