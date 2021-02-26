package entity.responds.fhfl

class Datas {
    String avatar_path;
    Object avatar_url;
    bool blocked;
    String created_at;
    Object date_of_birth;
    Object deleted_at;
    List<DeliveryAddres> delivery_address;
    String display_name;
    String email;
    String email_verified_at;
    Object final_verified_at;
    String first_name;
    int id;
    Object invited_by;
    String ip;
    String last_login;
    String last_name;
    NextOfKin next_of_kin;
    Object parent_id;
    String phone;
    Preference preference;
    String referral_code;
    String updated_at;
    String username;
    String uuid;

    Datas({this.avatar_path, this.avatar_url, this.blocked, this.created_at, this.date_of_birth, this.deleted_at, this.delivery_address, this.display_name, this.email, this.email_verified_at, this.final_verified_at, this.first_name, this.id, this.invited_by, this.ip, this.last_login, this.last_name, this.next_of_kin, this.parent_id, this.phone, this.preference, this.referral_code, this.updated_at, this.username, this.uuid});

    factory Datas.fromJson(Map<String, dynamic> json) {
        return Datas(
            avatar_path: json['avatar_path'], 
            avatar_url: json['avatar_url'] != null ? Object.fromJson(json['avatar_url']) : null, 
            blocked: json['blocked'], 
            created_at: json['created_at'], 
            date_of_birth: json['date_of_birth'] != null ? Object.fromJson(json['date_of_birth']) : null, 
            deleted_at: json['deleted_at'] != null ? Object.fromJson(json['deleted_at']) : null, 
            delivery_address: json['delivery_address'] != null ? (json['delivery_address'] as List).map((i) => DeliveryAddres.fromJson(i)).toList() : null, 
            display_name: json['display_name'], 
            email: json['email'], 
            email_verified_at: json['email_verified_at'], 
            final_verified_at: json['final_verified_at'] != null ? Object.fromJson(json['final_verified_at']) : null, 
            first_name: json['first_name'], 
            id: json['id'], 
            invited_by: json['invited_by'] != null ? Object.fromJson(json['invited_by']) : null, 
            ip: json['ip'], 
            last_login: json['last_login'], 
            last_name: json['last_name'], 
            next_of_kin: json['next_of_kin'] != null ? NextOfKin.fromJson(json['next_of_kin']) : null, 
            parent_id: json['parent_id'] != null ? Object.fromJson(json['parent_id']) : null, 
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
        data['blocked'] = this.blocked;
        data['created_at'] = this.created_at;
        data['display_name'] = this.display_name;
        data['email'] = this.email;
        data['email_verified_at'] = this.email_verified_at;
        data['first_name'] = this.first_name;
        data['id'] = this.id;
        data['ip'] = this.ip;
        data['last_login'] = this.last_login;
        data['last_name'] = this.last_name;
        data['phone'] = this.phone;
        data['referral_code'] = this.referral_code;
        data['updated_at'] = this.updated_at;
        data['username'] = this.username;
        data['uuid'] = this.uuid;
        if (this.avatar_url != null) {
            data['avatar_url'] = this.avatar_url.toJson();
        }
        if (this.date_of_birth != null) {
            data['date_of_birth'] = this.date_of_birth.toJson();
        }
        if (this.deleted_at != null) {
            data['deleted_at'] = this.deleted_at.toJson();
        }
        if (this.delivery_address != null) {
            data['delivery_address'] = this.delivery_address.map((v) => v.toJson()).toList();
        }
        if (this.final_verified_at != null) {
            data['final_verified_at'] = this.final_verified_at.toJson();
        }
        if (this.invited_by != null) {
            data['invited_by'] = this.invited_by.toJson();
        }
        if (this.next_of_kin != null) {
            data['next_of_kin'] = this.next_of_kin.toJson();
        }
        if (this.parent_id != null) {
            data['parent_id'] = this.parent_id.toJson();
        }
        if (this.preference != null) {
            data['preference'] = this.preference.toJson();
        }
        return data;
    }
}