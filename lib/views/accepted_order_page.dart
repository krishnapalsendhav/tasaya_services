import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tasaya_services/controller/services_controller.dart';

// ignore: must_be_immutable
class AcceptedOrderPage extends StatelessWidget {
  AcceptedOrderPage({super.key});
  ServiceController serviceController = Get.find();

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
            : serviceController.acceptedOrderList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('No Accepted Orders Found'),
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
                          serviceController.acceptedOrderList.refresh();
                        },
                        child: Text('Refresh', style: theme.textTheme.titleSmall),
                      ),
                    ],
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: serviceController.acceptedOrderList.length,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(child: Text('${serviceController.acceptedOrderList[index].shippingAddress!.addressLine}', style: theme.textTheme.labelSmall)),
                                      Text('${serviceController.acceptedOrderList[index].orderItems![0].name}', style: theme.textTheme.labelSmall),
                                    ],
                                  ),
                                  Text(
                                    '₹${serviceController.acceptedOrderList[index].totalPrice}',
                                    style: theme.textTheme.titleSmall,
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
                                        onPressed: () {},
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
                                          // serviceController.rejectOrder(serviceController.orderList[index].id!);
                                          serviceController.orderList.add(serviceController.acceptedOrderList.removeAt(index));
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
