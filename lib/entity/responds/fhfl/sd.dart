package entity.responds.fhfl

class sd {
    Datas datas;

    sd({this.datas});

    factory sd.fromJson(Map<String, dynamic> json) {
        return sd(
            datas: json['datas'] != null ? Datas.fromJson(json['datas']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.datas != null) {
            data['datas'] = this.datas.toJson();
        }
        return data;
    }
}