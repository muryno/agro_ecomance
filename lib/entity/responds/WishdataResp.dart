import 'package:agro_ecomance/entity/responds/cart/CartData.dart';



class WishdataResp {
    String message;
    int status_code;
    CartData wishdata;

    WishdataResp({this.message, this.status_code, this.wishdata});

    factory WishdataResp.fromJson(Map<String, dynamic> json) {
        return WishdataResp(
            message: json['message'], 
            status_code: json['status_code'], 
            wishdata: json['wishdata'] != null ? CartData.fromJson(json['wishdata']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status_code'] = this.status_code;
        if (this.wishdata != null) {
            data['wishdata'] = this.wishdata.toJson();
        }
        return data;
    }
}