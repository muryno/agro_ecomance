

class AppointmentTime {
    String time;
    int id;

    AppointmentTime({this.time, this.id});

    factory AppointmentTime.fromJson(Map<String, dynamic> json) {
        return AppointmentTime(
            time: json['time'],
            id: json['id'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['time'] = this.time;
        data['id'] = this.id;
        return data;
    }
}