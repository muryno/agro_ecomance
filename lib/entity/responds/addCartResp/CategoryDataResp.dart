
class CategoryDataResp {
    List<CategoryData> categoryData;

    CategoryDataResp({this.categoryData});

    factory CategoryDataResp.fromJson(Map<String, dynamic> json) {
        return CategoryDataResp(
            categoryData: json['data'] != null ? (json['data'] as List).map((i) => CategoryData.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.categoryData != null) {
            data['data'] = this.categoryData.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class CategoryData {
    var created_at;
    var description;
    int id;
    CategoryImages image;
    var image_id;
    var max_amount;
    var min_amount;
    var name;
    var slug;
    var status;
    var status_readable;
    var type;
    var updated_at;
    var uuid;

    CategoryData({this.created_at, this.description, this.id, this.image, this.image_id, this.max_amount, this.min_amount, this.name, this.slug, this.status, this.status_readable, this.type, this.updated_at, this.uuid});

    factory CategoryData.fromJson(Map<String, dynamic> json) {
        return CategoryData(
            created_at: json['created_at'],
            description: json['description'],
            id: json['id'],
            image: json['image'] != null ? CategoryImages.fromJson(json['image']) : null,
            image_id: json['image_id'],
            max_amount: json['max_amount'],
            min_amount: json['min_amount'],
            name: json['name'],
            slug: json['slug'],
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
        data['image_id'] = this.image_id;
        data['max_amount'] = this.max_amount;
        data['min_amount'] = this.min_amount;
        data['name'] = this.name;
        data['slug'] = this.slug;
        data['status'] = this.status;
        data['status_readable'] = this.status_readable;
        data['type'] = this.type;
        data['updated_at'] = this.updated_at;
        data['uuid'] = this.uuid;
        if (this.image != null) {
            data['image'] = this.image.toJson();
        }
        return data;
    }
}


class CategoryImages {
    var aggregator_id;
    var created_at;
    var description;
    var file_path;
    var file_url;
    var filename;
    var id;
    MetaData meta_data;
    var thumbnail_path;
    var thumbnail_url;
    var updated_at;
    var uuid;

    CategoryImages({this.aggregator_id, this.created_at, this.description, this.file_path, this.file_url, this.filename, this.id, this.meta_data, this.thumbnail_path, this.thumbnail_url, this.updated_at, this.uuid});

    factory CategoryImages.fromJson(Map<String, dynamic> json) {
        return CategoryImages(
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

class MetaData {
    var name;
    var readable_size;
    var size;
    var type;

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