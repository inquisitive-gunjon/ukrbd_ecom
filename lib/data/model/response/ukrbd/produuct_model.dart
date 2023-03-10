
class Data {
  Data({
    this.id,
    this.productImage,
    this.productName,
    this.productCode,
    this.purchasePrice,
    this.price,
    this.offerPrice,
    this.salesPrice,
    this.productStatus,
    this.discount,
    this.warranty,
    this.guarantee,
    this.brand,
    this.tags,
    this.countSale,
    this.status,
    this.stock,
    this.category,
    this.categoriesId,
    this.subcategoriesId,
    this.galleriesId,
    this.description,
    this.priority,
    this.moushopsId,
    this.divisionsId,
    this.districtsId,
    this.locationsId,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.productimages,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    productImage = json['product_image'];
    productName = json['product_name'];
    productCode = json['product_code'];
    purchasePrice = json['purchase_price'];
    price = json['price'];
    offerPrice = json['offer_price'];
    salesPrice = json['sales_price'];
    productStatus = json['product_status'];
    discount = json['discount'];
    warranty = json['warranty'];
    guarantee = json['guarantee'];
    brand = json['brand'];
    tags = json['tags'];
    countSale = json['count_sale'];
    status = json['status'];
    stock = json['stock'];
    category = json['category'];
    categoriesId = json['categories_id'];
    subcategoriesId = json['subcategories_id'];
    galleriesId = json['galleries_id'];
    description = json['description'];
    priority = json['priority'];
    moushopsId = json['moushops_id'];
    divisionsId = json['divisions_id'];
    districtsId = json['districts_id'];
    locationsId = json['locations_id'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['productimages'] != null) {
      productimages = [];
      json['productimages'].forEach((v) {
        productimages.add(Productimages.fromJson(v));
      });
    }
  }
  dynamic id;
  dynamic productImage;
  dynamic productName;
  dynamic productCode;
  dynamic purchasePrice;
  dynamic price;
  dynamic offerPrice;
  dynamic salesPrice;
  dynamic productStatus;
  dynamic discount;
  dynamic warranty;
  dynamic guarantee;
  dynamic brand;
  dynamic tags;
  dynamic countSale;
  dynamic status;
  dynamic stock;
  dynamic category;
  dynamic categoriesId;
  dynamic subcategoriesId;
  dynamic galleriesId;
  dynamic description;
  dynamic priority;
  dynamic moushopsId;
  dynamic divisionsId;
  dynamic districtsId;
  dynamic locationsId;
  dynamic isDeleted;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  List<Productimages> productimages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_image'] = productImage;
    map['product_name'] = productName;
    map['product_code'] = productCode;
    map['purchase_price'] = purchasePrice;
    map['price'] = price;
    map['offer_price'] = offerPrice;
    map['sales_price'] = salesPrice;
    map['product_status'] = productStatus;
    map['discount'] = discount;
    map['warranty'] = warranty;
    map['guarantee'] = guarantee;
    map['brand'] = brand;
    map['tags'] = tags;
    map['count_sale'] = countSale;
    map['status'] = status;
    map['stock'] = stock;
    map['category'] = category;
    map['categories_id'] = categoriesId;
    map['subcategories_id'] = subcategoriesId;
    map['galleries_id'] = galleriesId;
    map['description'] = description;
    map['priority'] = priority;
    map['moushops_id'] = moushopsId;
    map['divisions_id'] = divisionsId;
    map['districts_id'] = districtsId;
    map['locations_id'] = locationsId;
    map['is_deleted'] = isDeleted;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    if (productimages != null) {
      map['productimages'] = productimages.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


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