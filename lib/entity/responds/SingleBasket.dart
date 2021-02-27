import 'Reminder.dart';


class SingleBasket {
    SingleBasketData data;
    String message;
    int status_code;

    SingleBasket({this.data, this.message, this.status_code});

    factory SingleBasket.fromJson(Map<String, dynamic> json) {
        return SingleBasket(
            data: json['data'] != null ? SingleBasketData.fromJson(json['data']) : null,
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


class SingleBasketData {
    String created_at;
    int id;
    List<Reminder> reminder;
    String title;
    String updated_at;
    int user_id;
    String uuid;

    SingleBasketData({this.created_at, this.id, this.reminder, this.title, this.updated_at, this.user_id, this.uuid});

    factory SingleBasketData.fromJson(Map<String, dynamic> json) {
        return SingleBasketData(
            created_at: json['created_at'],
            id: json['id'],
            reminder: json['reminder'] != null ? (json['reminder'] as List).map((i) => Reminder.fromJson(i)).toList() : null,
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
            data['reminder'] = this.reminder.map((v) => v.toJson()).toList();
        }
        return data;
    }
}