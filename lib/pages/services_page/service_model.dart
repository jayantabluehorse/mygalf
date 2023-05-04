class ServiceModel {
  dynamic id;
  dynamic storeId;
  dynamic title;
  dynamic slug;
  dynamic tags;
  dynamic mainImage;
  dynamic thumbnailImage;
  dynamic relatedProducts;
  dynamic shortDescription;
  dynamic description;
  dynamic youtubeLink;
  dynamic metaDescription;
  dynamic optionName;
  dynamic price;
  dynamic discountedPrice;
  dynamic specialPrice;
  dynamic specialPriceFromDate;
  dynamic specialPriceToDate;
  dynamic status;
  dynamic isFeatured;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic type;

  ServiceModel(
      {this.id,
      this.storeId,
      this.title,
      this.slug,
      this.tags,
      this.mainImage,
      this.thumbnailImage,
      this.relatedProducts,
      this.shortDescription,
      this.description,
      this.youtubeLink,
      this.metaDescription,
      this.optionName,
      this.price,
      this.discountedPrice,
      this.specialPrice,
      this.specialPriceFromDate,
      this.specialPriceToDate,
      this.status,
      this.isFeatured,
      this.createdBy,
      this.updatedBy,
      this.type});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['storeId'];
    title = json['title'];
    slug = json['slug'];
    tags = json['tags'];
    mainImage = json['mainImage'];
    thumbnailImage = json['thumbnailImage'];
    relatedProducts = json['relatedProducts'];
    shortDescription = json['shortDescription'];
    description = json['description'];
    youtubeLink = json['youtubeLink'];
    metaDescription = json['metaDescription'];
    optionName = json['optionName'];
    price = json['price'];
    discountedPrice = json['discountedPrice'];
    specialPrice = json['specialPrice'];
    specialPriceFromDate = json['specialPriceFromDate'];
    specialPriceToDate = json['specialPriceToDate'];
    status = json['status'];
    isFeatured = json['isFeatured'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['storeId'] = storeId;
    data['title'] = title;
    data['slug'] = slug;
    data['tags'] = tags;
    data['mainImage'] = mainImage;
    data['thumbnailImage'] = thumbnailImage;
    data['relatedProducts'] = relatedProducts;
    data['shortDescription'] = shortDescription;
    data['description'] = description;
    data['youtubeLink'] = youtubeLink;
    data['metaDescription'] = metaDescription;
    data['optionName'] = optionName;
    data['price'] = price;
    data['discountedPrice'] = discountedPrice;
    data['specialPrice'] = specialPrice;
    data['specialPriceFromDate'] = specialPriceFromDate;
    data['specialPriceToDate'] = specialPriceToDate;
    data['status'] = status;
    data['isFeatured'] = isFeatured;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['type'] = type;
    return data;
  }
}
