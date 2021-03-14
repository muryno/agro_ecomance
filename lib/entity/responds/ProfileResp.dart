

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
    var avatar_path;
    var avatar_url;
    var blocked;
    var created_at;
    var date_of_birth;
    List<DeliveryAddres> delivery_address;
    var display_name;
    var email;
    var email_verified_at;
    var final_verified_at;
    var first_name;
    var id;
    var invited_by;
    var ip;
    var last_login;
    var last_name;
    NextOfKin next_of_kin;
    var parent_id;
    var phone;
    Preference preference;
    var referral_code;
    var updated_at;
    var username;
    var uuid;

    ProfileData({this.avatar_path, this.avatar_url, this.blocked, this.created_at, this.date_of_birth, this.delivery_address, this.display_name, this.email, this.email_verified_at, this.final_verified_at, this.first_name, this.id, this.invited_by, this.ip, this.last_login, this.last_name, this.next_of_kin, this.parent_id, this.phone, this.preference, this.referral_code, this.updated_at, this.username, this.uuid});

    factory ProfileData.fromJson(Map<String, dynamic> json) {
        return ProfileData(
            avatar_path: json['avatar_path'],
            avatar_url: json['avatar_url'],
            blocked: json['blocked'],
            created_at: json['created_at'],
            date_of_birth: json['date_of_birth'],
            delivery_address: json['delivery_address'] != null ? (json['delivery_address'] as List).map((i) => DeliveryAddres.fromJson(i)).toList() : null,
            display_name: json['display_name'],
            email: json['email'],
            email_verified_at: json['email_verified_at'],
            final_verified_at: json['final_verified_at'],
            first_name: json['first_name'],
            id: json['id'],
            invited_by: json['invited_by'],
            ip: json['ip'],
            last_login: json['last_login'],
            last_name: json['last_name'],
            next_of_kin: json['next_of_kin'] != null ? NextOfKin.fromJson(json['next_of_kin']) : null,
            parent_id: json['parent_id'],
            phone: json['phone'],
            preference: json['preference'] != null ? Preference.fromJson(json['preference']) : null,
            referral_code: json['referral_code'],
            updated_at: json['updated_at'],
            username: json['username'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['avatar_path'] = this.avatar_path;
        data['avatar_url'] = this.avatar_url;
        data['blocked'] = this.blocked;
        data['created_at'] = this.created_at;
        data['date_of_birth'] = this.date_of_birth;
        data['display_name'] = this.display_name;
        data['email'] = this.email;
        data['email_verified_at'] = this.email_verified_at;
        data['final_verified_at'] = this.final_verified_at;
        data['first_name'] = this.first_name;
        data['id'] = this.id;
        data['invited_by'] = this.invited_by;
        data['ip'] = this.ip;
        data['last_login'] = this.last_login;
        data['last_name'] = this.last_name;
        data['parent_id'] = this.parent_id;
        data['phone'] = this.phone;
        data['referral_code'] = this.referral_code;
        data['updated_at'] = this.updated_at;
        data['username'] = this.username;
        data['uuid'] = this.uuid;
        if (this.delivery_address != null) {
            data['delivery_address'] = this.delivery_address.map((v) => v.toJson()).toList();
        }
        if (this.next_of_kin != null) {
            data['next_of_kin'] = this.next_of_kin.toJson();
        }
        if (this.preference != null) {
            data['preference'] = this.preference.toJson();
        }
        return data;
    }
}
class NextOfKin {
    String address;
    String city;
    String email;
    var lat;
    var lga;
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