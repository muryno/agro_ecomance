
class SignUpError {
    Errors errors;
    String message;
    int status_code;

    SignUpError({this.errors, this.message, this.status_code});

    factory SignUpError.fromJson(Map<String, dynamic> json) {
        return SignUpError(
            errors: json['errors'] != null ? Errors.fromJson(json['errors']) : null, 
            message: json['message'], 
            status_code: json['status_code'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status_code'] = this.status_code;
        if (this.errors != null) {
            data['errors'] = this.errors.toJson();
        }
        return data;
    }
}

class Errors {
    List<String> email;
    List<String> phone;
    List<String> username;
    List<String> password;
    Errors({this.email, this.phone, this.username,this.password});

    factory Errors.fromJson(Map<String, dynamic> json) {
        return Errors(
            email: json['email'] != null ? new List<String>.from(json['email']) : null,
            phone: json['phone'] != null ? new List<String>.from(json['phone']) : null,
            password: json['password'] != null ? new List<String>.from(json['password']) : null,
            username: json['username'] != null ? new List<String>.from(json['username']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.email != null) {
            data['email'] = this.email;
        }
        if (this.phone != null) {
            data['phone'] = this.phone;
        }
        if (this.username != null) {
            data['username'] = this.username;
        }

        if (this.password != null) {
            data['password'] = this.password;
        }
        return data;
    }
}