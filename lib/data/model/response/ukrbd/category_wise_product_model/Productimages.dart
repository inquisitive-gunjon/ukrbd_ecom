class Productimages {
  Productimages({
      this.id, 
      this.productsId, 
      this.image,});

  Productimages.fromJson(dynamic json) {
    id = json['id'];
    productsId = json['products_id'];
    image = json['image'];
  }
  dynamic id;
  dynamic productsId;
  dynamic image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['products_id'] = productsId;
    map['image'] = image;
    return map;
  }

}