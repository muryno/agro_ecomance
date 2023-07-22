class ChatBase {
    ChatPayload chatPayload;
    String message;
    bool success;

    ChatBase({this.chatPayload , this.message, this.success});

    factory ChatBase.fromJson(Map<String, dynamic> json) {
        return ChatBase(
            chatPayload: json['data'] != null ? ChatPayload.fromJson(json['data']) : null,

            message: json['message'], 
            success: json['success'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['success'] = this.success;
        if (this.chatPayload != null) {
            data['data'] = this.chatPayload.toJson();
        }
        return data;
    }
}

class ChatPayload {
    DoctorChat doctor;
    Patient patient;
    String room_name;
    int identifier;
    ChatPayload({this.doctor, this.patient, this.room_name,this.identifier});

    factory ChatPayload.fromJson(Map<String, dynamic> json) {
        return ChatPayload(
            doctor: json['doctor'] != null ? DoctorChat.fromJson(json['doctor']) : null,
            patient: json['patient'] != null ? Patient.fromJson(json['patient']) : null, 
            room_name: json['room_name'],
            identifier: json['identifier'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['identifier'] = this.identifier;
        data['room_name'] = this.room_name;
        if (this.doctor != null) {
            data['doctor'] = this.doctor.toJson();
        }
        if (this.patient != null) {
            data['patient'] = this.patient.toJson();
        }
        return data;
    }
}

class Patient {
    String email;
    int id;
    String name;

    Patient({this.email, this.id, this.name});

    factory Patient.fromJson(Map<String, dynamic> json) {
        return Patient(
            email: json['email'], 
            id: json['id'], 
            name: json['name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['id'] = this.id;
        data['name'] = this.name;
        return data;
    }
}

class DoctorChat {
    String email;
    int id;
    String name;

    DoctorChat({this.email, this.id, this.name});

    factory DoctorChat.fromJson(Map<String, dynamic> json) {
        return DoctorChat(
            email: json['email'], 
            id: json['id'], 
            name: json['name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['id'] = this.id;
        data['name'] = this.name;
        return data;
    }
}