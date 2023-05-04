class LoungeModel {
  int? id;
  Attributes? attributes;

  LoungeModel({this.id, this.attributes});

  LoungeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? title;
  String? slug;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? shortDescription;
  String? metaDescription;
  String? description;
  String? author;
  String? metaTitle;
  String? metaKeyword;
  Image? image;
  Image? category;

  Attributes(
      {this.title,
      this.slug,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.shortDescription,
      this.metaDescription,
      this.description,
      this.author,
      this.metaTitle,
      this.metaKeyword,
      this.image,
      this.category});

  Attributes.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    slug = json['Slug'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    publishedAt = json['publishedAt'];
    shortDescription = json['shortDescription'];
    metaDescription = json['metaDescription'];
    description = json['description'];
    author = json['author'];
    metaTitle = json['metaTitle'];
    metaKeyword = json['metaKeyword'];
    image = json['Image'] != null ? Image.fromJson(json['Image']) : null;
    category =
        json['category'] != null ? Image.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Slug'] = slug;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['publishedAt'] = publishedAt;
    data['shortDescription'] = shortDescription;
    data['metaDescription'] = metaDescription;
    data['description'] = description;
    data['author'] = author;
    data['metaTitle'] = metaTitle;
    data['metaKeyword'] = metaKeyword;
    if (image != null) {
      data['Image'] = image!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Image {
  LoungeModel? data;

  Image({this.data});

  Image.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? LoungeModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Formats {
  Large? large;
  Large? small;
  Large? medium;
  Large? thumbnail;

  Formats({this.large, this.small, this.medium, this.thumbnail});

  Formats.fromJson(Map<String, dynamic> json) {
    large = json['large'] != null ? Large.fromJson(json['large']) : null;
    small = json['small'] != null ? Large.fromJson(json['small']) : null;
    medium = json['medium'] != null ? Large.fromJson(json['medium']) : null;
    thumbnail =
        json['thumbnail'] != null ? Large.fromJson(json['thumbnail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (large != null) {
      data['large'] = large!.toJson();
    }
    if (small != null) {
      data['small'] = small!.toJson();
    }
    if (medium != null) {
      data['medium'] = medium!.toJson();
    }
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    return data;
  }
}

class Large {
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic path;
  double? size;
  int? width;
  int? height;

  Large(
      {this.ext,
      this.url,
      this.hash,
      this.mime,
      this.name,
      this.path,
      this.size,
      this.width,
      this.height});

  Large.fromJson(Map<String, dynamic> json) {
    ext = json['ext'];
    url = json['url'];
    hash = json['hash'];
    mime = json['mime'];
    name = json['name'];
    path = json['path'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ext'] = ext;
    data['url'] = url;
    data['hash'] = hash;
    data['mime'] = mime;
    data['name'] = name;
    data['path'] = path;
    data['size'] = size;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}

// class Attributes {
//   String? title;
//   String? slug;
//   String? createdAt;
//   String? updatedAt;
//   String? publishedAt;

//   Attributes(
//       {this.title,
//       this.slug,
//       this.createdAt,
//       this.updatedAt,
//       this.publishedAt});

//   Attributes.fromJson(Map<String, dynamic> json) {
//     title = json['Title'];
//     slug = json['Slug'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     publishedAt = json['publishedAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Title'] = this.title;
//     data['Slug'] = this.slug;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['publishedAt'] = this.publishedAt;
//     return data;
//   }
// }