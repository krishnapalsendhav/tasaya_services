import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tasaya_services/controller/services_controller.dart';

// ignore: must_be_immutable
class OrderPage extends StatelessWidget {
  OrderPage({super.key});
  ServiceController serviceController = Get.find();
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return RefreshIndicator(
      onRefresh: () {
        HapticFeedback.lightImpact();
        return serviceController.fetchAllOrders();
      },
      child: SizedBox(
        height: height,
        width: width,
        child: Obx(() => serviceController.isOrderFetching.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : serviceController.orderList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('No Orders Found'),
                      const SizedBox(height: 10),
                      MaterialButton(
                        minWidth: 100,
                        height: 40,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: theme.primaryColor,
                          ),
                        ),
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          serviceController.fetchAllOrders();
                        },
                        child: Text('Refresh', style: theme.textTheme.titleSmall),
                      ),
                    ],
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: serviceController.orderList.length,
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: Container(
                              decoration: BoxDecoration(
                                color: theme.primaryColorDark,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(
                                  //   height: height * 0.25,
                                  //   width: width,
                                  //   child: ClipRRect(
                                  //     borderRadius: BorderRadius.circular(12),
                                  //     child: GoogleMap(
                                  //       zoomControlsEnabled: false,
                                  //       onMapCreated: _onMapCreated,
                                  //       initialCameraPosition: CameraPosition(
                                  //         target: LatLng(serviceController.orderList[index].shippingAddress!.latitude!, serviceController.orderList[index].shippingAddress!.longitude!),
                                  //         zoom: 17.0,
                                  //       ),
                                  //       markers: {
                                  //         Marker(
                                  //           markerId: const MarkerId('marker_1'),
                                  //           position: LatLng(serviceController.orderList[index].shippingAddress!.latitude!, serviceController.orderList[index].shippingAddress!.longitude!),
                                  //           infoWindow: const InfoWindow(title: 'Order Location', snippet: 'Locate through Google Map'),
                                  //         ),
                                  //       },
                                  //     ),
                                  //   ),
                                  // ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(child: Text('${serviceController.orderList[index].shippingAddress!.addressLine}', style: theme.textTheme.labelSmall)),
                                      Text('${serviceController.orderList[index].orderItems![0].name}', style: theme.textTheme.labelSmall),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '₹${serviceController.orderList[index].totalPrice}',
                                        style: theme.textTheme.titleSmall!.copyWith(color: Colors.green),
                                      ),
                                      Text(
                                        '${serviceController.orderList[index].paymentMethod}',
                                        style: theme.textTheme.titleSmall!.copyWith(color: Colors.green),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      MaterialButton(
                                        textColor: theme.primaryColorLight,
                                        color: theme.primaryColor,
                                        minWidth: 100,
                                        height: 40,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        onPressed: () {
                                          HapticFeedback.lightImpact();
                                          // serviceController.acceptOrder(serviceController.orderList[index].id!);
                                          serviceController.acceptedOrderList.add(serviceController.orderList.removeAt(index));
                                        },
                                        child: Text(
                                          'Accept',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade100,
                                          ),
                                        ),
                                      ),
                                      MaterialButton(
                                        minWidth: 100,
                                        height: 40,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          side: BorderSide(
                                            color: theme.primaryColor,
                                          ),
                                        ),
                                        onPressed: () {
                                          HapticFeedback.lightImpact();
                                          serviceController.orderList.removeAt(index);
                                          // serviceController.rejectOrder(serviceController.orderList[index].id!);
                                        },
                                        child: Text('Reject', style: theme.textTheme.titleSmall),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                  )),
      ),
    );
  }
}
