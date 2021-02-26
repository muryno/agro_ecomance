
class NetworkResp {
    List<NetworkData> data;
    Meta meta;

    NetworkResp({this.data, this.meta});

    factory NetworkResp.fromJson(Map<String, dynamic> json) {
        return NetworkResp(
            data: json['data'] != null ? (json['data'] as List).map((i) => NetworkData.fromJson(i)).toList() : null,
            meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.data != null) {
            data['`data`'] = this.data.map((v) => v.toJson()).toList();
        }
        if (this.meta != null) {
            data['meta'] = this.meta.toJson();
        }
        return data;
    }
}


class NetworkData {
    var avatar_url;
    var children;
    var display_name;
    var first_name;
    var last_name;
    var phone;
    var referral_code;
    var uuid;

    NetworkData({this.avatar_url, this.children, this.display_name, this.first_name, this.last_name, this.phone, this.referral_code, this.uuid});

    factory NetworkData.fromJson(Map<String, dynamic> json) {
        return NetworkData(
            avatar_url: json['avatar_url'],
            children: json['children'],
            display_name: json['display_name'],
            first_name: json['first_name'],
            last_name: json['last_name'],
            phone: json['phone'],
            referral_code: json['referral_code'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['avatar_url'] = this.avatar_url;
        data['children'] = this.children;
        data['display_name'] = this.display_name;
        data['first_name'] = this.first_name;
        data['last_name'] = this.last_name;
        data['phone'] = this.phone;
        data['referral_code'] = this.referral_code;
        data['uuid'] = this.uuid;
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



class Meta {
    var level;
    User user;

    Meta({this.level, this.user});

    factory Meta.fromJson(Map<String, dynamic> json) {
        return Meta(
            level: json['level'],
            user: json['user'] != null ? User.fromJson(json['user']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['level'] = this.level;
        if (this.user != null) {
            data['user'] = this.user.toJson();
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
    var name;
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


class User {
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

    User({this.avatar_url, this.blocked, this.cid, this.created_at, this.date_of_birth, this.delivery_address, this.display_name, this.email, this.first_name, this.ip, this.last_login, this.last_name, this.next_of_kin, this.phone, this.username, this.uuid});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
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
        if (this.delivery_address != null) {
            data['delivery_address'] = this.delivery_address.map((v) => v.toJson()).toList();
        }
        if (this.next_of_kin != null) {
            data['next_of_kin'] = this.next_of_kin.toJson();
        }
        return data;
    }
}