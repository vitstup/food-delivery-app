import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_models.dart';

class MyFoodTile extends StatelessWidget{

  final Food food;
  final Function()? onTap;

  const MyFoodTile({super.key, required this.food, required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
        color: Colors.white,  
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary)),
                  Row(children: [Text(food.price.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary)), const Icon(Icons.currency_ruble, size: 16)],),
                  Text(food.description, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),

            const SizedBox(width: 10),

            Image.asset(food.imagePath, height: 120)
          ],
        ),
      ),
    );
  }

}