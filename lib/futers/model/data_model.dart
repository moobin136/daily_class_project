class ProductModel {
  String? status;
  List<Data>? data;

  ProductModel({this.status, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? productName;
  String? productCode;
  String? unitPrice;
  String? qty;
  String? totalPrice;
  String? createdDate;
  String? img;

  Data(
      {this.sId,
        this.productName,
        this.productCode,
        this.unitPrice,
        this.qty,
        this.totalPrice,
        this.createdDate,
        this.img});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    unitPrice = json['UnitPrice'];
    qty = json['Qty'];
    totalPrice = json['TotalPrice'];
    createdDate = json['CreatedDate'];
    img = json['Img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['ProductName'] = this.productName;
    data['ProductCode'] = this.productCode;
    data['UnitPrice'] = this.unitPrice;
    data['Qty'] = this.qty;
    data['TotalPrice'] = this.totalPrice;
    data['CreatedDate'] = this.createdDate;
    data['Img'] = this.img;
    return data;
  }
}
