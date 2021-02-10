

class productReq {
    List<int> category;
    String description;
    Dimensionss dimensions;
    double discount;
    int featured_image;
    List<int> images;
    String name;
    double price;
    String sku;
    String unit;
    int status;

    String uuid;

    String image;
    String image1;
    String image2;
    String image3;
    String image4;
    String image5;
    int stock_status;
    int stock_quantity;


    productReq({this.uuid,this.category, this.description, this.dimensions, this.discount, this.featured_image, this.images, this.name, this.price, this.sku, this.unit,this.status,
    this.image,this.image1,this.image2,this.image3,this.image4,this.image5,this.stock_status,this.stock_quantity
    });

    factory productReq.fromJson(Map<String, dynamic> json) {
        return productReq(
            category: json['category'], 
            description: json['description'], 
            dimensions: json['dimensions'] != null ? Dimensionss.fromJson(json['dimensions']) : null,
            discount: json['discount'], 
            featured_image: json['featured_image'], 
            images: json['images'] != null ? new List<int>.from(json['images']) : null, 
            name: json['name'], 
            price: json['price'], 
            sku: json['sku'], 
            unit: json['unit'],
            uuid: json['uuid'],
            status: json['status'],


            stock_status: json['stock_status'],
            stock_quantity: json['stock_quantity'],


            image: json['image'],
            image1: json['image1'],
            image2: json['image2'],
            image3: json['image3'],
            image4: json['image4'],
            image5: json['image5'],


        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['category'] = this.category;
        data['description'] = this.description;
        data['discount'] = this.discount;
        data['featured_image'] = this.featured_image;
        data['name'] = this.name;
        data['price'] = this.price;
        data['sku'] = this.sku;
        data['unit'] = this.unit;
        data['uuid'] = this.uuid;
        data['status'] = this.status;

        data['stock_status'] = this.stock_status;
        data['stock_quantity'] = this.stock_quantity;


        data['image'] = this.image;
        data['image1'] = this.image1;
        data['image2'] = this.image2;
        data['image3'] = this.image3;
        data['image4'] = this.image4;
        data['image5'] = this.image5;



        if (this.dimensions != null) {
            data['dimensions'] = this.dimensions.toJson();
        }
        if (this.images != null) {
            data['images'] = this.images;
        }
        return data;
    }
}

class Dimensionss {
    int height;
    int length;
    int width;

    Dimensionss({this.height, this.length, this.width});

    factory Dimensionss.fromJson(Map<String, dynamic> json) {
        return Dimensionss(
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