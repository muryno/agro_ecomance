class PatientAppointmentRes {


    List<Appointment> appointment;
    String message;
    String status;

    PatientAppointmentRes({this.appointment, this.message,this.status});

    factory PatientAppointmentRes.fromJson(Map<String, dynamic> json) {
        return PatientAppointmentRes(
            appointment: json['appointment'] != null ? (json['appointment'] as List).map((i) => Appointment.fromJson(i)).toList() : null, 
            message: json['message'],
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status'] = this.status;
        if (this.appointment != null) {
            data['appointment'] = this.appointment.map((v) => v.toJson()).toList();
        }
        return data;
    }


}

class Appointment {
    int app_id;
    String appointment_date;
    int doctor_id;
    String firstname;
    int id;
    int app_type_id;
    String lastname;
    String name;
    String time;
    String complains;
    String professions;

    Appointment({this.app_id, this.appointment_date, this.doctor_id, this.firstname, this.id, this.lastname, this.name, this.time,this.app_type_id,this.complains,this.professions});

    factory Appointment.fromJson(Map<String, dynamic> json) {
        return Appointment(
            app_id: json['app_id'],
            appointment_date: json['appointment_date'],
            doctor_id: json['doctor_id'],
            firstname: json['firstname'],
            id: json['id'],
            lastname: json['lastname'],
            name: json['name'],
            time: json['time'],
            app_type_id: json['app_type_id'],
            complains: json['complains'],
            professions: json['professions'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['app_id'] = this.app_id;
        data['appointment_date'] = this.appointment_date;
        data['doctor_id'] = this.doctor_id;
        data['firstname'] = this.firstname;
        data['id'] = this.id;
        data['lastname'] = this.lastname;
        data['name'] = this.name;
        data['complains'] = this.complains;
        data['time'] = this.time;
        data['app_type_id'] = this.app_type_id;
        data['professions'] = this.professions;
        return data;
    }
}

