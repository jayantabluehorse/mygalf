class ProductModel {
  ProductModel(
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
      required this.specialPrice,
      required this.discountPercent,
      required this.thumbnailImage,
      required this.type});
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
  dynamic discountPercent;
  dynamic specialPrice;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["id"],
      title: json["title"],
      slug: json["slug"],
      sku: json["sku"],
      description: json["description"],
      shortDescription: json["shortDescription"],
      price: json["price"].toString(),
      headerTitle: json["headerTitle"],
      gender: json["gender"],
      brandName: json["brandName"],
      thumbnailImage: json["thumbnailImage"],
      specialPrice: json["specialPrice"].toString(),
      discountPercent:
          double.parse(json["discountPercent"].toString()).toStringAsFixed(2),
      type: json["type"]);

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
      "discountPercent": discountPercent,
      "specialPrice": specialPrice
    };
  }
}
