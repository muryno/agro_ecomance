
import 'package:agro_ecomance/entity/responds/NextKinResp.dart';
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/userBase.dart';

class ProfileResp {
    ProfileData data;

    ProfileResp({this.data});

    factory ProfileResp.fromJson(Map<String, dynamic> json) {
        return ProfileResp(
            data: json['data'] != null ? ProfileData.fromJson(json['data']) : null,
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


class ProfileData {
    Address address;
    String avatar_url;
    bool blocked;
    String cid;
    String created_at;
    String date_of_birth;
    List<DeliveryAddres> delivery_address;
    String display_name;
    String email;
    String first_name;
    String ip;
    String last_login;
    String last_name;
    NextOfKin next_of_kin;
    String phone;
    String username;
    String uuid;

    ProfileData({this.address, this.avatar_url, this.blocked, this.cid, this.created_at, this.date_of_birth, this.delivery_address, this.display_name, this.email, this.first_name, this.ip, this.last_login, this.last_name, this.next_of_kin, this.phone, this.username, this.uuid});

    factory ProfileData.fromJson(Map<String, dynamic> json) {
        return ProfileData(
            address: json['address'] != null ? Address.fromJson(json['address']) : null,
            avatar_url: json['avatar_url'],
            blocked: json['blocked'],
            cid: json['cid'],
            created_at: json['created_at'],
            date_of_birth: json['date_of_birth'],
            delivery_address: json['delivery_address'] != null ? (json['delivery_address'] as List).map((i) => DeliveryAddres.fromJson(i)).toList() : null,
            display_name: json['display_name'],
            email: json['email'],
            first_name: json['first_name'],
            ip: json['ip'],
            last_login: json['last_login'],
            last_name: json['last_name'],
            next_of_kin: json['next_of_kin'] != null ? NextOfKin.fromJson(json['next_of_kin']) : null,
            phone: json['phone'],
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
        data['first_name'] = this.first_name;
        data['ip'] = this.ip;
        data['last_login'] = this.last_login;
        data['last_name'] = this.last_name;
        data['phone'] = this.phone;
        data['username'] = this.username;
        data['uuid'] = this.uuid;
        if (this.address != null) {
            data['address'] = this.address.toJson();
        }
        if (this.delivery_address != null) {
            data['delivery_address'] = this.delivery_address.map((v) => v.toJson()).toList();
        }
        if (this.next_of_kin != null) {
            data['next_of_kin'] = this.next_of_kin.toJson();
        }
        return data;
    }
}