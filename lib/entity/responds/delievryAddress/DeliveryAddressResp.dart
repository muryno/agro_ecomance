import '../DeliveryAddress.dart';


class DeliveryAddressResp {
    DeliveryAddress deliveryAddress;

    DeliveryAddressResp({this.deliveryAddress});

    factory DeliveryAddressResp.fromJson(Map<String, dynamic> json) {
        return DeliveryAddressResp(
            deliveryAddress: json['data'] != null ? DeliveryAddress.fromJson(json['data']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.deliveryAddress != null) {
            data['data'] = this.deliveryAddress.toJson();
        }
        return data;
    }
}