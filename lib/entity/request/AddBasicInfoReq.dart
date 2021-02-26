
class AddBasicInfoReq {
    String display_name;
    String email;
    String name;
    String phone;

    AddBasicInfoReq({this.display_name, this.email, this.name, this.phone});

    factory AddBasicInfoReq.fromJson(Map<String, dynamic> json) {
        return AddBasicInfoReq(
            display_name: json['display_name'], 
            email: json['email'], 
            name: json['name'], 
            phone: json['phone'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['display_name'] = this.display_name;
        data['email'] = this.email;
        data['name'] = this.name;
        data['phone'] = this.phone;
        return data;
    }
}