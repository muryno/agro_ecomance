

import 'UserProfile.dart';

class PickupAddress {
    List<DeliveryAddres> delivery_address;
    int status_code;

    PickupAddress({this.delivery_address, this.status_code});

    factory PickupAddress.fromJson(Map<String, dynamic> json) {
        return PickupAddress(
            delivery_address: json['data'] != null ? (json['data'] as List).map((i) => DeliveryAddres.fromJson(i)).toList() : null,
            status_code: json['status_code'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['status_code'] = this.status_code;
        if (this.delivery_address != null) {
            data['data'] = this.delivery_address.map((v) => v.toJson()).toList();
        }
        return data;
    }
}