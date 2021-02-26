
class DashboardResp {
    DashboardData dashboardData;
    int status_code;

    DashboardResp({this.dashboardData, this.status_code});

    factory DashboardResp.fromJson(Map<String, dynamic> json) {
        return DashboardResp(
            dashboardData: json['data'] != null ? DashboardData.fromJson(json['data']) : null,
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


class DashboardData {
    int approved_commission;
    List<CommissionGrowth> commission_growth;
    List<NewDescendant> new_descendants;
    int pending_commission;
    int total_commission;
    int total_referral;

    DashboardData({this.approved_commission, this.commission_growth, this.new_descendants, this.pending_commission, this.total_commission, this.total_referral});

    factory DashboardData.fromJson(Map<String, dynamic> json) {
        return DashboardData(
            approved_commission: json['approved_commission'],
            commission_growth: json['commission_growth'] != null ? (json['commission_growth'] as List).map((i) => CommissionGrowth.fromJson(i)).toList() : null,
            new_descendants: json['new_descendants'] != null ? (json['new_descendants'] as List).map((i) => NewDescendant.fromJson(i)).toList() : null,
            pending_commission: json['pending_commission'],
            total_commission: json['total_commission'],
            total_referral: json['total_referral'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['approved_commission'] = this.approved_commission;
        data['pending_commission'] = this.pending_commission;
        data['total_commission'] = this.total_commission;
        data['total_referral'] = this.total_referral;
        if (this.commission_growth != null) {
            data['commission_growth'] = this.commission_growth.map((v) => v.toJson()).toList();
        }
        if (this.new_descendants != null) {
            data['new_descendants'] = this.new_descendants.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class CommissionGrowth {
    int amount;
    String amount_formatted;
    String month;

    CommissionGrowth({this.amount, this.amount_formatted, this.month});

    factory CommissionGrowth.fromJson(Map<String, dynamic> json) {
        return CommissionGrowth(
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

class NewDescendant {
    String avatar_url;
    String display_name;
    String first_name;
    String last_name;
    int level;
    String uuid;

    NewDescendant({this.avatar_url, this.display_name, this.first_name, this.last_name, this.level, this.uuid});

    factory NewDescendant.fromJson(Map<String, dynamic> json) {
        return NewDescendant(
            avatar_url: json['avatar_url'],
            display_name: json['display_name'],
            first_name: json['first_name'],
            last_name: json['last_name'],
            level: json['level'],
            uuid: json['uuid'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['avatar_url'] = this.avatar_url;
        data['display_name'] = this.display_name;
        data['first_name'] = this.first_name;
        data['last_name'] = this.last_name;
        data['level'] = this.level;
        data['uuid'] = this.uuid;
        return data;
    }
}