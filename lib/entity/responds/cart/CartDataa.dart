

import '../ProductResp.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:floor/floor.dart';


@Entity(tableName: "CartEntity")
@JsonSerializable()
class CartDataa {

    @PrimaryKey(autoGenerate: false)
    int id;

    String created_at;



    @ignore
    Product product;


    int product_id;
    int quantity;
    String updated_at;
    int user_id;
    String uuid;
    int weight;

    String img_url;
    String name;
    String price;



    CartDataa({this.name,this.price, this.img_url,this.created_at, this.id, this.product, this.product_id, this.quantity, this.updated_at, this.user_id, this.uuid, this.weight});

    factory CartDataa.fromJson(Map<String, dynamic> json) {
        return CartDataa(
            img_url: json['img_url'],
            created_at: json['created_at'],
            id: json['id'],
            product: json['product'] != null ? Product.fromJson(json['product']) : null,
            product_id: json['product_id'],
            quantity: json['quantity'],
            updated_at: json['updated_at'],
            user_id: json['user_id'],
            uuid: json['uuid'],
            weight: json['weight'],

            name: json['name'],
            price: json['price'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        //
        data['img_url'] = this.img_url;
        data['created_at'] = this.created_at;

        data['name'] = this.name;
        data['price'] = this.price;

        data['id'] = this.id;
        data['product_id'] = this.product_id;
        data['quantity'] = this.quantity;
        data['updated_at'] = this.updated_at;
        data['user_id'] = this.user_id;
        data['uuid'] = this.uuid;
        data['weight'] = this.weight;
        if (this.product != null) {
            data['product'] = this.product.toJson();
        }
        return data;
    }
}


class Product {
    int average_rating;
    List<Category> categories;
    String created_at;
    String description;
    int discount;
    bool featured;
    FeaturedImage featured_image;
    int featured_image_id;
    @primaryKey
    int id;
    List<Imagess> images;
    String name;
    int price;
    List<PriceDistribution> price_distribution;
    String sku;
    String slug;
    int status;
    String status_readable;
    int stock_status;
    String unit;
    String updated_at;
    String uuid;
    int views;
    String weight;

    Product({this.average_rating, this.categories, this.created_at, this.description, this.discount, this.featured, this.featured_image, this.featured_image_id, this.id, this.images, this.name, this.price, this.price_distribution, this.sku, this.slug, this.status, this.status_readable, this.stock_status, this.unit, this.updated_at, this.uuid, this.views, this.weight});

    factory Product.fromJson(Map<String, dynamic> json) {
        return Product(
            average_rating: json['average_rating'],
            categories: json['categories'] != null ? (json['categories'] as List).map((i) => Category.fromJson(i)).toList() : null,
            created_at: json['created_at'],
            description: json['description'],
            discount: json['discount'],
            featured: json['featured'],
            featured_image: json['featured_image'] != null ? FeaturedImage.fromJson(json['featured_image']) : null,
            featured_image_id: json['featured_image_id'],
            id: json['id'],
            images: json['images'] != null ? (json['images'] as List).map((i) => Imagess.fromJson(i)).toList() : null,
            name: json['name'],
            price: json['price'],
            price_distribution: json['price_distribution'] != null ? (json['price_distribution'] as List).map((i) => PriceDistribution.fromJson(i)).toList() : null,
            sku: json['sku'],
            slug: json['slug'],
            status: json['status'],
            status_readable: json['status_readable'],
            stock_status: json['stock_status'],
            unit: json['unit'],
            updated_at: json['updated_at'],
            uuid: json['uuid'],
            views: json['views'],
            weight: json['weight'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['average_rating'] = this.average_rating;
        data['created_at'] = this.created_at;
        data['description'] = this.description;
        data['discount'] = this.discount;
        data['featured'] = this.featured;
        data['featured_image_id'] = this.featured_image_id;
        data['id'] = this.id;
        data['name'] = this.name;
        data['price'] = this.price;
        data['sku'] = this.sku;
        data['slug'] = this.slug;
        data['status'] = this.status;
        data['status_readable'] = this.status_readable;
        data['stock_status'] = this.stock_status;
        data['unit'] = this.unit;
        data['updated_at'] = this.updated_at;
        data['uuid'] = this.uuid;
        data['views'] = this.views;
        data['weight'] = this.weight;
        if (this.categories != null) {
            data['categories'] = this.categories.map((v) => v.toJson()).toList();
        }
        if (this.featured_image != null) {
            data['featured_image'] = this.featured_image.toJson();
        }
        if (this.images != null) {
            data['images'] = this.images.map((v) => v.toJson()).toList();
        }
        if (this.price_distribution != null) {
            data['price_distribution'] = this.price_distribution.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Category {
    String created_at;
    String description;
    int id;
    int image_id;
    String max_amount;
    String min_amount;
    String name;
    PivotX pivot;
    String slug;
    int status;
    String type;
    String updated_at;
    String uuid;

    Category({this.created_at, this.description, this.id, this.image_id, this.max_amount, this.min_amount, this.name, this.pivot, this.slug, this.status, this.type, this.updated_at, this.uuid});

    factory Category.fromJson(Map<String, dynamic> json) {
        return Category(
            created_at: json['created_at'],
            description: json['description'],
            id: json['id'],
            image_id: json['image_id'],
            max_amount: json['max_amount'],
            min_amount: json['min_amount'],
            name: json['name'],
            pivot: json['pivot'] != null ? PivotX.fromJson(json['pivot']) : null,
            slug: json['slug'],
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
        data['image_id'] = this.image_id;
        data['max_amount'] = this.max_amount;
        data['min_amount'] = this.min_amount;
        data['name'] = this.name;
        data['slug'] = this.slug;
        data['status'] = this.status;
        data['type'] = this.type;
        data['updated_at'] = this.updated_at;
        data['uuid'] = this.uuid;
        if (this.pivot != null) {
            data['pivot'] = this.pivot.toJson();
        }
        return data;
    }
}

class FeaturedImage {
    int aggregator_id;
    String created_at;
    String description;
    String file_path;
    String file_url;
    String filename;
    int id;
    MetaDataX meta_data;
    String thumbnail_path;
    String thumbnail_url;
    String updated_at;
    String uuid;

    FeaturedImage({this.aggregator_id, this.created_at, this.description, this.file_path, this.file_url, this.filename, this.id, this.meta_data, this.thumbnail_path, this.thumbnail_url, this.updated_at, this.uuid});

    factory FeaturedImage.fromJson(Map<String, dynamic> json) {
        return FeaturedImage(
            aggregator_id: json['aggregator_id'],
            created_at: json['created_at'],
            description: json['description'],
            file_path: json['file_path'],
            file_url: json['file_url'],
            filename: json['filename'],
            id: json['id'],
            meta_data: json['meta_data'] != null ? MetaDataX.fromJson(json['meta_data']) : null,
            thumbnail_path: json['thumbnail_path'],
            thumbnail_url: json['thumbnail_url'],
            updated_at: json['updated_at'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['aggregator_id'] = this.aggregator_id;
        data['created_at'] = this.created_at;
        data['description'] = this.description;
        data['file_path'] = this.file_path;
        data['file_url'] = this.file_url;
        data['filename'] = this.filename;
        data['id'] = this.id;
        data['thumbnail_path'] = this.thumbnail_path;
        data['thumbnail_url'] = this.thumbnail_url;
        data['updated_at'] = this.updated_at;
        data['uuid'] = this.uuid;
        if (this.meta_data != null) {
            data['meta_data'] = this.meta_data.toJson();
        }
        return data;
    }
}

class PivotX {
    int category_id;
    int product_id;

    PivotX({this.category_id, this.product_id});

    factory PivotX.fromJson(Map<String, dynamic> json) {
        return PivotX(
            category_id: json['category_id'],
            product_id: json['product_id'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['category_id'] = this.category_id;
        data['product_id'] = this.product_id;
        return data;
    }
}

class Pivot {
    int image_id;
    int product_id;

    Pivot({this.image_id, this.product_id});

    factory Pivot.fromJson(Map<String, dynamic> json) {
        return Pivot(
            image_id: json['image_id'],
            product_id: json['product_id'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['image_id'] = this.image_id;
        data['product_id'] = this.product_id;
        return data;
    }
}



class Imagess {
    int aggregator_id;
    String created_at;
    String description;
    String file_path;
    String file_url;
    String filename;
    int id;
    MetaDataX meta_data;
    Pivot pivot;
    String thumbnail_path;
    String thumbnail_url;
    String updated_at;
    String uuid;

    Imagess({this.aggregator_id, this.created_at, this.description, this.file_path, this.file_url, this.filename, this.id, this.meta_data, this.pivot, this.thumbnail_path, this.thumbnail_url, this.updated_at, this.uuid});

    factory Imagess.fromJson(Map<String, dynamic> json) {
        return Imagess(
            aggregator_id: json['aggregator_id'],
            created_at: json['created_at'],
            description: json['description'],
            file_path: json['file_path'],
            file_url: json['file_url'],
            filename: json['filename'],
            id: json['id'],
            meta_data: json['meta_data'] != null ? MetaDataX.fromJson(json['meta_data']) : null,
            pivot: json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null,
            thumbnail_path: json['thumbnail_path'],
            thumbnail_url: json['thumbnail_url'],
            updated_at: json['updated_at'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['aggregator_id'] = this.aggregator_id;
        data['created_at'] = this.created_at;
        data['description'] = this.description;
        data['file_path'] = this.file_path;
        data['file_url'] = this.file_url;
        data['filename'] = this.filename;
        data['id'] = this.id;
        data['thumbnail_path'] = this.thumbnail_path;
        data['thumbnail_url'] = this.thumbnail_url;
        data['updated_at'] = this.updated_at;
        data['uuid'] = this.uuid;
        if (this.meta_data != null) {
            data['meta_data'] = this.meta_data.toJson();
        }
        if (this.pivot != null) {
            data['pivot'] = this.pivot.toJson();
        }
        return data;
    }
}



class MetaData {
    String name;
    String readable_size;
    int size;
    String type;

    MetaData({this.name, this.readable_size, this.size, this.type});

    factory MetaData.fromJson(Map<String, dynamic> json) {
        return MetaData(
            name: json['name'],
            readable_size: json['readable_size'],
            size: json['size'],
            type: json['type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        data['readable_size'] = this.readable_size;
        data['size'] = this.size;
        data['type'] = this.type;
        return data;
    }
}

class MetaDataX {
    String name;
    String readable_size;
    int size;
    String type;

    MetaDataX({this.name, this.readable_size, this.size, this.type});

    factory MetaDataX.fromJson(Map<String, dynamic> json) {
        return MetaDataX(
            name: json['name'],
            readable_size: json['readable_size'],
            size: json['size'],
            type: json['type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        data['readable_size'] = this.readable_size;
        data['size'] = this.size;
        data['type'] = this.type;
        return data;
    }
}