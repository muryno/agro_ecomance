

class UserDataBiometric {

    String email;
    String password;
    UserDataBiometric({ this.email, this.password});

    factory UserDataBiometric.fromJson(Map<String, dynamic> json) {
        return UserDataBiometric (
            email: json['email'],
            password: json['password'],

        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['password'] = this.password;

    }
}

