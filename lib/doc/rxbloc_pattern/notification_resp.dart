

class NotificationRespond {
  String patient_id;
  String room_name;
  String patient_name;
  String patient_email;
  String doctor_name;
  String doctor_email;
  String doctor_id;


  String channel_name;
  String doc_id;
  String token;
  String doc_name;
  String patient_nam;
  String minutes_left;
  String identifier;
  String patient_i;
  String type;

  NotificationRespond({this.patient_id, this.room_name, this.patient_name, this.patient_email,
    this.doctor_name, this.doctor_email, this.doctor_id,

    this.channel_name , this.doc_id , this.token , this.doc_name , this.patient_i , this.patient_nam,this.identifier,
    this.minutes_left,this.type
  });

  factory NotificationRespond.fromJson(Map<String, dynamic> json) {
    return NotificationRespond(
      patient_id: json['patient_id'],
      room_name: json['room_name'],
      patient_name: json['patient_name'],
      patient_email: json['patient_email'],
      doctor_name: json['doctor_name'],
      doctor_email: json['doctor_email'],
      doctor_id: json['doctor_id'],


      type: json['type'],

      channel_name: json['channel_name'],
      doc_id: json['doc_id'],
      token: json['token'],
      doc_name: json['doc_name'],
      patient_nam: json['patient_nam'],
      minutes_left: json['minutes_left'],
      identifier: json['identifier'],
      patient_i: json['patient_i'],

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channel_name'] = this.channel_name;
    data['doc_id'] = this.doc_id;
    data['token'] = this.token;
    data['doc_name'] = this.doc_name;
    data['patient_nam'] = this.patient_nam;
    data['doctor_email'] = this.doctor_email;
    data['doctor_id'] = this.doctor_id;


    data['doc_id'] = this.doc_id;
    data['token'] = this.token;
    data['doc_name'] = this.doc_name;
    data['patient_nam'] = this.patient_nam;
    data['minutes_left'] = this.minutes_left;
    data['identifier'] = this.identifier;
    data['patient_i'] = this.patient_i;
    data['channel_name'] = this.channel_name;
    data['type'] = this.type;

    return data;
  }
}