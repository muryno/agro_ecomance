
import 'MetaDataX.dart';

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