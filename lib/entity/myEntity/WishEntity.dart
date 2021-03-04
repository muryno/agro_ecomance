


import 'package:agro_ecomance/entity/responds/WishListBasketDetails.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "Wishe")
@JsonSerializable()
class Wishe {
    String created_at;
    int discounted_price;
    @primaryKey
    int id;
    int price;


    @ignore
    Product product;
    int product_id;
    int quantity;
    String updated_at;
    int user_id;
    String uuid;






    String thumbnail_url;

    String file_url;
    String name;

    int weight;

    Wishe({this.weight,this.name,this.price, this.id, this.thumbnail_url,this.file_url, this.created_at, this.discounted_price, this.id, this.price, this.product, this.product_id, this.quantity, this.updated_at, this.user_id, this.uuid});

    factory Wishe.fromJson(Map<String, dynamic> json) {
        return Wishe(
            created_at: json['created_at'],
            discounted_price: json['discounted_price'],
            id: json['id'],
            price: json['price'],
            product: json['product'] != null ? Product.fromJson(json['product']) : null,
            product_id: json['product_id'],
            quantity: json['quantity'],
            updated_at: json['updated_at'],
            user_id: json['user_id'],
            weight: json['weight'],
            uuid: json['uuid'],
            thumbnail_url: json['thumbnail_url'],
            name: json['name'],
            file_url: json['file_url'],

        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['discounted_price'] = this.discounted_price;
        data['id'] = this.id;
        data['price'] = this.price;
        data['product_id'] = this.product_id;
        data['quantity'] = this.quantity;
        data['file_url'] = this.file_url;
        data['updated_at'] = this.updated_at;
        data['user_id'] = this.user_id;
        data['uuid'] = this.uuid;
        data['name'] = this.name;

        data['weight'] = this.weight;

        data['thumbnail_url'] = this.thumbnail_url;
        if (this.product != null) {
            data['product'] = this.product.toJson();
        }
        return data;
    }
}