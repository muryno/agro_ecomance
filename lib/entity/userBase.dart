

class userBase {
    int otp;
    String otp_secret;
    int status_code;
    String type;
    Users users;
    String message;
    userBase({this.otp, this.otp_secret, this.status_code, this.type, this.users,this.message});

    factory userBase.fromJson(Map<String, dynamic> json) {
        return userBase(
            otp: json['otp'], 
            otp_secret: json['otp_secret'], 
            status_code: json['status_code'],
            message: json['message'],
            type: json['type'], 
            users: json['data'] != null ? Users.fromJson(json['data']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['otp'] = this.otp;
        data['otp_secret'] = this.otp_secret;
        data['status_code'] = this.status_code;
        data['message'] = this.message;
        data['type'] = this.type;
        if (this.users != null) {
            data['data'] = this.users.toJson();
        }
        return data;
    }
}



class Users {
    Address address;
    String created_at;
    String date_of_birth;
    String display_name;
    String email;
    String first_name;
    String ip;
    String last_login;
    String last_name;
    String phone;
    String uuid;

    Users({this.address, this.created_at, this.date_of_birth, this.display_name, this.email, this.first_name, this.ip, this.last_login, this.last_name, this.phone, this.uuid});

    factory Users.fromJson(Map<String, dynamic> json) {
        return Users(
            address: json['address'] != null ? Address.fromJson(json['address']) : null,
            created_at: json['created_at'],
            date_of_birth: json['date_of_birth'],
            display_name: json['display_name'],
            email: json['email'],
            first_name: json['first_name'],
            ip: json['ip'],
            last_login: json['last_login'],
            last_name: json['last_name'],
            phone: json['phone'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['date_of_birth'] = this.date_of_birth;
        data['display_name'] = this.display_name;
        data['email'] = this.email;
        data['first_name'] = this.first_name;
        data['ip'] = this.ip;
        data['last_login'] = this.last_login;
        data['last_name'] = this.last_name;
        data['phone'] = this.phone;
        data['uuid'] = this.uuid;
        if (this.address != null) {
            data['address'] = this.address.toJson();
        }
        return data;
    }
}


class Address {
    String address;
    String admin_id;
    int aggregator_id;
    String city;
    String created_at;
    String distributor_id;
    String food_mart_id;
    int id;
    String lat;
    String lga;
    String long;
    String state;
    String updated_at;
    String user_id;
    String uuid;

    Address({this.address, this.admin_id, this.aggregator_id, this.city, this.created_at, this.distributor_id, this.food_mart_id, this.id, this.lat, this.lga, this.long, this.state, this.updated_at, this.user_id, this.uuid});

    factory Address.fromJson(Map<String, dynamic> json) {
        return Address(
            address: json['address'],
            admin_id: json['admin_id'],
            aggregator_id: json['aggregator_id'],
            city: json['city'],
            created_at: json['created_at'],
            distributor_id: json['distributor_id'],
            food_mart_id: json['food_mart_id'],
            id: json['id'],
            lat: json['lat'],
            lga: json['lga'],
            long: json['long'],
            state: json['state'],
            updated_at: json['updated_at'],
            user_id: json['user_id'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['admin_id'] = this.admin_id;
        data['aggregator_id'] = this.aggregator_id;
        data['city'] = this.city;
        data['created_at'] = this.created_at;
        data['distributor_id'] = this.distributor_id;
        data['food_mart_id'] = this.food_mart_id;
        data['id'] = this.id;
        data['lat'] = this.lat;
        data['lga'] = this.lga;
        data['long'] = this.long;
        data['state'] = this.state;
        data['updated_at'] = this.updated_at;
        data['user_id'] = this.user_id;
        data['uuid'] = this.uuid;
        return data;
    }
}