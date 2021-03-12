
import '../../startSignup.dart';
import 'CartDataa.dart';


class CartDataBase {
    CartDatas datad;
    int status_code;

    CartDataBase({this.datad, this.status_code});

    factory CartDataBase.fromJson(Map<String, dynamic> json) {
        return CartDataBase(
            datad: json['data'] != null ? CartDatas.fromJson(json['data']) : null,
            status_code: json['status_code'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['status_code'] = this.status_code;
        if (this.datad != null) {
            data['data'] = this.datad.toJson();
        }
        return data;
    }
}


class CartDatas {
    List<CartDataa> dataa;

    CartDatas({this.dataa});

    factory CartDatas.fromJson(Map<String, dynamic> json) {
        return CartDatas(
            dataa: json['items'] != null ? (json['items'] as List).map((i) => CartDataa.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.dataa != null) {
            data['items'] = this.dataa.map((v) => v.toJson()).toList();
        }
        return data;
    }
}