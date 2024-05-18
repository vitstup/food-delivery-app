import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/food_models.dart';
import 'package:get_it/get_it.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodDetailsPage({super.key, required this.food}){
    for (Addon addon in food.availableAddons){
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {

  void addToCart(){
    Cart cart = GetIt.I.get<Cart>();

    List<Addon> currentlySelectedAddons = [];

    for(Addon addon in widget.food.availableAddons){
      if (widget.selectedAddons[addon] == true){
        currentlySelectedAddons.add(addon);
      }
    }

    cart.addToCart(widget.food, currentlySelectedAddons);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              Image.asset(widget.food.imagePath, height: 300,),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white
                      ),
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(widget.food.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary)),
                      
                            Row(children: [Text(widget.food.price.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary)), const Icon(Icons.currency_ruble, size: 16)],),
                      
                            Text(widget.food.description, style: const TextStyle(fontSize: 14)),
                      
                            const Divider(),
                      
                            Text("Дополнительно", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary)),
                      
                            ListView.builder(
                              shrinkWrap: true, 
                              physics: const NeverScrollableScrollPhysics(), 
                              itemCount: widget.food.availableAddons.length,
                              itemBuilder: (context, index){
                                Addon addon = widget.food.availableAddons[index];
                      
                                return CheckboxListTile(
                                  title: Text(addon.name),
                                  subtitle: Row(children: [Text(addon.price.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary)), const Icon(Icons.currency_ruble, size: 16)],),
                                  value: widget.selectedAddons[addon], 
                                  onChanged: (value){
                                    setState(() {
                                      widget.selectedAddons[addon] = value!;
                                    });
                                  });
                            }),
                      
                            const Divider(),
                      
                            const SizedBox(height: 15),
                      
                            MyButton(onTap: addToCart, text: "В корзину")
                        ],
                      ),
                    ),
                  )
            ],
          )
        ),

        SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              shape: BoxShape.circle
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              iconSize: 30,
              onPressed: () => Navigator.pop(context),
            ),
          ),
        )

      ],
    );
  }
}