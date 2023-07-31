class DoctorAppointment {
    String appointment_date;
    String complaint;
    String firstname;
    String lastname;
    String time;

    DoctorAppointment({this.appointment_date, this.complaint, this.firstname, this.lastname, this.time});

    factory DoctorAppointment.fromJson(Map<String, dynamic> json) {
        return DoctorAppointment(
            appointment_date: json['appointment_date'], 
            complaint: json['complaint'], 
            firstname: json['firstname'], 
            lastname: json['lastname'], 
            time: json['time'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['appointment_date'] = this.appointment_date;
        data['complaint'] = this.complaint;
        data['firstname'] = this.firstname;
        data['lastname'] = this.lastname;
        data['time'] = this.time;
        return data;
    }
}