import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // print('running builder');
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),

      // ############   Instead of this we can use FutureBuilder()  #############

      // body: _isLoading
      //     ? Center(
      //         child: CircularProgressIndicator(
      //         color: Theme.of(context).colorScheme.secondary,
      //       ))
      //     : ListView.builder(
      //         itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
      //         itemCount: orderData.orders.length,
      //       ),

      body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ));
            } else {
              if (snapshot.error != null) {
                return const Center(
                  child: Text('An error occured!'),
                );
              } else {
                return Consumer<Orders>(
                  builder: (context, orderData, child) {
                    return orderData.orders.isEmpty
                        ? const Center(
                            child: Text('No orders yet try adding some.'),
                          )
                        : ListView.builder(
                            itemBuilder: (ctx, i) =>
                                OrderItem(orderData.orders[i]),
                            itemCount: orderData.orders.length,
                          );
                  },
                );
              }
            }
          },
          future:
              Provider.of<Orders>(context, listen: false).fetchAndSetOrders()),
    );
  }
}
