class PhamacyBase {
    Medication medication;
    String status;

    PhamacyBase({this.medication, this.status});

    factory PhamacyBase.fromJson(Map<String, dynamic> json) {
        return PhamacyBase(
            medication: json['medication'] != null ? Medication.fromJson(json['medication']) : null, 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['status'] = this.status;
        if (this.medication != null) {
            data['medication'] = this.medication.toJson();
        }
        return data;
    }
}

class Medication {
    int id;
    String medication;

    Medication({this.id, this.medication});

    factory Medication.fromJson(Map<String, dynamic> json) {
        return Medication(
            id: json['id'], 
            medication: json['medication'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['medication'] = this.medication;
        return data;
    }
}