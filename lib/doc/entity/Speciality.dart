

class Speciality {
    String specialty;
    int id;

    Speciality({this.specialty, this.id});

    factory Speciality.fromJson(Map<String, dynamic> json) {
        return Speciality(
            specialty: json['specialty'],
            id: json['id'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['specialty'] = this.specialty;
        data['id'] = this.id;
        return data;
    }
}