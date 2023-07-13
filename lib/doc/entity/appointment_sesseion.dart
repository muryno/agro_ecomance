

class AppointmentSession {
    String name;
    int id;

    AppointmentSession({this.name, this.id});

    factory AppointmentSession.fromJson(Map<String, dynamic> json) {
        return AppointmentSession(
            name: json['name'],
            id: json['id'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        data['id'] = this.id;
        return data;
    }
}