import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_cart_tile.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:get_it/get_it.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final Cart cart = GetIt.I.get<Cart>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Корзина"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context, 
                builder: (context) => AlertDialog(
                  title: const Text("Вы уверены, что хотите очистить корзину?"),
                  actions: [
                    // cancel btn
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Отмена"),
                    ),

                    // accept btn
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          cart.clearCart();
                        });
                      },
                      child: const Text("Да"),
                    ),
                  ],
                ));
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: cart.items.isEmpty? Center(child: Text("Корзина пуста...", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary))) :
      Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Row(
              children: [
                Text("Суммарно с вас: ${cart.totalCartPrice}", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 14)),
                const Icon(Icons.currency_ruble, size: 15)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) => MyCartTile(cartItem: cart.items[index], parentState: this,),
            ),
          ),
          MyButton(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage())), text: "Оплатить"),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}