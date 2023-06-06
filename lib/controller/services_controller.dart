import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../model/all_orders_model.dart';
import '../model/category_model.dart';
import '../model/services_login_model.dart';
import '../services/services.dart';
import '../views/login_page.dart';

class ServiceController extends GetxController {
  User? profile;
  RxBool isBoxOpen = false.obs;
  Box? profileBox;
  Services services = Services();
  RxList<CategoryElement> servicesCategories = <CategoryElement>[].obs;
  RxList<Order> orderList = <Order>[].obs;
  RxBool isOrderFetching = false.obs;
  RxList<Order> acceptedOrderList = <Order>[].obs;

  openHiveBox() async {
    profileBox = await Hive.openBox<User>('ServicsProfileBox');
    if (profileBox!.isNotEmpty) {
      profile = profileBox!.get('profile');
    }
    isBoxOpen.value = true;

    update();
  }

  fetchCategory() async {
    var res = await services.getCategory();
    if (res != null) {
      if (res.status == true) {
        servicesCategories.value = res.categories!;
        servicesCategories.refresh();
        update();
      }
    }
  }

  logout() {
    profileBox!.delete('profile');
    profile = null;
    update();
    Get.offAll(() => LoginPage());
  }

  fetchAllOrders() async {
    isOrderFetching.value = true;
    var res = await services.getAllOrders();
    if (res != null) {
      if (res.status == true) {
        orderList.value = res.orders!;
        orderList.refresh();
        update();
      }
    }
    isOrderFetching.value = false;
  }

  @override
  void onInit() {
    openHiveBox();
    fetchCategory();
    fetchAllOrders();
    super.onInit();
  }
}
