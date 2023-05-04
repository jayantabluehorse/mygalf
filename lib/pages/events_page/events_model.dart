class EventModel {
  EventModel({
    required this.id,
    required this.amount,
    required this.title,
    required this.banner,
    required this.mobileBanner,
    required this.description,
    required this.eventDate,
    required this.eventOrganizerName,
    required this.eventOrganizerEmail,
    required this.eventOrganizerMobileNo,
    required this.eventOrganizerImage,
    required this.venue,
    required this.reletedEvents,
  });

  dynamic id;
  dynamic storeId;
  dynamic eventType;
  dynamic type;
  dynamic paymentType;
  dynamic amount;
  dynamic title;
  dynamic slug;
  dynamic banner;
  dynamic mobileBanner;
  dynamic eventDate;
  dynamic eventTime;
  dynamic eventDuration;
  dynamic tags;
  dynamic gst;
  dynamic venue;
  dynamic description;
  dynamic terms;
  dynamic metaDescription;
  dynamic status;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic eventOrganizerName;
  dynamic eventOrganizerEmail;
  dynamic eventOrganizerMobileNo;
  dynamic eventOrganizerImage;
  dynamic reletedEvents;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        amount: json["amount"],
        title: json["title"],
        banner: json["banner"],
        mobileBanner: json["mobileBanner"],
        description: json["description"],
        eventDate: json["eventDate"],
        eventOrganizerName: json["eventOrganizerName"],
        eventOrganizerEmail: json["eventOrganizerEmail"],
        eventOrganizerMobileNo: json["eventOrganizerMobileNo"],
        eventOrganizerImage: json["eventOrganizerImage"],
        venue: json["venue"],
        reletedEvents: json["reletedEvents"],
      );
}
