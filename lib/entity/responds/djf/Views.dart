
class Views {
    String created_at;
    int id;
    int private_product_id;
    String updated_at;
    String uuid;
    int views;

    Views({this.created_at, this.id, this.private_product_id, this.updated_at, this.uuid, this.views});

    factory Views.fromJson(Map<String, dynamic> json) {
        return Views(
            created_at: json['created_at'], 
            id: json['id'], 
            private_product_id: json['private_product_id'], 
            updated_at: json['updated_at'], 
            uuid: json['uuid'], 
            views: json['views'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['id'] = this.id;
        data['private_product_id'] = this.private_product_id;
        data['updated_at'] = this.updated_at;
        data['uuid'] = this.uuid;
        data['views'] = this.views;
        return data;
    }
}