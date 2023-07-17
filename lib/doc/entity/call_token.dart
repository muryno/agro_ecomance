class CallToken {
    DataToken datat;
    String message;
    bool success;

    CallToken({this.datat, this.message, this.success});

    factory CallToken.fromJson(Map<String, dynamic> json) {
        return CallToken(
            datat: json['data'] != null ? DataToken.fromJson(json['data']) : null,
            message: json['message'], 
            success: json['success'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['success'] = this.success;
        if (this.datat != null) {
            data['data'] = this.datat.toJson();
        }
        return data;
    }
}



class DataToken {
    String channel_name;
    int doc_id;
    String token;
    String doc_name;
    String patient_name;
    int minutes_left;
    int identifier;
    int patient_id;


    DataToken({this.channel_name, this.doc_id, this.token,this.doc_name,this.minutes_left,this.patient_name,this.identifier,this.patient_id});

    factory DataToken.fromJson(Map<String, dynamic> json) {
        return DataToken(
            channel_name: json['channel_name'], 
            doc_id: json['doc_id'], 
            token: json['token'],
            doc_name: json['doc_name'],
            patient_name: json['patient_name'],
            minutes_left: json['minutes_left'],
            identifier: json['identifier'],
            patient_id: json['patient_id']
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['channel_name'] = this.channel_name;
        data['doc_id'] = this.doc_id;
        data['token'] = this.token;

        data['doc_name'] = this.doc_name;
        data['patient_name'] = this.patient_name;
        data['minutes_left'] = this.minutes_left;
        data['identifier'] = this.identifier;
        data['patient_id']= this.patient_id;
        return data;
    }
}