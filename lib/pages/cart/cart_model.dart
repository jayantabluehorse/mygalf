// ignore_for_file: unnecessary_question_mark

class CartModel {
  dynamic? id;
  dynamic? cartId;
  dynamic? customerId;
  dynamic? itemQuantity;
  dynamic? title;
  dynamic? slug;
  dynamic? size;
  dynamic? weight;
  dynamic? shortDescription;
  dynamic? price;
  dynamic? thumbnailImages;
  dynamic? productTotalPrice;
  dynamic? type;
  dynamic? specialPrice;

  CartModel(
      {this.id,
      this.cartId,
      this.customerId,
      this.itemQuantity,
      this.title,
      this.slug,
      this.size,
      this.weight,
      this.shortDescription,
      this.price,
      this.thumbnailImages,
      this.productTotalPrice,
      this.specialPrice,
      this.type});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartId = json['cartId'];
    customerId = json['customerId'];
    itemQuantity = json['itemQuantity'];
    title = json['title'];
    slug = json['slug'];
    size = json['size'];
    weight = json['weight'];
    shortDescription = json['shortDescription'];
    price = json['price'];
    thumbnailImages = json['thumbnailImages'];
    productTotalPrice = json['productTotalPrice'];
    type = json["type"];
    specialPrice = json["specialPrice"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cartId'] = cartId;
    data['customerId'] = customerId;
    data['itemQuantity'] = itemQuantity;
    data['title'] = title;
    data['slug'] = slug;
    data['size'] = size;
    data['weight'] = weight;
    data['shortDescription'] = shortDescription;
    data['price'] = price;
    data['thumbnailImages'] = thumbnailImages;
    data['productTotalPrice'] = productTotalPrice;
    data['type'] = type;
    data['specialPrice'] = specialPrice;
    return data;
  }
}
