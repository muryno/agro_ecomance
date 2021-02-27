
class setReminderReq {
    String frequency;
    String time;

    setReminderReq({this.frequency, this.time});

    factory setReminderReq.fromJson(Map<String, dynamic> json) {
        return setReminderReq(
            frequency: json['frequency'], 
            time: json['time'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['frequency'] = this.frequency;
        data['time'] = this.time;
        return data;
    }
}