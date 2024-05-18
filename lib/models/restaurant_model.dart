import 'package:food_delivery_app/models/food_models.dart';

class RestaurantModel{
    final List<Food> _menu = [
    // pizzas

    

    // burgers

    Food(
      name: "Биг Тейсти",
      description: "Биг Тейсти - это сандвич с большим, рубленым бифштексом из 100% натуральной свежей говядины на булочке «Биг Тейсти» с кунжутом. Особый шарм сандвичу придают 3 куска сыра «Эмменталь», два ломтика помидора, свежий салат, лук и пикантный соус «Гриль». Многие справедливо считают данный бургер самым вкусным в меню.",
      imagePath: "assets/bigTasty.jpg",
      price: 249,
      category: FoodCategory.burgers,
      availableAddons: [ Addon(name: "Халапенью", price: 20), Addon(name: "Бекон", price: 29), Addon(name: "Соус Биг тейсти", price: 20), ]
    ),

    Food(
      name: "Биг Мак",
      description: "Большой сандвич с двумя рублеными бифштексами из натуральной говядины на специальной булочке «Биг Мак», лук, два кусочка маринованных огурчиков, свежий салат и, конечно, «специальный соус, сыр - Чеддер». Именно так делают легендарный Биг Мак! Хочется добавить - «Вот что я люблю».",
      imagePath: "assets/BigMack.jpg",
      price: 349,
      category: FoodCategory.burgers,
      availableAddons: [ Addon(name: "Сыр", price: 20), Addon(name: "Соус Биг мак", price: 20), ]
    ),

    Food(
      name: "Гранд Де Люкс",
      description: "Гранд Де Люкс - это сочный бифштекс из натуральной говядины, приготовленный на гриле, карамелизованная булочка с кунжутом, два ломтика сыра Чеддер, свежий салат, кусочек помидора и лук, маринованные огурчики, кетчуп, горчица и специальный соус.",
      imagePath: "assets/grandDeluxe.png",
      price: 199,
      category: FoodCategory.burgers,
      availableAddons: [ Addon(name: "Сыр", price: 20) ]
    ),

    Food(
      name: "Чизбургер",
      description: "Чизбургер - это рубленый бифштекс из натуральной цельной 100% говядины с кусочками сыра «Чеддер» на карамелизованной булочке, заправка из горчицы, кетчуп, лук и кусочки маринованного огурчика.",
      imagePath: "assets/chizburger.jpg",
      price: 59,
      category: FoodCategory.burgers,
      availableAddons: [ Addon(name: "Сыр", price: 20), Addon(name: "Кетчуп", price: 20), Addon(name: "Горчица", price: 20),]
    ),

    // salads

    Food(
      name: "Цезарь",
      description: "Салат Цезарь - это смесь сочных листьев салата, помидоры «Черри», куриная котлетка в хрустящих панировочных сухарях и тертый сыр.",
      imagePath: "assets/salat_cezar.jpg",
      price: 149,
      category: FoodCategory.salads,
      availableAddons: []
    ),

    // deserts

    Food(
      name: "Картофель фри",
      description: "Картофель Фри - это порция хрустящих, золотистых, обжаренных в растительном фритюре и слегка посоленных соломок отборного картофеля.",
      imagePath: "assets/fri.jpg",
      price: 49,
      category: FoodCategory.deserts,
      availableAddons: [Addon(name: "Сырный соус", price: 29), Addon(name: "Кетчуп", price: 29), Addon(name: "Горчица", price: 29),]
    ),

    Food(
      name: "Снэк бокс",
      description: "Снэк Бокс - это три аппетитных Чикен МакНаггетс, 2 сочных и нежных Стрипса и порция хрустящего Картофеля Фри. Все куриное снэк-меню от Макдональдс в одном наборе!",
      imagePath: "assets/snek_box.jpg",
      price: 149,
      category: FoodCategory.deserts,
      availableAddons: [Addon(name: "Сырный соус", price: 29), Addon(name: "Кетчуп", price: 29), Addon(name: "Горчица", price: 29),]
    ),

    // drinks
    ];

    List<Food> get menu => _menu;

    // other stuff
}