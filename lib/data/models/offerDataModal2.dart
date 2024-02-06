class OfferDataModal2 {
  List<Offer>? offer;

  OfferDataModal2({this.offer});

  OfferDataModal2.fromJson(Map<String, dynamic> json) {
    if (json['offer'] != null) {
      offer = <Offer>[];
      json['offer'].forEach((v) {
        offer!.add(new Offer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.offer != null) {
      data['offer'] = this.offer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offer {
  String? sId;
  String? title;
  String? percent;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Offer(
      {this.sId,
      this.title,
      this.percent,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Offer.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    percent = json['percent'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['percent'] = this.percent;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
