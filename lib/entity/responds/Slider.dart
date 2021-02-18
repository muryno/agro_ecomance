
class Sliders {
    List<SliderData> data;


    Sliders({this.data});

    factory Sliders.fromJson(Map<String, dynamic> json) {
        return Sliders(
            data: json['data'] != null ? (json['data'] as List).map((i) => SliderData.fromJson(i)).toList() : null,
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


class SliderData {
    bool active;
    var description;
    String image;
    String thumbnail;
    String title;
    String uuid;

    SliderData({this.active, this.description, this.image, this.thumbnail, this.title, this.uuid});

    factory SliderData.fromJson(Map<String, dynamic> json) {
        return SliderData(
            active: json['active'],
            description: json['description'] ,
            image: json['image'],
            thumbnail: json['thumbnail'],
            title: json['title'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['active'] = this.active;
        data['image'] = this.image;
        data['thumbnail'] = this.thumbnail;
        data['title'] = this.title;
        data['uuid'] = this.uuid;
        if (this.description != null) {
            data['description'] = this.description.toJson();
        }

        return data;
    }
}