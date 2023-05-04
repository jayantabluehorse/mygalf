import 'package:get/get.dart';
import 'package:my_galf/services/api.dart';

class AboutController extends GetxController {
  List featuresList = [
    {
      "image": "assets/images/about_advisor_1.jpg",
      "name": "Mr Vighnesh Shahane",
      "description": "Lorem ipsum sit amet, consectetur  adipisicing...",
      "degnation": "Founder and Chief Executive",
    },
    {
      "image": "assets/images/about_advisor_2.jpg",
      "name": "Mr Ram Gopal",
      "description": "Lorem ipsum dolor amet, consectetur  adipisicing...",
      "degnation": "Founder and Chief Executive",
    },
    {
      "image": "assets/images/about_advisor_3.jpg",
      "name": "Mr Rajnish Virmani",
      "description": "Lorem ipsum dolor sit consectetur  adipisicing...",
      "degnation": "Founder and Chief Executive",
    },
    {
      "image": "assets/images/about_advisor_1.jpg",
      "name": "Mr Abdul Barik",
      "description": "Lorem ipsum sit amet, consectetur  adipisicing...",
      "degnation": "Founder and Chief Executive",
    },
    {
      "image": "assets/images/about_advisor_2.jpg",
      "name": "Mr Ram Gopal",
      "description": "Lorem ipsum dolor amet, consectetur  adipisicing...",
      "degnation": "Founder and Chief Executive",
    },
    {
      "image": "assets/images/about_advisor_3.jpg",
      "name": "Mr Rajnish Virmani",
      "description": "Lorem ipsum dolor sit consectetur  adipisicing...",
      "degnation": "Founder and Chief Executive",
    },
  ];
  var isLoading = true.obs;
  var leadershipTeamsList = [].obs;
  @override
  void onInit() {
    super.onInit();
    fetchAboutUsLeadershipTeams();
  }

  void fetchAboutUsLeadershipTeams() async {
    try {
      isLoading(true);
      var produts = await ApiService().fetchLeadershipTeams(
        "https://ntez.tezcommerce.com/api/leadership-teams?populate=*",
        {
          "data": {"storeId": 1}
        },
      );

      leadershipTeamsList.assignAll(produts);
      // print("-----------------------------------");
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      print("from contactList $leadershipTeamsList");
    }
  }
}
