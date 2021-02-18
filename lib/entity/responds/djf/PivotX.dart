
class PivotX {
    int image_id;
    int private_product_id;

    PivotX({this.image_id, this.private_product_id});

    factory PivotX.fromJson(Map<String, dynamic> json) {
        return PivotX(
            image_id: json['image_id'], 
            private_product_id: json['private_product_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['image_id'] = this.image_id;
        data['private_product_id'] = this.private_product_id;
        return data;
    }
}