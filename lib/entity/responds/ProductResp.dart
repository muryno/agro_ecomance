

import 'dart:ui';

import 'djf/FeaturedImage.dart';
import 'djf/Image.dart';
import 'djf/Pivot.dart';
import 'djf/Views.dart';

class ProductResp {
    List<ProductRespData> data;

    ProductResp({this.data});

    factory ProductResp.fromJson(Map<String, dynamic> json) {
        return ProductResp(
            data: json['data'] != null ? (json['data'] as List).map((i) => ProductRespData.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.data != null) {
            data['data'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}



class ProductRespData {
    Aggregator aggregator;
    int aggregator_id;
    List<Category> categories;
    String created_at;
    String description;
    Dimensions dimensions;
    String discount;
    FeaturedImage featured_image;
    int featured_image_id;
    int id;
    List<Images> images;
    String name;
    String price;
    String sku;
    int status;
    String status_readable;
    var stock_quantity;
    int stock_status;
    String stock_status_readable;
    String unit;
    String updated_at;
    String uuid;
    Views views;

    ProductRespData({this.aggregator, this.aggregator_id, this.categories, this.created_at, this.description, this.dimensions, this.discount, this.featured_image, this.featured_image_id, this.id, this.images, this.name, this.price, this.sku, this.status, this.status_readable, this.stock_quantity, this.stock_status, this.stock_status_readable, this.unit, this.updated_at, this.uuid, this.views});

    factory ProductRespData.fromJson(Map<String, dynamic> json) {
        return ProductRespData(
            aggregator: json['aggregator'] != null ? Aggregator.fromJson(json['aggregator']) : null,
            aggregator_id: json['aggregator_id'],
            categories: json['categories'] != null ? (json['categories'] as List).map((i) => Category.fromJson(i)).toList() : null,
            created_at: json['created_at'],
            description: json['description'],
            dimensions: json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null,
            discount: json['discount'],
            featured_image: json['featured_image'] != null ? FeaturedImage?.fromJson(json['featured_image']) : null,
            featured_image_id: json['featured_image_id'] ,
            id: json['id'],
            images: json['images'] != null ? (json['images'] as List).map((i) => Images.fromJson(i)).toList() : null,
            name: json['name'],
            price: json['price'],
            sku: json['sku'],
            status: json['status'],
            status_readable: json['status_readable'],
            stock_quantity: json['stock_quantity'] ,
            stock_status: json['stock_status'],
            stock_status_readable: json['stock_status_readable'],
            unit: json['unit'],
            updated_at: json['updated_at'],
            uuid: json['uuid'],
            views: json['views'] != null ? Views.fromJson(json['views']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['aggregator_id'] = this.aggregator_id;
        data['created_at'] = this.created_at;
        data['description'] = this.description;
        data['discount'] = this.discount;
        data['id'] = this.id;
        data['name'] = this.name;
        data['price'] = this.price;
        data['sku'] = this.sku;
        data['status'] = this.status;
        data['status_readable'] = this.status_readable;
        data['stock_status'] = this.stock_status;
        data['stock_status_readable'] = this.stock_status_readable;
        data['unit'] = this.unit;
        data['updated_at'] = this.updated_at;
        data['uuid'] = this.uuid;
        if (this.aggregator != null) {
            data['aggregator'] = this.aggregator.toJson();
        }
        if (this.categories != null) {
            data['categories'] = this.categories.map((v) => v.toJson()).toList();
        }
        if (this.dimensions != null) {
            data['dimensions'] = this.dimensions.toJson();
        }
        if (this.featured_image != null) {
            data['featured_image'] = this.featured_image.toJson();
        }
        if (this.featured_image_id != null) {
            data['featured_image_id'] = this.featured_image_id;
        }
        if (this.images != null) {
            data['images'] = this.images.map((v) => v.toJson()).toList();
        }
        if (this.stock_quantity != null) {
            data['stock_quantity'] = this.stock_quantity.toJson();
        }
        if (this.views != null) {
            data['views'] = this.views.toJson();
        }
        return data;
    }
}


class Aggregator {
    String display_name;
    String first_name;
    int id;
    String last_name;
    String uuid;

    Aggregator({this.display_name, this.first_name, this.id, this.last_name, this.uuid});

    factory Aggregator.fromJson(Map<String, dynamic> json) {
        return Aggregator(
            display_name: json['display_name'],
            first_name: json['first_name'],
            id: json['id'],
            last_name: json['last_name'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['display_name'] = this.display_name;
        data['first_name'] = this.first_name;
        data['id'] = this.id;
        data['last_name'] = this.last_name;
        data['uuid'] = this.uuid;
        return data;
    }
}


class Category {
    String created_at;
    var deleted_at;
    String description;
    int id;
    var image_id;
    String name;
    Pivot pivot;
    int status;
    String type;
    String updated_at;
    String uuid;

    Category(
        {this.created_at, this.deleted_at, this.description, this.id, this.image_id, this.name, this.pivot, this.status, this.type, this.updated_at, this.uuid});

    factory Category.fromJson(Map<String, dynamic> json) {
        return Category(
            created_at: json['created_at'],
            deleted_at: json['deleted_at'] ,
            description: json['description'],
            id: json['id'],
            image_id: json['image_id'] ,
            name: json['name'],
            pivot: json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null,
            status: json['status'],
            type: json['type'],
            updated_at: json['updated_at'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['description'] = this.description;
        data['id'] = this.id;
        data['name'] = this.name;
        data['status'] = this.status;
        data['type'] = this.type;
        data['updated_at'] = this.updated_at;
        data['uuid'] = this.uuid;
        if (this.deleted_at != null) {
            data['deleted_at'] = this.deleted_at.toJson();
        }
        if (this.image_id != null) {
            data['image_id'] = this.image_id.toJson();
        }
        if (this.pivot != null) {
            data['pivot'] = this.pivot.toJson();
        }
        return data;
    }
}

class Dimensions {
    int height;
    double length;
    int width;

    Dimensions({this.height, this.length, this.width});

    factory Dimensions.fromJson(Map<String, dynamic> json) {
        return Dimensions(
            height: json['height'],
            length: json['length'],
            width: json['width'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['height'] = this.height;
        data['length'] = this.length;
        data['width'] = this.width;
        return data;
    }
}