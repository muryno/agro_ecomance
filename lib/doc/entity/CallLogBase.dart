

class CallLogBase {
    List<CallLog> logs;

    CallLogBase({this.logs});

    factory CallLogBase.fromJson(Map<String, dynamic> json) {
        return CallLogBase(
            logs: json['logs'] != null ? (json['logs'] as List).map((i) => CallLog.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.logs != null) {
            data['logs'] = this.logs.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class CallLog {
    String created_at;
    String firstname;
    String lastname;
    String min_used;

    CallLog({this.created_at, this.firstname, this.lastname, this.min_used});

    factory CallLog.fromJson(Map<String, dynamic> json) {
        return CallLog(
            created_at: json['created_at'],
            firstname: json['firstname'],
            lastname: json['lastname'],
            min_used: json['min_used'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['firstname'] = this.firstname;
        data['lastname'] = this.lastname;
        data['min_used'] = this.min_used;
        return data;
    }
}