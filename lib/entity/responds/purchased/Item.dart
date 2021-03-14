
import 'package:agro_ecomance/entity/responds/NetworkResp.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';

class Item {
    String created_at;
    String delivered_at;
    int discount;
    String distributor;
    int distributor_id;
    String flagged_at;
    int id;
    String in_transit_at;
    int order_id;
    int pended_at;
    int price;
    String processed_at;
    Product product;
    int product_id;
    int quantity;
    String rejected_at;
    int status;
    String status_readable;
    String unit;
    String updated_at;
    User user;
    String uuid;
    int weight;

    Item({this.created_at, this.delivered_at, this.discount, this.distributor, this.distributor_id, this.flagged_at, this.id, this.in_transit_at, this.order_id, this.pended_at, this.price, this.processed_at, this.product, this.product_id, this.quantity, this.rejected_at, this.status, this.status_readable, this.unit, this.updated_at, this.user, this.uuid, this.weight});

    factory Item.fromJson(Map<String, dynamic> json) {
        return Item(
            created_at: json['created_at'], 
            delivered_at: json['delivered_at'], 
            discount: json['discount'], 
            distributor: json['distributor'], 
            distributor_id: json['distributor_id'], 
            flagged_at: json['flagged_at'], 
            id: json['id'], 
            in_transit_at: json['in_transit_at'], 
            order_id: json['order_id'], 
            pended_at: json['pended_at'], 
            price: json['price'], 
            processed_at: json['processed_at'], 
            product: json['product'] != null ? Product.fromJson(json['product']) : null, 
            product_id: json['product_id'], 
            quantity: json['quantity'], 
            rejected_at: json['rejected_at'], 
            status: json['status'], 
            status_readable: json['status_readable'], 
            unit: json['unit'], 
            updated_at: json['updated_at'], 
            user: json['user'] != null ? User.fromJson(json['user']) : null, 
            uuid: json['uuid'], 
            weight: json['weight'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['delivered_at'] = this.delivered_at;
        data['discount'] = this.discount;
        data['distributor'] = this.distributor;
        data['distributor_id'] = this.distributor_id;
        data['flagged_at'] = this.flagged_at;
        data['id'] = this.id;
        data['in_transit_at'] = this.in_transit_at;
        data['order_id'] = this.order_id;
        data['pended_at'] = this.pended_at;
        data['price'] = this.price;
        data['processed_at'] = this.processed_at;
        data['product_id'] = this.product_id;
        data['quantity'] = this.quantity;
        data['rejected_at'] = this.rejected_at;
        data['status'] = this.status;
        data['status_readable'] = this.status_readable;
        data['unit'] = this.unit;
        data['updated_at'] = this.updated_at;
        data['uuid'] = this.uuid;
        data['weight'] = this.weight;
        if (this.product != null) {
            data['product'] = this.product.toJson();
        }
        if (this.user != null) {
            data['user'] = this.user.toJson();
        }
        return data;
    }
}