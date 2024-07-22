import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../api_services.dart';
import '../model/post_model.dart';

class ApiController extends GetxController {
  PostModel postModel = PostModel.temp();
  RxInt currentIndex = 0.obs, containerIndex = 0.obs, temp = 0.obs;

  RxBool isLoading = false.obs;
  Future<void> loadData() async {
    isLoading.value = true;
    Map json = await ApiServices.apiServices.fetchData();
    postModel = PostModel.fromJson(json);
    print(PostModel.postModel.limit);
    isLoading.value = false;
  }

  void updateContainerIndex(int index) {
    if (index < 3) {
      containerIndex++;
    } else {
      containerIndex = temp;

      temp++;
      if (temp > 4) {
        temp.value = 0;
      }
    }
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  ApiController() {
    loadData();
  }
}
