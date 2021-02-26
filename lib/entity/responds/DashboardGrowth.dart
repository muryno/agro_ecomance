
import 'package:agro_ecomance/entity/responds/DashboardResp.dart';

class DashboardGrowth {
    DashboardGrowthData dashboardData;
    int status_code;

    DashboardGrowth({this.dashboardData, this.status_code});

    factory DashboardGrowth.fromJson(Map<String, dynamic> json) {
        return DashboardGrowth(
            dashboardData: json['data'] != null ? DashboardGrowthData.fromJson(json['data']) : null,
            status_code: json['status_code'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['status_code'] = this.status_code;
        if (this.dashboardData != null) {
            data['data'] = this.dashboardData.toJson();
        }
        return data;
    }
}


class DashboardGrowthData {
    List<CommissionGrowth> commission_growth;

    DashboardGrowthData({this.commission_growth});

    factory DashboardGrowthData.fromJson(Map<String, dynamic> json) {
        return DashboardGrowthData(
            commission_growth: json['commission_growth'] != null ? (json['commission_growth'] as List).map((i) => CommissionGrowth.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.commission_growth != null) {
            data['commission_growth'] = this.commission_growth.map((v) => v.toJson()).toList();
        }
        return data;
    }
}


class CommissionsGrowth {
    int amount;
    String amount_formatted;
    String month;

    CommissionsGrowth({this.amount, this.amount_formatted, this.month});

    factory CommissionsGrowth.fromJson(Map<String, dynamic> json) {
        return CommissionsGrowth(
            amount: json['amount'],
            amount_formatted: json['amount_formatted'],
            month: json['month'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['amount'] = this.amount;
        data['amount_formatted'] = this.amount_formatted;
        data['month'] = this.month;
        return data;
    }
}