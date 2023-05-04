class ProductDetailsModel {
  ProductDetailsModel(
      {required this.id,
      required this.title,
      required this.sku,
      required this.slug,
      required this.description,
      required this.shortDescription,
      required this.price,
      required this.headerTitle,
      required this.gender,
      required this.brandName,
      required this.thumbnailImage,
      required this.type,
      required this.refundPolicy,
      required this.country,
      required this.vendorDetails,
      required this.shippingCost,
      required this.discountedPrice,
      required this.delivery,
      required this.isAvailableOffer,
      required this.availableOfferListArr,
      required this.productImages});
  dynamic id;
  dynamic title;
  dynamic slug;
  dynamic sku;
  dynamic description;
  dynamic shortDescription;
  dynamic price;
  dynamic headerTitle;
  dynamic gender;
  dynamic brandName;
  dynamic thumbnailImage;
  dynamic type;
  dynamic refundPolicy;
  dynamic country;
  dynamic vendorDetails;
  dynamic shippingCost;
  dynamic discountedPrice;
  dynamic delivery;
  dynamic isAvailableOffer;
  dynamic availableOfferListArr;
  dynamic productImages;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
          id: json["id"],
          title: json["title"],
          slug: json["slug"],
          sku: json["sku"],
          description: json["description"],
          shortDescription: json["shortDescription"],
          price: json["price"],
          headerTitle: json["headerTitle"],
          gender: json["gender"],
          brandName: json["brandName"],
          thumbnailImage: json["thumbnailImage"],
          type: json["type"],
          refundPolicy: json["refundPolicy"],
          // country : json['country'] != null ? new Country.fromJson(json['country']) : null
          country: json["country"],
          vendorDetails: json["vendorDetails"],
          shippingCost: json["shippingCost"],
          discountedPrice: json["discountedPrice"],
          delivery: json["delivery"],
          isAvailableOffer: json["isAvailableOffer"],
          availableOfferListArr: json["availableOfferListArr"],
          productImages: json["productImages"]);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "slug": slug,
      "sku": sku,
      "description": description,
      "shortDescription": shortDescription,
      "price": price,
      "headerTitle": headerTitle,
      "gender": gender,
      "brandName": brandName,
      "thumbnailImage": thumbnailImage,
      "type": type,
      "refundPolicy": refundPolicy,
      "country": country,
      "vendorDetails": vendorDetails,
      "shippingCost": shippingCost,
      "discountedPrice": discountedPrice,
      "delivery": delivery,
      "isAvailableOffer": isAvailableOffer,
      "availableOfferListArr": availableOfferListArr,
      "productImages": productImages
    };
  }
}

class Country {
  int? id;
  String? name;
  String? status;

  Country({this.id, this.name, this.status});

  factory Country.fromJson(Map<String, dynamic> json) =>
      Country(id: json['id'], name: json['name'], status: json['status']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return {'id': id, 'name': name, 'status': status};
  }
}
