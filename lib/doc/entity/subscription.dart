class Subscription {
    String description;
    int id;
    String name;
    int price;

    Subscription({this.description, this.id, this.name, this.price});

    factory Subscription.fromJson(Map<String, dynamic> json) {
        return Subscription(
            description: json['description'],
            id: json['id'],
            name: json['name'],
            price: json['price'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['description'] = this.description;
        data['id'] = this.id;
        data['name'] = this.name;
        data['price'] = this.price;
        return data;
    }
}