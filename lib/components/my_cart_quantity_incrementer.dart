import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:get_it/get_it.dart';

class MyQuantityIncrementor extends StatefulWidget {
  final CartItem cartItem;
  final State parentState;

  const MyQuantityIncrementor({super.key, required this.cartItem, required this.parentState});

  @override
  State<MyQuantityIncrementor> createState() => _MyQuantityIncrementorState();
}

class _MyQuantityIncrementorState extends State<MyQuantityIncrementor> {

  void negativeIncrement(){
    if (widget.cartItem.quantity > 1){
        widget.cartItem.quantity--;
    }
    else{
      GetIt.I.get<Cart>().removeFromCart(widget.cartItem);
    }
    widget.parentState.setState(() {
      
    });
  }

  void positiveIncrement(){
    widget.parentState.setState(() {
      widget.cartItem.quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          IconButton(
              onPressed: negativeIncrement,
              icon: const Icon(Icons.remove),
              color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 4),
          Text(widget.cartItem.quantity.toString()),
          const SizedBox(width: 4),
          IconButton(
              onPressed: positiveIncrement,
              icon: const Icon(Icons.add),
              color: Theme.of(context).colorScheme.primary),
        ],
      ),
    );
  }
}
