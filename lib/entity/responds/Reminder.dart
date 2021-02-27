
class Reminder {
    ReminderData data;
    String message;
    int status_code;

    Reminder({this.data, this.message, this.status_code});

    factory Reminder.fromJson(Map<String, dynamic> json) {
        return Reminder(
            data: json['data'] != null ? ReminderData.fromJson(json['data']) : null,
            message: json['message'], 
            status_code: json['status_code'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status_code'] = this.status_code;
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        return data;
    }
}

class ReminderData {
    String created_at;
    int id;
    ReminderX reminder;
    String title;
    String updated_at;
    int user_id;
    String uuid;

    ReminderData({this.created_at, this.id, this.reminder, this.title, this.updated_at, this.user_id, this.uuid});

    factory ReminderData.fromJson(Map<String, dynamic> json) {
        return ReminderData(
            created_at: json['created_at'],
            id: json['id'],
            reminder: json['reminder'] != null ? ReminderX.fromJson(json['reminder']) : null,
            title: json['title'],
            updated_at: json['updated_at'],
            user_id: json['user_id'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['id'] = this.id;
        data['title'] = this.title;
        data['updated_at'] = this.updated_at;
        data['user_id'] = this.user_id;
        data['uuid'] = this.uuid;
        if (this.reminder != null) {
            data['reminder'] = this.reminder.toJson();
        }
        return data;
    }
}


class ReminderX {
    String frequency;
    String last_ran;
    String next;
    String previous;
    String time;

    ReminderX({this.frequency, this.last_ran, this.next, this.previous, this.time});

    factory ReminderX.fromJson(Map<String, dynamic> json) {
        return ReminderX(
            frequency: json['frequency'],
            last_ran: json['last_ran'],
            next: json['next'],
            previous: json['previous'],
            time: json['time'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['frequency'] = this.frequency;
        data['last_ran'] = this.last_ran;
        data['next'] = this.next;
        data['previous'] = this.previous;
        data['time'] = this.time;
        return data;
    }
}