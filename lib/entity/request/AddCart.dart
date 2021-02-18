
class AddCart {
    int product_id;
    int quantity;

    AddCart({this.product_id, this.quantity});

    factory AddCart.fromJson(Map<String, dynamic> json) {
        return AddCart(
            product_id: json['product_id'], 
            quantity: json['quantity'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['product_id'] = this.product_id;
        data['quantity'] = this.quantity;
        return data;
    }
}