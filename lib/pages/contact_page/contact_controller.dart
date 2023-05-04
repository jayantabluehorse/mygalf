import 'package:get/get.dart';
import 'package:my_galf/services/api.dart';

class ContactController extends GetxController {
  List featuresList = [
    {
      "image": "assets/images/about_advisor_1.jpg",
      "name": "Mr Vighnesh Shahane",
      "description": "Lorem ipsum sit amet, consectetur  adipisicing...",
      "degnation": "Founder and Chief Executive",
    },
  ];
  var isLoading = true.obs;
  var contactList = [].obs;
  @override
  void onInit() {
    super.onInit();
    fetchContact();
  }

  void fetchContact() async {
    try {
      isLoading(true);
      var produts = await ApiService().fetchContactUs(
        "https://ntez.tezcommerce.com/api/side-contacts",
        {
          "data": {"storeId": 1}
        },
      );

      contactList.assignAll([produts]);
      // print("-----------------------------------");
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      print("from contactList $contactList");
    }
  }
}
