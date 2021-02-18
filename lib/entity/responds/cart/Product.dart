
import '../ProductResp.dart';

class Product {
    int aggregator_id;
    String created_at;
    String description;
    Dimensions dimensions;
    String discount;
    int featured_image;
    int id;
    String name;
    String price;
    String sku;
    int status;
    int stock_quantity;
    int stock_status;
    String unit;
    String updated_at;
    String uuid;

    Product({this.aggregator_id, this.created_at, this.description, this.dimensions, this.discount, this.featured_image, this.id, this.name, this.price, this.sku, this.status, this.stock_quantity, this.stock_status, this.unit, this.updated_at, this.uuid});

    factory Product.fromJson(Map<String, dynamic> json) {
        return Product(
            aggregator_id: json['aggregator_id'], 
            created_at: json['created_at'], 
            description: json['description'], 
            dimensions: json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null, 
            discount: json['discount'], 
            featured_image: json['featured_image'], 
            id: json['id'], 
            name: json['name'], 
            price: json['price'], 
            sku: json['sku'], 
            status: json['status'], 
            stock_quantity: json['stock_quantity'], 
            stock_status: json['stock_status'], 
            unit: json['unit'], 
            updated_at: json['updated_at'], 
            uuid: json['uuid'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['aggregator_id'] = this.aggregator_id;
        data['created_at'] = this.created_at;
        data['description'] = this.description;
        data['discount'] = this.discount;
        data['featured_image'] = this.featured_image;
        data['id'] = this.id;
        data['name'] = this.name;
        data['price'] = this.price;
        data['sku'] = this.sku;
        data['status'] = this.status;
        data['stock_quantity'] = this.stock_quantity;
        data['stock_status'] = this.stock_status;
        data['unit'] = this.unit;
        data['updated_at'] = this.updated_at;
        data['uuid'] = this.uuid;
        if (this.dimensions != null) {
            data['dimensions'] = this.dimensions.toJson();
        }
        return data;
    }
}