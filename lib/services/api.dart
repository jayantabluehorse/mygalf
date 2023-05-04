import 'package:dio/dio.dart';
import 'package:my_galf/components/constant.dart';

import '../pages/contact_page/contact_model.dart';
import '../pages/about_page/about_model.dart';

class ApiService {
  Future fetchPostData(url, body, type) async {
    var model = <dynamic>[];
    try {
      var response = await Dio().post(
        url,
        data: body,
        options: Options(
          headers: {
            "token": staticToken // Set the content-length.
          },
        ),
      );
      if (response.statusCode == 200) {
        if (type == "products") {
          return response.data["data"]["details"];
        }
        return response.data["details"];
      } else {
        // print("else");
        return model;
      }
    } catch (err) {
      print("form catch in api service eventList $model");
      return model;
    }
  }

  // -------------------------------

  Future fetchGetData(url) async {
    var model = <dynamic>[];
    try {
      var response = await Dio().get(
        url,
        options: Options(
          headers: {
            "Authorization": staticTokenforGet // Set the content-length.
          },
        ),
      );
      if (response.statusCode == 200) {
        return response.data["data"];
      } else {
        // print("else");
        return model;
      }
    } catch (err) {
      print("form catch in api service eventList $model");
      return model;
    }
  }

  Future fetchContactUs(url, body) async {
    var model = <dynamic>[];
    try {
      var response = await Dio().get(
        url,
        //  data: body,
        options: Options(
          headers: {
            "Authorization":
                "Bearer 5ec6136ffcf14cd59fc1046036efd4e7618cce51abfa1e02b3cbe6189b3f17196612f1c00a6f96309450921d9a7bb2d734b6c87ff17bc3531f8a45f1d08fffeefd9af41239150c18500c22bddcd00859c75b6707f6003dad43586b42f6d2ffd00bc3a43eca818efaaf54f41659dd7713b85a8d6e74dd92a6fdc2ca339b184dfb" // Set the content-length.
          },
        ),
      );
      if (response.statusCode == 200) {
        var d = ContactModel.fromJson(response.data['data'][0]["attributes"]);

        return d;
      } else {
        print("else");
        return model;
      }
    } catch (err) {
      print("form catch in api service eventList $model");
      return model;
    }
  }

  Future fetchLeadershipTeams(url, body) async {
    var model = <dynamic>[];
    try {
      var response = await Dio().get(
        url,
        //  data: body,
        options: Options(
          headers: {
            "Authorization":
                "Bearer 5ec6136ffcf14cd59fc1046036efd4e7618cce51abfa1e02b3cbe6189b3f17196612f1c00a6f96309450921d9a7bb2d734b6c87ff17bc3531f8a45f1d08fffeefd9af41239150c18500c22bddcd00859c75b6707f6003dad43586b42f6d2ffd00bc3a43eca818efaaf54f41659dd7713b85a8d6e74dd92a6fdc2ca339b184dfb" // Set the content-length.
          },
        ),
      );
      if (response.statusCode == 200) {
        var d = AboutModel.fromJson(response.data['data'][0]["attributes"]);

        return d;
      } else {
        print("else");
        return model;
      }
    } catch (err) {
      print("form catch in api service eventList $model");
      return model;
    }
  }

  // Future fetchEventDetails(url, body) async {
  //   var model = <dynamic>[];
  //   try {
  //     var response = await Dio().post(
  //       url,
  //       data: body,
  //       options: Options(
  //         headers: {
  //           "token": staticToken // Set the content-length.
  //         },
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       var d = [response.data["details"]];

  //       return d;
  //     } else {
  //       print("else");
  //       return model;
  //     }
  //   } catch (err) {
  //     print("form catch in api service event details $model");
  //     return model;
  //   }
  // }
}
