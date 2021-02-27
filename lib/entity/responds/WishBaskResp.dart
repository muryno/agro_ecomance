
import 'package:agro_ecomance/entity/responds/Reminder.dart';

class WishBaskResp {
    List<WishBaskData> wishBaskData;

    WishBaskResp({this.wishBaskData});

    factory WishBaskResp.fromJson(Map<String, dynamic> json) {
        return WishBaskResp(
            wishBaskData: json['data'] != null ? (json['data'] as List).map((i) => WishBaskData.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.wishBaskData != null) {
            data['data'] = this.wishBaskData.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class WishBaskData {
    String created_at;
    int id;
    Reminder reminder;
    String title;
    String updated_at;
    int user_id;
    String uuid;

    WishBaskData({this.created_at, this.id, this.reminder, this.title, this.updated_at, this.user_id, this.uuid});

    factory WishBaskData.fromJson(Map<String, dynamic> json) {
        return WishBaskData(
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

        data['title'] = this.title;
        data['updated_at'] = this.updated_at;
        data['user_id'] = this.user_id;
        if (this.reminder != null) {
            data['data'] = this.reminder.toJson();
        }
        data['uuid'] = this.uuid;
        return data;
    }
}