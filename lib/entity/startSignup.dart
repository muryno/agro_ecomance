


//{
//     "data": {
//         "type": "food_marts",
//         "first_name": "HB",
//         "last_name": "Foods",
//         "phone": "08695544455"
//     },
//     "status_code": 200
// }
class startSignup {
    Dataa dataa;
    int status_code;
    String message;


    startSignup({this.dataa, this.status_code,this.message});

    factory startSignup.fromJson(Map<String, dynamic> json) {
        return startSignup(
            dataa: json['data'] != null ? Dataa.fromJson(json['data']) : null,
            status_code: json['status_code'],
            message: json['message'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['status_code'] = this.status_code;
        data['message'] = this.message;

        if (this.dataa != null) {
            data['data'] = this.dataa.toJson();
        }
        return data;
    }
}

class Dataa {


    String first_name;
    String last_name;
    String phone;
    String type;

    Dataa({this.first_name, this.last_name, this.phone, this.type});

    factory Dataa.fromJson(Map<String, dynamic> json) {
        return Dataa(
            first_name: json['first_name'],
            last_name: json['last_name'],
            phone: json['phone'],
            type: json['type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['first_name'] = this.first_name;
        data['last_name'] = this.last_name;
        data['phone'] = this.phone;
        data['type'] = this.type;
        return data;
    }
}