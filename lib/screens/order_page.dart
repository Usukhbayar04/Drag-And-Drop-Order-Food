import 'package:flutter/material.dart';
import 'package:order_food/models/item.dart';
import 'package:order_food/widgets/order_card.dart';

class Order extends StatefulWidget {
  final List<Item> selItem;
  const Order({super.key, required this.selItem});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food order'),
        backgroundColor: Colors.teal[200],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: widget.selItem.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 12,
                );
              },
              itemBuilder: (context, index) {
                final item = widget.selItem[index];
                return Dismissible(
                  key: Key(item.uid.toString()),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  secondaryBackground: Container(
                    color: Colors.green,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Icon(Icons.check, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      widget.selItem.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: direction == DismissDirection.startToEnd
                            ? Text("${item.name} removed")
                            : Text("${item.name} confirmed"),
                      ),
                    );
                  },
                  child: OrderCard(
                    photoProvider: item.imageProvider,
                    name: item.name,
                    price: item.totalPriceCents.toString(),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (widget.selItem.isNotEmpty) {
                String allItems = '';
                for (int index = 0; index < widget.selItem.length; index++) {
                  final item = widget.selItem[index];
                  allItems +=
                      '${index + 1}. ${item.name} - ${item.totalPriceCents.toString()}\n';
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            allItems,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Your order is empty'),
                  ),
                );
              }
            },
            child: const Text('Order Food'),
          ),
        ],
      ),
    );
  }
}
