
class UserProfile {
    UserProfileData data;

    UserProfile({this.data});

    factory UserProfile.fromJson(Map<String, dynamic> json) {
        return UserProfile(
            data: json['data'] != null ? UserProfileData.fromJson(json['data']) : null,
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



class UserProfileData {
    String avatar_path;
    String avatar_url;
    bool blocked;
    String created_at;
    String date_of_birth;
    String deleted_at;
    String display_name;
    String email;
    String email_verified_at;
    String final_verified_at;
    String first_name;
    int id;
    String ip;
    String last_login;
    String last_name;
    String parent_id;
    String phone;
    String referral_code;
    String updated_at;
    String username;
    String uuid;

    UserProfileData({this.avatar_path, this.avatar_url, this.blocked, this.created_at, this.date_of_birth, this.deleted_at, this.display_name, this.email, this.email_verified_at, this.final_verified_at, this.first_name, this.id, this.ip, this.last_login, this.last_name, this.parent_id, this.phone, this.referral_code, this.updated_at, this.username, this.uuid});

    factory UserProfileData.fromJson(Map<String, dynamic> json) {
        return UserProfileData(
            avatar_path: json['avatar_path'],
            avatar_url: json['avatar_url'],
            blocked: json['blocked'],
            created_at: json['created_at'],
            date_of_birth: json['date_of_birth'],
            deleted_at: json['deleted_at'],
            display_name: json['display_name'],
            email: json['email'],
            email_verified_at: json['email_verified_at'],
            final_verified_at: json['final_verified_at'],
            first_name: json['first_name'],
            id: json['id'],
            ip: json['ip'],
            last_login: json['last_login'],
            last_name: json['last_name'],
            parent_id: json['parent_id'],
            phone: json['phone'],
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
        data['deleted_at'] = this.deleted_at;
        data['display_name'] = this.display_name;
        data['email'] = this.email;
        data['email_verified_at'] = this.email_verified_at;
        data['final_verified_at'] = this.final_verified_at;
        data['first_name'] = this.first_name;
        data['id'] = this.id;
        data['ip'] = this.ip;
        data['last_login'] = this.last_login;
        data['last_name'] = this.last_name;
        data['parent_id'] = this.parent_id;
        data['phone'] = this.phone;
        data['referral_code'] = this.referral_code;
        data['updated_at'] = this.updated_at;
        data['username'] = this.username;
        data['uuid'] = this.uuid;
        return data;
    }
}