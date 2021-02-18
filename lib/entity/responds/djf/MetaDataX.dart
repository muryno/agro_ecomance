
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