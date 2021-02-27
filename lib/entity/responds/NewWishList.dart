
import 'package:agro_ecomance/entity/responds/Reminder.dart';

class NewWishList {
    String message;
    NewWishData newWishData;
    int status_code;

    NewWishList({this.message, this.newWishData, this.status_code});

    factory NewWishList.fromJson(Map<String, dynamic> json) {
        return NewWishList(
            message: json['message'], 
            newWishData: json['data'] != null ? NewWishData.fromJson(json['data']) : null,
            status_code: json['status_code'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status_code'] = this.status_code;
        if (this.newWishData != null) {
            data['data'] = this.newWishData.toJson();
        }
        return data;
    }
}


class NewWishData {
    String created_at;
    int id;
    Reminder reminder;
    String title;
    String updated_at;
    int user_id;
    String uuid;

    NewWishData({this.created_at, this.id, this.reminder, this.title, this.updated_at, this.user_id, this.uuid});

    factory NewWishData.fromJson(Map<String, dynamic> json) {
        return NewWishData(
            created_at: json['created_at'],
            id: json['id'],

            reminder: json['reminder'] != null ? Reminder.fromJson(json['reminder']) : null,

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

        if (this.reminder != null) {
            data['reminder'] = this.reminder.toJson();
        }

        data['title'] = this.title;
        data['updated_at'] = this.updated_at;
        data['user_id'] = this.user_id;
        data['uuid'] = this.uuid;
        return data;
    }
}