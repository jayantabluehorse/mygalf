import 'package:get/get.dart';
import 'package:my_galf/services/api.dart';

class LoungeController extends GetxController {
  var isLoading = false.obs;
  var loungeList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService()
          .fetchGetData("https://ntez.tezcommerce.com/api/articles?populate=*");

      // productList.assignAll(produts);
      // print("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\$products");
      // LoungeList.assignAll(products);
      loungeList.assignAll(products);
      // LoungeList.assignAll(products.map((ele) {
      //   return ProductModel.fromJson(ele);
      // }));
      // print("-----------------------------------");
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      // print("from productList $loungeList");
    }
  }
}
