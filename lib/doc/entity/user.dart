class user {
    int code;
    String email;
    String message;
    String mobile;
    int role;
    String status;
    String token;
    int user_id;

    String plan;
    int video_min;
    int call_min;
    int appointment;




    user({this.code, this.email, this.message, this.mobile, this.role, this.status, this.token, this.user_id,this.plan,this.appointment,this.call_min,this.video_min});

    factory user.fromJson(Map<String, dynamic> json) {
        return user(
            code: json['code'], 
            email: json['email'], 
            message: json['message'], 
            mobile: json['mobile'], 
            role: json['role'], 
            status: json['status'], 
            token: json['token'], 
            user_id: json['user_id'],

            plan: json['plan'],
            video_min: json['video_min'],
            call_min: json['call_min'],
            appointment: json['appointment'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        data['email'] = this.email;
        data['message'] = this.message;
        data['mobile'] = this.mobile;
        data['role'] = this.role;
        data['status'] = this.status;
        data['token'] = this.token;
        data['user_id'] = this.user_id;


        data['plan'] = this.plan;
        data['video_min'] = this.video_min;
        data['call_min'] = this.call_min;
        data['appointment'] = this.appointment;
        return data;
    }
}