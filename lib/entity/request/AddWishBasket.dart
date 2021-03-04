
class AddWishBasket {
    int product_id;
    int quantity;
    int weight;

    AddWishBasket({this.product_id, this.quantity, this.weight});

    factory AddWishBasket.fromJson(Map<String, dynamic> json) {
        return AddWishBasket(
            product_id: json['product_id'], 
            quantity: json['quantity'], 
            weight: json['weight'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['product_id'] = this.product_id;
        data['quantity'] = this.quantity;
        data['weight'] = this.weight;
        return data;
    }
}