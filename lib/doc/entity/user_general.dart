import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';



@Entity(tableName: "user_entity")
@JsonSerializable()
class UserGeneral {
    @PrimaryKey()
    String email;

    String address;
    String dob;

    String firstname;
    String lastname;
    String nationality;
    String profile_pic;
    String sex;
    String practice_no;
    String language;
    String qualification;
    String call_min;
    String video_min;

    String plan;

    UserGeneral({this.address, this.dob, this.email, this.firstname, this.lastname, this.nationality, this.profile_pic, this.sex,this.practice_no,this.language,this.qualification,this.call_min,this.video_min,this.plan});

    factory UserGeneral.fromJson(Map<String, dynamic> json) {
        return UserGeneral(
            address: json['address'], 
            dob: json['dob'], 
            email: json['email'], 
            firstname: json['firstname'], 
            lastname: json['lastname'], 
            nationality: json['nationality'],
            profile_pic: json['profile_pic'],
            sex: json['sex'],
            practice_no: json['practice_no'],
            language: json['language'],
            qualification: json['qualification'],


            call_min: json['call_min'],
            video_min: json['video_min'],
            plan: json['plan'],

        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['dob'] = this.dob;
        data['email'] = this.email;
        data['firstname'] = this.firstname;
        data['lastname'] = this.lastname;
        data['nationality'] = this.nationality;
        data['profile_pic'] = this.profile_pic;
        data['sex'] = this.sex;
        data['practice_no'] = this.practice_no;
        data['language'] = this.language;
        data['qualification'] = this.qualification;


        data['call_min'] = this.call_min;
        data['video_min'] = this.video_min;
        data['plan'] = this.plan;
        return data;
    }
}