class ServiceDetailsModel {
  dynamic id;
  dynamic storeId;
  String name;
  dynamic slug;
  dynamic categoryId;
  dynamic panelistId;
  dynamic tags;
  dynamic mainImage;
  dynamic image;
  dynamic relatedProducts;
  dynamic shortDescription;
  dynamic description;
  dynamic youtubeLink;
  dynamic metaDescription;
  dynamic cancellationAllowed;
  dynamic allowToChooseDate;
  dynamic optionName;
  dynamic price;
  dynamic discountedPrice;
  dynamic status;
  dynamic isFeatured;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic relatedService;
  dynamic panelistName;
  dynamic panelistEmail;
  dynamic panelistAddress;
  dynamic panelistImage;
  dynamic panelistDescription;
  dynamic panelistRefundPolicy;
  dynamic panelistAboutPanelist;
  dynamic serviceCity;
  dynamic servcieCategoryName;
  dynamic session;

  ServiceDetailsModel({
    this.id,
    this.storeId,
    required this.name,
    this.slug,
    this.categoryId,
    this.panelistId,
    this.tags,
    this.mainImage,
    this.image,
    this.relatedProducts,
    this.shortDescription,
    this.description,
    this.youtubeLink,
    this.metaDescription,
    this.cancellationAllowed,
    this.allowToChooseDate,
    this.optionName,
    this.price,
    this.discountedPrice,
    this.status,
    this.isFeatured,
    this.createdBy,
    this.updatedBy,
    this.relatedService,
    this.panelistName,
    this.panelistEmail,
    this.panelistAddress,
    this.panelistImage,
    this.panelistDescription,
    this.panelistRefundPolicy,
    this.panelistAboutPanelist,
    this.serviceCity,
    this.servcieCategoryName,
    this.session,
  });

  factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) =>
      ServiceDetailsModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        shortDescription: json["shortDescription"],
        price: json["price"],
        categoryId: json["categoryId"],
        panelistId: json["panelistId"],
        tags: json["tags"],
        mainImage: json["mainImage"],
        image: json["image"],
        relatedProducts: json["relatedProducts"],
        youtubeLink: json["youtubeLink"],
        metaDescription: json["metaDescription"],
        cancellationAllowed: json["cancellationAllowed"],
        allowToChooseDate: json["allowToChooseDate"],
        optionName: json["optionName"],
        discountedPrice: json["discountedPrice"],
        status: json["status"],
        isFeatured: json["isFeatured"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        relatedService: json["relatedService"],
        panelistName: json["panelistName"],
        panelistEmail: json["panelistEmail"],
        panelistAddress: json["panelistAddress"],
        panelistImage: json["panelistImage"],
        panelistDescription: json["panelistDescription"],
        panelistRefundPolicy: json["panelistRefundPolicy"],
        panelistAboutPanelist: json["panelistAboutPanelist"],
        serviceCity: json["serviceCity"],
        servcieCategoryName: json["servcieCategoryName"],
        session: json["session"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['shortDescription'] = shortDescription;
    data['price'] = price;
    data['categoryId'] = categoryId;
    data['panelistId'] = panelistId;
    data['tags'] = tags;
    data['mainImage'] = mainImage;
    data['image'] = image;
    data['relatedProducts'] = relatedProducts;
    data['youtubeLink'] = youtubeLink;
    data['metaDescription'] = metaDescription;
    data['cancellationAllowed'] = cancellationAllowed;
    data['allowToChooseDate'] = allowToChooseDate;
    data['optionName'] = optionName;
    data['discountedPrice'] = discountedPrice;
    data['status'] = status;
    data['isFeatured'] = isFeatured;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['relatedService'] = relatedService;
    data['panelistName'] = panelistName;
    data['panelistEmail'] = panelistEmail;
    data['panelistAddress'] = panelistAddress;
    data['panelistImage'] = panelistImage;
    data['panelistDescription'] = panelistDescription;
    data['panelistDescription'] = panelistDescription;
    data['panelistRefundPolicy'] = panelistRefundPolicy;
    data['panelistAboutPanelist'] = panelistAboutPanelist;
    data['serviceCity'] = serviceCity;
    data['servcieCategoryName'] = servcieCategoryName;
    data['session'] = session;

    return data;
  }

//  Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "title": title,
//       "slug": slug,
//       "sku": sku,
//       "description": description,
//       "shortDescription": shortDescription,
//       "price": price,
//       "headerTitle": headerTitle,
//       "gender": gender,
//       "brandName": brandName,
//       "thumbnailImage": thumbnailImage,
//       "type": type
//     };
//   }
}
