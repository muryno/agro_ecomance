


import 'package:json_annotation/json_annotation.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "CartEntity")
@JsonSerializable()
class CartEntity {
    @primaryKey
    int id;

    int product_id;
    int quantity;
    int status;
    int user_id;
    String uuid;
    int weight;


    int price;
    String thumbnail_url;
    int discount;
    String file_url;


    CartEntity({this.price, this.id, this.thumbnail_url, this.product_id, this.quantity, this.discount, this.user_id, this.uuid, this.weight,this.file_url,this.status});

    factory CartEntity.fromJson(Map<String, dynamic> json) {
        return CartEntity(
            price: json['price'],
            id: json['id'],
            thumbnail_url: json['thumbnail_url'],
            quantity: json['quantity'],
            discount: json['discount'],
            user_id: json['user_id'],
            uuid: json['uuid'],
            weight: json['weight'],

            product_id: json['product_id'],
            status: json['status'],
            file_url: json['file_url'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['price'] = this.price;
        data['id'] = this.id;
        data['product_id'] = this.product_id;
        data['quantity'] = this.quantity;
        data['file_url'] = this.file_url;
        data['user_id'] = this.user_id;
        data['uuid'] = this.uuid;
        data['weight'] = this.weight;

        data['status'] = this.status;

        data['thumbnail_url'] = this.thumbnail_url;
        data['discount'] = this.discount;
        return data;
    }
}

