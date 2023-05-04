class ContactModel {
  String? title;
  String? description;
  String? mobile;
  String? email;
  String? address;
  String? facebookLinks;
  String? twitterLink;
  String? linkedinLink;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;

  ContactModel(
      {this.title,
      this.description,
      this.mobile,
      this.email,
      this.address,
      this.facebookLinks,
      this.twitterLink,
      this.linkedinLink,
      this.createdAt,
      this.updatedAt,
      this.publishedAt});

  ContactModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    description = json['description'];
    mobile = json['mobile'];
    email = json['email'];
    address = json['address'];
    facebookLinks = json['facebookLinks'];
    twitterLink = json['twitterLink'];
    linkedinLink = json['linkedinLink'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    publishedAt = json['publishedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['description'] = description;
    data['mobile'] = mobile;
    data['email'] = email;
    data['address'] = address;
    data['facebookLinks'] = facebookLinks;
    data['twitterLink'] = twitterLink;
    data['linkedinLink'] = linkedinLink;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['publishedAt'] = publishedAt;
    return data;
  }
}
