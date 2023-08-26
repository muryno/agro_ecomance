class ReviewResponds {
    int consultation_id;
    String status;

    ReviewResponds({this.consultation_id, this.status});

    factory ReviewResponds.fromJson(Map<String, dynamic> json) {
        return ReviewResponds(
            consultation_id: json['consultation_id'], 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['consultation_id'] = this.consultation_id;
        data['status'] = this.status;
        return data;
    }
}