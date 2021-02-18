
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