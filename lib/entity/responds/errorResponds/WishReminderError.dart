
class WishReminderError {
    WishErrors errors;
    String message;
    int status_code;

    WishReminderError({this.errors, this.message, this.status_code});

    factory WishReminderError.fromJson(Map<String, dynamic> json) {
        return WishReminderError(
            errors: json['errors'] != null ? WishErrors.fromJson(json['errors']) : null,
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

class WishErrors {
    List<String> frequency;
    List<String> time;

    WishErrors({this.frequency, this.time});

    factory WishErrors.fromJson(Map<String, dynamic> json) {
        return WishErrors(
            frequency: json['frequency'] != null ? new List<String>.from(json['frequency']) : null,
            time: json['time'] != null ? new List<String>.from(json['time']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.frequency != null) {
            data['frequency'] = this.frequency;
        }
        if (this.time != null) {
            data['time'] = this.time;
        }
        return data;
    }
}