
class AppointmentReviewRequest {
  String channelName;
  int patient_id;
  int  minutes_left;
  int doc_id;
  int isVoiceCall;
  String doc_name;
  String patient_name;
//  String minutes_left,String doc_id,String patient_id,String channel_name


  AppointmentReviewRequest({this.channelName, this.patient_id, this.minutes_left, this.doc_id, this.isVoiceCall,this.doc_name,this.patient_name});

  factory AppointmentReviewRequest.fromJson(Map<String, dynamic> json) {
    return AppointmentReviewRequest(
      channelName: json['channelName'],
      patient_id: json['patient_id'],
      minutes_left: json['minutes_left'],
      doc_id: json['doc_id'],
      isVoiceCall: json['isVoiceCall'],
      doc_name: json['doc_name'],
      patient_name: json['patient_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channelName'] = this.channelName;
    data['tokenName'] = this.patient_id;
    data['minutes_left'] = this.minutes_left;
    data['doc_id'] = this.doc_id;
    data['doc_name'] = this.doc_name;
    data['patient_name'] = this.patient_name;
    return data;
  }
}

