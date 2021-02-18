
import 'DeliveryAddress.dart';
import 'NextKinRes.dart';

class NextData {
    String avatar_url;
    String blocked;
    String cid;
    String created_at;
    String date_of_birth;
    DeliveryAddress delivery_address;
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

    NextData({this.avatar_url, this.blocked, this.cid, this.created_at, this.date_of_birth, this.delivery_address, this.display_name, this.email, this.first_name, this.ip, this.last_login, this.last_name, this.next_of_kin, this.phone, this.username, this.uuid});

    factory NextData.fromJson(Map<String, dynamic> json) {
        return NextData(
            avatar_url: json['avatar_url'], 
            blocked: json['blocked'], 
            cid: json['cid'], 
            created_at: json['created_at'], 
            date_of_birth: json['date_of_birth'], 
            delivery_address: json['delivery_address'] != null ? DeliveryAddress.fromJson(json['delivery_address']) : null, 
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
            data['delivery_address'] = this.delivery_address.toJson();
        }
        if (this.next_of_kin != null) {
            data['next_of_kin'] = this.next_of_kin.toJson();
        }
        return data;
    }
}