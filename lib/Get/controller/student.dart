
import 'package:get/get.dart';

import '../service/http.dart';

class ProductController extends GetxController{
  ///obs obserable
  var isLoading = true.obs; ///loaing is now observable
  var productList = [].obs;
  @override
  void onInit() {
    loadProducts(); ///what should happen when the app is loaded
    super.onInit();
  }

  void loadProducts() async{
    try{
      isLoading(true);
      var product = await HttpService.fetchProducts();
      if(product != null){
        productList.value = product; ///Now The List Having the value nd it is observable too
      }
    }
    finally{
      isLoading(false);
    }
  }

}