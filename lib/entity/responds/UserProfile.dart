
import 'package:agro_ecomance/entity/responds/NextKinResp.dart';

class UserProfile {
    UserProfileData data;

    UserProfile({this.data,this.status_code,this.message});

    int status_code;
    String message;



    factory UserProfile.fromJson(Map<String, dynamic> json) {
        return UserProfile(
            data: json['data'] != null ? UserProfileData.fromJson(json['data']) : null,
            status_code: json['status_code'],
            message: json['message'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        data['status_code'] = this.status_code;
        return data;
    }
}

class UserProfileData {
    String avatar_path;
    String avatar_url;
    bool blocked;
    String created_at;
    String date_of_birth;
    String deleted_at;
    List<DeliveryAddres> delivery_address;
    String display_name;
    String email;
    String email_verified_at;
    String final_verified_at;
    String first_name;
    int id;
    String invited_by;
    var ip;
    String last_login;
    String last_name;
    NextOfKin next_of_kin;
    var parent_id;
    var phone;
    Preference preference;
    String referral_code;
    String updated_at;
    String username;
    var uuid;
    var cid;

    UserProfileData({this.cid,this.avatar_path, this.avatar_url, this.blocked, this.created_at, this.date_of_birth, this.deleted_at, this.delivery_address, this.display_name, this.email, this.email_verified_at, this.final_verified_at, this.first_name, this.id, this.invited_by, this.ip, this.last_login, this.last_name, this.next_of_kin, this.parent_id, this.phone, this.preference, this.referral_code, this.updated_at, this.username, this.uuid});

    factory UserProfileData.fromJson(Map<String, dynamic> json) {
        return UserProfileData(
            avatar_path: json['avatar_path'],
            avatar_url: json['avatar_url'],
            blocked: json['blocked'],
            created_at: json['created_at'],
            cid: json['cid'],
            date_of_birth: json['date_of_birth'],
            deleted_at: json['deleted_at'],
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
        data['cid'] = this.cid;
        data['deleted_at'] = this.deleted_at;
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


class Preference {
    bool newsletter;
    bool notifications;

    Preference({this.newsletter, this.notifications});

    factory Preference.fromJson(Map<String, dynamic> json) {
        return Preference(
            newsletter: json['newsletter'],
            notifications: json['notifications'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['newsletter'] = this.newsletter;
        data['notifications'] = this.notifications;
        return data;
    }
}



class DeliveryAddres {
    var id;
    String address;
    String city;
    bool defaults;
    String email;
    String first_name;
    String last_name;
    var lat;
    var long;
    String nearest_bus_stop;
    String phone;
    String state;
    String uuid;
    var distance;
    String display_name;

    int deliverType;


    DeliveryAddres({this.deliverType,this.id, this.display_name,this.distance,this.address, this.city, this.defaults, this.email, this.first_name, this.last_name, this.lat, this.long, this.nearest_bus_stop, this.phone, this.state, this.uuid});

    factory DeliveryAddres.fromJson(Map<String, dynamic> json) {
        return DeliveryAddres(
//

            deliverType: json['deliverType'],
            id: json['id'],
            display_name: json['display_name'],
            distance: json['distance'],

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

        data['id'] = this.id;


        data['deliverType'] = this.deliverType;
        data['display_name'] = this.display_name;
        data['distance'] = this.distance;
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