import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer.dart';
import 'package:food_delivery_app/components/my_food_tile.dart';
import 'package:food_delivery_app/models/food_models.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:food_delivery_app/pages/cart_page.dart';
import 'package:food_delivery_app/pages/food_details_page.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  List<Food> filterMenuByCategory(FoodCategory category, List<Food> menu ){
    return menu.where((food) => food.category == category).toList();
  }

  ListView getWidgetsOfThisFood(List<Food> food){
    return ListView.builder(
      itemCount: food.length,
      //physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        return Column(
          children: [
            MyFoodTile(food: food[index], onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailsPage(food: food[index])))),
            const Divider(
              height: 2,
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: FoodCategory.values.length,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/bear.png", height: 48),
              const SizedBox(width: 5),
              const Text("Медведь")
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage())), 
              icon: const Icon(Icons.shopping_cart_outlined))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
              child: Icon(Icons.local_pizza_outlined),
            ),
            Tab(
              child: Icon(Icons.fastfood_outlined),
            ),
            Tab(
              child: Icon(Icons.food_bank_outlined),
            ),
            Tab(
              child: Icon(Icons.cake_outlined),
            ),
            Tab(
              child: Icon(Icons.local_drink_outlined),
            ),
            ],
          ),
        ),
        drawer: const MyDrawer(),
        body: TabBarView(
          physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            getWidgetsOfThisFood(filterMenuByCategory(FoodCategory.pizzas, GetIt.I.get<RestaurantModel>().menu)),
            getWidgetsOfThisFood(filterMenuByCategory(FoodCategory.burgers, GetIt.I.get<RestaurantModel>().menu)),
            getWidgetsOfThisFood(filterMenuByCategory(FoodCategory.salads, GetIt.I.get<RestaurantModel>().menu)),
            getWidgetsOfThisFood(filterMenuByCategory(FoodCategory.deserts, GetIt.I.get<RestaurantModel>().menu)),
            getWidgetsOfThisFood(filterMenuByCategory(FoodCategory.drinks, GetIt.I.get<RestaurantModel>().menu)),
          ],
        ),
        )
    );
  }

}