import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_cart_quantity_incrementer.dart';
import 'package:food_delivery_app/models/cart_model.dart';

class MyCartTile extends StatelessWidget {
  final State parentState;
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem, required this.parentState});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(cartItem.food.imagePath, height: 80),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartItem.food.name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary)),
                  Row(children: [Text(cartItem.totalPrice.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary)), const Icon(Icons.currency_ruble, size: 16)],),
                ],
              ),

              const Spacer(),
              
              MyQuantityIncrementor(cartItem: cartItem, parentState: parentState)
            ],
          ),
          SizedBox(
            height: cartItem.addons.isEmpty ? 0 : 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: cartItem.addons.map((addon) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilterChip(
                  label: Row(
                    children: [
                      Text(addon.name),
                      const SizedBox(width: 5),
                      Row(children: [Text(addon.price.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary)), const Icon(Icons.currency_ruble, size: 15)],),
                    ],
                  ),
                  shape: StadiumBorder(
                    side: BorderSide(color: Theme.of(context).colorScheme.primary)
                  ),
                  onSelected: (value) {},
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12
                  ),
                ),
              )).toList()
            ),
          )
        ],
      ),
    );
  }
}