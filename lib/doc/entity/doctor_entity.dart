

class ChatRequest {
    List<Doctor> data;
    String message;
    String status;

    ChatRequest({this.data, this.message,this.status});

    factory ChatRequest.fromJson(Map<String, dynamic> json) {
        return ChatRequest(
            data: json['data'] != null ? (json['data'] as List).map((i) => Doctor.fromJson(i)).toList() : null,
            message: json['message'],
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status'] = this.status;
        if (this.data != null) {
            data['data'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }

}

class Doctor {
    String firstname;
    int id;
    String lastname;


    Doctor({this.firstname, this.id, this.lastname});

    factory Doctor.fromJson(Map<String, dynamic> json) {
        return Doctor(
            firstname: json['firstname'], 
            id: json['id'], 
            lastname: json['lastname'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['firstname'] = this.firstname;
        data['id'] = this.id;
        data['lastname'] = this.lastname;
        return data;
    }

    @override
  String toString() {
    return firstname + " " + lastname;
  }
}