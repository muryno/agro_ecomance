

class PurchaseRespd {
    List<PurchaseRespData> data;

    PurchaseRespd({this.data});

    factory PurchaseRespd.fromJson(Map<String, dynamic> json) {
        return PurchaseRespd(
            data: json['data'] != null ? (json['data'] as List).map((i) => PurchaseRespData.fromJson(i)).toList() : null,
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

class PurchaseRespData {
    String created_at;
    int delivered_at;
    bool delivery;
    int delivery_fee;
    Distributor distributor;
    int distributor_id;
    int flagged_at;
    int id;
    int in_transit_at;
    List<Item> items;
    int payment;
    String payment_readable;
    String payment_type;
    int pended_at;
    bool pickup;
    PickupAddresss pickup_address;
    int processed_at;
    String promo_code;
    String promo_type;
    int promo_value;
    int rejected_at;
    int status;
    String status_readable;
    int total_price;
    String updated_at;
    int user_id;
    String uuid;

    PurchaseRespData({this.created_at, this.delivered_at, this.delivery, this.delivery_fee, this.distributor, this.distributor_id, this.flagged_at, this.id, this.in_transit_at, this.items, this.payment, this.payment_readable, this.payment_type, this.pended_at, this.pickup, this.pickup_address, this.processed_at, this.promo_code, this.promo_type, this.promo_value, this.rejected_at, this.status, this.status_readable, this.total_price, this.updated_at, this.user_id, this.uuid});

    factory PurchaseRespData.fromJson(Map<String, dynamic> json) {
        return PurchaseRespData(
            created_at: json['created_at'],
            delivered_at: json['delivered_at'],
            delivery: json['delivery'],
            delivery_fee: json['delivery_fee'],
            distributor: json['distributor'] != null ? Distributor.fromJson(json['distributor']) : null,
            distributor_id: json['distributor_id'],
            flagged_at: json['flagged_at'],
            id: json['id'],
            in_transit_at: json['in_transit_at'],
            items: json['items'] != null ? (json['items'] as List).map((i) => Item.fromJson(i)).toList() : null,
            payment: json['payment'],
            payment_readable: json['payment_readable'],
            payment_type: json['payment_type'],
            pended_at: json['pended_at'],
            pickup: json['pickup'],
            // pickup_address: json['pickup_address'] != null ? PickupAddresss.fromJson(json['pickup_address']) : null,
            processed_at: json['processed_at'],
            promo_code: json['promo_code'],
            promo_type: json['promo_type'],
            promo_value: json['promo_value'],
            rejected_at: json['rejected_at'],
            status: json['status'],
            status_readable: json['status_readable'],
            total_price: json['total_price'],
            updated_at: json['updated_at'],
            user_id: json['user_id'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['delivered_at'] = this.delivered_at;
        data['delivery'] = this.delivery;
        data['delivery_fee'] = this.delivery_fee;
        data['distributor_id'] = this.distributor_id;
        data['flagged_at'] = this.flagged_at;
        data['id'] = this.id;
        data['in_transit_at'] = this.in_transit_at;
        data['payment'] = this.payment;
        data['payment_readable'] = this.payment_readable;
        data['payment_type'] = this.payment_type;
        data['pended_at'] = this.pended_at;
        data['pickup'] = this.pickup;
        data['processed_at'] = this.processed_at;
        data['promo_code'] = this.promo_code;
        data['promo_type'] = this.promo_type;
        data['promo_value'] = this.promo_value;
        data['rejected_at'] = this.rejected_at;
        data['status'] = this.status;
        data['status_readable'] = this.status_readable;
        data['total_price'] = this.total_price;
        data['updated_at'] = this.updated_at;
        data['user_id'] = this.user_id;
        data['uuid'] = this.uuid;

        if (this.distributor != null) {
            data['distributor'] = this.distributor.toJson();
        }
        if (this.items != null) {
            data['items'] = this.items.map((v) => v.toJson()).toList();
        }
        // if (this.pickup_address != null) {
        //     data['pickup_address'] = this.pickup_address.toJson();
        // }
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


class Item {
    String created_at;
    int delivered_at;
    int discount;
    DistributorX distributor;
    int distributor_id;
    int flagged_at;
    int id;
    int in_transit_at;
    int order_id;
    int pended_at;
    int price;
    int processed_at;
    Product product;
    int product_id;
    int quantity;
    int rejected_at;
    int status;
    String status_readable;
    String unit;
    String updated_at;
    String uuid;
    int weight;

    Item({this.created_at, this.delivered_at, this.discount, this.distributor, this.distributor_id, this.flagged_at, this.id, this.in_transit_at, this.order_id, this.pended_at, this.price, this.processed_at, this.product, this.product_id, this.quantity, this.rejected_at, this.status, this.status_readable, this.unit, this.updated_at, this.uuid, this.weight});

    factory Item.fromJson(Map<String, dynamic> json) {
        return Item(
            created_at: json['created_at'],
            delivered_at: json['delivered_at'],
            discount: json['discount'],
            distributor: json['distributor'] != null ? DistributorX.fromJson(json['distributor']) : null,
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
            uuid: json['uuid'],
            weight: json['weight'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['delivered_at'] = this.delivered_at;
        data['discount'] = this.discount;
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
        if (this.distributor != null) {
            data['distributor'] = this.distributor.toJson();
        }
        if (this.product != null) {
            data['product'] = this.product.toJson();
        }

        return data;
    }
}


class PurchaseImages {
    String aggregator_id;
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

    PurchaseImages({this.aggregator_id, this.created_at, this.description, this.file_path, this.file_url, this.filename, this.id, this.meta_data, this.pivot, this.thumbnail_path, this.thumbnail_url, this.updated_at, this.uuid});

    factory PurchaseImages.fromJson(Map<String, dynamic> json) {
        return PurchaseImages(
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


class FeaturedImage {
    int aggregator_id;
    String created_at;
    String description;
    String file_path;
    String file_url;
    String filename;
    int id;
    MetaData meta_data;
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
            meta_data: json['meta_data'] != null ? MetaData.fromJson(json['meta_data']) : null,
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

class DistributorX {
    String first_name;
    String last_name;
    String uuid;

    DistributorX({this.first_name, this.last_name, this.uuid});

    factory DistributorX.fromJson(Map<String, dynamic> json) {
        return DistributorX(
            first_name: json['first_name'],
            last_name: json['last_name'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['first_name'] = this.first_name;
        data['last_name'] = this.last_name;
        data['uuid'] = this.uuid;
        return data;
    }
}

class Distributor {
    String email;
    String first_name;
    String last_name;
    String phone;

    Distributor({this.email, this.first_name, this.last_name, this.phone});

    factory Distributor.fromJson(Map<String, dynamic> json) {
        return Distributor(
            email: json['email'],
            first_name: json['first_name'],
            last_name: json['last_name'],
            phone: json['phone'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['first_name'] = this.first_name;
        data['last_name'] = this.last_name;
        data['phone'] = this.phone;
        return data;
    }
}

class Category {
    String created_at;
    String deleted_at;
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

    Category({this.created_at, this.deleted_at, this.description, this.id, this.image_id, this.max_amount, this.min_amount, this.name, this.pivot, this.slug, this.status, this.type, this.updated_at, this.uuid});

    factory Category.fromJson(Map<String, dynamic> json) {
        return Category(
            created_at: json['created_at'],
            deleted_at: json['deleted_at'],
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
        data['deleted_at'] = this.deleted_at;
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

class PickupAddresss {
    String address;
    String city;
    String lat;
    String lga;
    String long;
    String state;

    PickupAddresss({this.address, this.city, this.lat, this.lga, this.long, this.state});

    factory PickupAddresss.fromJson(Map<String, dynamic> json) {
        return PickupAddresss(
            address: json['address'],
            city: json['city'],
            lat: json['lat'],
            lga: json['lga'],
            long: json['long'],
            state: json['state'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['city'] = this.city;
        data['lat'] = this.lat;
        data['lga'] = this.lga;
        data['long'] = this.long;
        data['state'] = this.state;
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
class PriceDistribution {
    var discount;
    var price;
    var profit;
    var unit;
    var weight;

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

class Product {
    int average_rating;
    List<Category> categories;
    String created_at;
    String description;
    int discount;
    bool featured;
    FeaturedImage featured_image;
    int featured_image_id;
    int id;
    List<PurchaseImages> images;
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
            images: json['images'] != null ? (json['images'] as List).map((i) => PurchaseImages.fromJson(i)).toList() : null,
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
