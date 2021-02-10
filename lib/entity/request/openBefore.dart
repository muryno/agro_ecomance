

class openBefore {
    bool openned;

    openBefore({this.openned});

    factory openBefore.fromJson(Map<String, dynamic> json) {
        return openBefore(
            openned: json['openned'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['openned'] = this.openned;
        return data;
    }
}