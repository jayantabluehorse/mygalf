class AddressModel {
  dynamic id;
  dynamic storeId;
  dynamic customerId;
  dynamic isPrimary;
  dynamic fullName;
  dynamic mobile;
  dynamic address;
  dynamic locality;
  dynamic city;
  dynamic state;
  dynamic pin;
  dynamic gstn;
  dynamic country;
  dynamic addressType;

  AddressModel(
      {this.id,
      this.storeId,
      this.customerId,
      this.isPrimary,
      this.fullName,
      this.mobile,
      this.address,
      this.locality,
      this.city,
      this.state,
      this.pin,
      this.country,
      this.gstn,
      this.addressType});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['storeId'];
    customerId = json['customerId'];
    isPrimary = json['isPrimary'];
    fullName = json['fullName'];
    mobile = json['mobile'];
    address = json['address'];
    locality = json['locality'];
    city = json['city'];
    state = json['state'];
    pin = json['pin'];
    country = json['country'];
    gstn = json['gstn'];
    addressType = json['addressType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['storeId'] = storeId;
    data['customerId'] = customerId;
    data['isPrimary'] = isPrimary;
    data['fullName'] = fullName;
    data['mobile'] = mobile;
    data['address'] = address;
    data['locality'] = locality;
    data['city'] = city;
    data['state'] = state;
    data['pin'] = pin;
    data['country'] = country;
    data['gstn'] = gstn;
    data['addressType'] = addressType;

    return data;
  }
}
