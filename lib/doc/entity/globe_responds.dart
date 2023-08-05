
class GlobeResponds {



    final String msg;
    final  bool status;


    GlobeResponds(this.status,this.msg);

    factory GlobeResponds.fromJson(Map<String, dynamic> json){

        return GlobeResponds(
            json['msg'] as bool,
            json['status'] as String,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['msg'] = this.msg;
        data['status'] = this.status;

        return data;

    }
}