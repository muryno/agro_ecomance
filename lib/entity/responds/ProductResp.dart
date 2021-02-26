

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
    int average_rating;
    List<Category> categories;
    String created_at;
    String description;
    int discount;
    bool featured;
    FeaturedImage featured_image;
    int featured_image_id;
    int id;
    List<ImageData> images;
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

    ProductRespData({this.average_rating, this.categories, this.created_at, this.description, this.discount, this.featured, this.featured_image, this.featured_image_id, this.id, this.images, this.name, this.price, this.price_distribution, this.sku, this.slug, this.status, this.status_readable, this.stock_status, this.unit, this.updated_at, this.uuid, this.views, this.weight});

    factory ProductRespData.fromJson(Map<String, dynamic> json) {
        return ProductRespData(
            average_rating: json['average_rating'],
            categories: json['categories'] != null ? (json['categories'] as List).map((i) => Category.fromJson(i)).toList() : null,
            created_at: json['created_at'],
            description: json['description'],
            discount: json['discount'],
            featured: json['featured'],
            featured_image: json['featured_image'] != null ? FeaturedImage.fromJson(json['featured_image']) : null,
            featured_image_id: json['featured_image_id'],
            id: json['id'],
            images: json['images'] != null ? (json['images'] as List).map((i) => ImageData.fromJson(i)).toList() : null,
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

class FeaturedImage {
    String aggregator_id;
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

class Aggregator {
    var display_name;
    var first_name;
    var id;
    var last_name;
    var uuid;

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
    String description;
    int id;
    int image_id;
    String max_amount;
    String min_amount;
    String name;
    Pivot pivot;
    String slug;
    int status;
    String type;
    String uuid;

    Category({this.description, this.id, this.image_id, this.max_amount, this.min_amount, this.name, this.pivot, this.slug, this.status, this.type, this.uuid});

    factory Category.fromJson(Map<String, dynamic> json) {
        return Category(
            description: json['description'],
            id: json['id'],
            image_id: json['image_id'],
            max_amount: json['max_amount'],
            min_amount: json['min_amount'],
            name: json['name'],
            pivot: json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null,
            slug: json['slug'],
            status: json['status'],
            type: json['type'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['description'] = this.description;
        data['id'] = this.id;
        data['image_id'] = this.image_id;
        data['max_amount'] = this.max_amount;
        data['min_amount'] = this.min_amount;
        data['name'] = this.name;
        data['slug'] = this.slug;
        data['status'] = this.status;
        data['type'] = this.type;
        data['uuid'] = this.uuid;
        if (this.pivot != null) {
            data['pivot'] = this.pivot.toJson();
        }
        return data;
    }
}




class Pivot {
    int category_id;
    int product_id;

    Pivot({this.category_id, this.product_id});

    factory Pivot.fromJson(Map<String, dynamic> json) {
        return Pivot(
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

class PriceDistribution {
    int discount;
    int price;
    int profit;
    String unit;
    int weight;

    PriceDistribution({this.discount, this.price, this.profit, this.unit, this.weight});

    factory PriceDistribution.fromJson(Map<String, dynamic> json) {
        return PriceDistribution(
            discount: json['discount'],
            price: json['price'],
            profit: json['profit'],
            unit: json['unit'],
            weight: json['weight'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['discount'] = this.discount;
        data['price'] = this.price;
        data['profit'] = this.profit;
        data['unit'] = this.unit;
        data['weight'] = this.weight;
        return data;
    }
}

class ImageData {
    String aggregator_id;
    String created_at;
    String description;
    String file_path;
    String file_url;
    String filename;
    int id;
    MetaDataX meta_data;
    PivotX pivot;
    String thumbnail_path;
    String thumbnail_url;
    String updated_at;
    String uuid;

    ImageData({this.aggregator_id, this.created_at, this.description, this.file_path, this.file_url, this.filename, this.id, this.meta_data, this.pivot, this.thumbnail_path, this.thumbnail_url, this.updated_at, this.uuid});

    factory ImageData.fromJson(Map<String, dynamic> json) {
        return ImageData(
            aggregator_id: json['aggregator_id'],
            created_at: json['created_at'],
            description: json['description'],
            file_path: json['file_path'],
            file_url: json['file_url'],
            filename: json['filename'],
            id: json['id'],
            meta_data: json['meta_data'] != null ? MetaDataX.fromJson(json['meta_data']) : null,
            pivot: json['pivot'] != null ? PivotX.fromJson(json['pivot']) : null,
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

class PivotX {
    int image_id;
    int product_id;

    PivotX({this.image_id, this.product_id});

    factory PivotX.fromJson(Map<String, dynamic> json) {
        return PivotX(
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



class Dimensions {
    var height;
    var length;
    var width;

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