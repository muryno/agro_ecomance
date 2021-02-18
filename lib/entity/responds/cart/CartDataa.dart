
import 'Product.dart';

class CartDataa {
    String created_at;
    int food_mart_id;
    int id;
    int private_product_id;
    Product product;
    int quantity;
    String updated_at;
    String uuid;

    CartDataa({this.created_at, this.food_mart_id, this.id, this.private_product_id, this.product, this.quantity, this.updated_at, this.uuid});

    factory CartDataa.fromJson(Map<String, dynamic> json) {
        return CartDataa(
            created_at: json['created_at'], 
            food_mart_id: json['food_mart_id'], 
            id: json['id'], 
            private_product_id: json['private_product_id'], 
            product: json['product'] != null ? Product.fromJson(json['product']) : null, 
            quantity: json['quantity'], 
            updated_at: json['updated_at'], 
            uuid: json['uuid'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['food_mart_id'] = this.food_mart_id;
        data['id'] = this.id;
        data['private_product_id'] = this.private_product_id;
        data['quantity'] = this.quantity;
        data['updated_at'] = this.updated_at;
        data['uuid'] = this.uuid;
        if (this.product != null) {
            data['product'] = this.product.toJson();
        }
        return data;
    }
}