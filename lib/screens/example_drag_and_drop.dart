import 'package:flutter/material.dart';
import 'package:order_food/models/costumor.dart';
import 'package:order_food/models/item.dart';
import 'package:order_food/screens/order_page.dart';
import 'package:order_food/widgets/customer_cart.dart';
import 'package:order_food/widgets/dragging_list_item.dart';
import 'package:order_food/widgets/menu_list_item.dart';
import '../data/items.dart';

@immutable
class ExampleDragAndDrop extends StatefulWidget {
  const ExampleDragAndDrop({super.key});

  @override
  State<ExampleDragAndDrop> createState() => _ExampleDragAndDropState();
}

class _ExampleDragAndDropState extends State<ExampleDragAndDrop>
    with TickerProviderStateMixin {
  final Customer _person = Customer(
    name: 'Болд',
    imageProvider: const NetworkImage(
      'https://www.allprodad.com/wp-content/uploads/2021/03/05-12-21-happy-people.jpg',
    ),
  );

  final GlobalKey _draggableKey = GlobalKey();

  // Хэрэглэгч дээр хоол нэмэх
  void _itemDroppedOnCustomerCart({
    required Item item,
    required Customer customer,
  }) {
    setState(() {
      customer.items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Color(0xFFF64209)),
      title: Text(
        'Order Food',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 36,
              color: const Color(0xFFF64209),
              fontWeight: FontWeight.bold,
            ),
      ),
      backgroundColor: const Color(0xFFF7F7F7),
      elevation: 0,
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _buildMenuList(),
              ),
              _buildPeopleRow(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuList() {
    List<Item> items = getMenuItems();
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 1,
        );
      },
      itemBuilder: (context, index) {
        final item = items[index];
        return _buildMenuItem(
          item: item,
        );
      },
    );
  }

  Widget _buildMenuItem({
    required Item item,
  }) {
    //Gesture detector
    return LongPressDraggable<Item>(
      data: item,
      dragAnchorStrategy:
          pointerDragAnchorStrategy, //feeled after move to change
      feedback: DraggingListItem(
        //after than do
        dragKey: _draggableKey,
        photoProvider: item.imageProvider,
      ),
      child: MenuListItem(
        name: item.name,
        price: item.formattedTotalItemPrice,
        photoProvider: item.imageProvider,
      ),
    );
  }

  Widget _buildPeopleRow() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 20,
      ),
      child: Row(
        children: [
          _buildPersonWithDropZone(_person),
        ],
      ),
    );
  }

//drop drag
  Widget _buildPersonWithDropZone(Customer customer) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Order(selItem: customer.items),
              ),
            );
          },
          child: DragTarget<Item>(
            builder: (context, candidateItems, rejectedItems) {
              return CustomerCart(
                hasItems: customer.items.isNotEmpty,
                highlighted: candidateItems.isNotEmpty,
                customer: customer,
              );
            },
            onAcceptWithDetails: (details) {
              _itemDroppedOnCustomerCart(
                item: details.data,
                customer: customer,
              );
            },
          ),
        ),
      ),
    );
  }
}
