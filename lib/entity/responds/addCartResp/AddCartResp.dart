
class AddCartResp {
    List<AddCartData> data;

    AddCartResp({this.data});

    factory AddCartResp.fromJson(Map<String, dynamic> json) {
        return AddCartResp(
            data: json['data'] != null ? (json['data'] as List).map((i) => AddCartData.fromJson(i)).toList() : null,
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


class AddCartData {
    int id;
    Product product;
    var product_id;
    var quantity;
    var user_id;
    var uuid;
    var weight;

    AddCartData({this.id, this.product, this.product_id, this.quantity, this.user_id, this.uuid, this.weight});

    factory AddCartData.fromJson(Map<String, dynamic> json) {
        return AddCartData(
            id: json['id'],
            product: json['product'] != null ? Product.fromJson(json['product']) : null,
            product_id: json['product_id'],
            quantity: json['quantity'],
            user_id: json['user_id'],
            uuid: json['uuid'],
            weight: json['weight'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['product_id'] = this.product_id;
        data['quantity'] = this.quantity;
        data['user_id'] = this.user_id;
        data['uuid'] = this.uuid;
        data['weight'] = this.weight;
        if (this.product != null) {
            data['product'] = this.product.toJson();
        }
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
    var description;
    var discount;
    var featured;
    var featured_image;
    var id;
    var name;
    var price;
    List<PriceDistribution> price_distribution;
    var profit;
    var sku;
    var slug;
    var status;
    var stock_status;
    var unit;
    var uuid;
    var weight;

    Product({ this.description, this.discount, this.featured, this.featured_image, this.id, this.name, this.price, this.price_distribution, this.profit, this.sku, this.slug, this.status, this.stock_status, this.unit, this.uuid, this.weight});

    factory Product.fromJson(Map<String, dynamic> json) {
        return Product(
            description: json['description'],
            discount: json['discount'],
            featured: json['featured'],
            featured_image: json['featured_image'],
            id: json['id'],
            name: json['name'],
            price: json['price'],
            price_distribution: json['price_distribution'] != null ? (json['price_distribution'] as List).map((i) => PriceDistribution.fromJson(i)).toList() : null,
            profit: json['profit'],
            sku: json['sku'],
            slug: json['slug'],
            status: json['status'],
            stock_status: json['stock_status'],
            unit: json['unit'],
            uuid: json['uuid'],
            weight: json['weight'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['description'] = this.description;
        data['discount'] = this.discount;
        data['featured'] = this.featured;
        data['featured_image'] = this.featured_image;
        data['id'] = this.id;
        data['name'] = this.name;
        data['price'] = this.price;
        data['profit'] = this.profit;
        data['sku'] = this.sku;
        data['slug'] = this.slug;
        data['status'] = this.status;
        data['stock_status'] = this.stock_status;
        data['unit'] = this.unit;
        data['uuid'] = this.uuid;
        data['weight'] = this.weight;

        if (this.price_distribution != null) {
            data['price_distribution'] = this.price_distribution.map((v) => v.toJson()).toList();
        }
        return data;
    }
}