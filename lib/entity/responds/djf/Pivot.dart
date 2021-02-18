
class Pivot {
    int category_id;
    int private_product_id;

    Pivot({this.category_id, this.private_product_id});

    factory Pivot.fromJson(Map<String, dynamic> json) {
        return Pivot(
            category_id: json['category_id'], 
            private_product_id: json['private_product_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['category_id'] = this.category_id;
        data['private_product_id'] = this.private_product_id;
        return data;
    }
}