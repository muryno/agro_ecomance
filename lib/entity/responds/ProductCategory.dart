
class ProductCategory {
    List<ProductData> productData;

    ProductCategory({this.productData});

    factory ProductCategory.fromJson(Map<String, dynamic> json) {
        return ProductCategory(
            productData: json['data'] != null ? (json['data'] as List).map((i) => ProductData.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.productData != null) {
            data['data'] = this.productData.map((v) => v.toJson()).toList();
        }
        return data;
    }
}


class ProductData {
    var created_at;
    var description;
    var id;
    var file_url;
    var thumbnail_url;
    var image_id;
    var max_amount;
    var min_amount;
    var name;
    var status;
    var status_readable;
    var type;
    var updated_at;
    var uuid;

    ProductData({this.created_at,this.thumbnail_url, this.description, this.id, this.file_url, this.image_id, this.max_amount, this.min_amount, this.name, this.status, this.status_readable, this.type, this.updated_at, this.uuid});

    factory ProductData.fromJson(Map<String, dynamic> json) {
        return ProductData(
            created_at: json['created_at'],
            description: json['description'],
            id: json['id'],
            file_url: json['file_url'],
            image_id: json['image_id'],
            max_amount: json['max_amount'],
            min_amount: json['min_amount'],
            thumbnail_url: json['thumbnail_url'],
            name: json['name'],
            status: json['status'],
            status_readable: json['status_readable'],
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
        data['file_url'] = this.file_url;
        data['image_id'] = this.image_id;
        data['max_amount'] = this.max_amount;
        data['min_amount'] = this.min_amount;
        data['thumbnail_url'] = this.min_amount;
        data['name'] = this.name;
        data['status'] = this.status;
        data['status_readable'] = this.status_readable;
        data['type'] = this.type;
        data['updated_at'] = this.updated_at;
        data['uuid'] = this.uuid;
        return data;
    }
}