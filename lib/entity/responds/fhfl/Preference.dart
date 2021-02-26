package entity.responds.fhfl

class Preference {
    bool newsletter;
    bool notifications;

    Preference({this.newsletter, this.notifications});

    factory Preference.fromJson(Map<String, dynamic> json) {
        return Preference(
            newsletter: json['newsletter'], 
            notifications: json['notifications'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['newsletter'] = this.newsletter;
        data['notifications'] = this.notifications;
        return data;
    }
}