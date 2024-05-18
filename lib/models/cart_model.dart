import 'package:collection/collection.dart';
import 'package:food_delivery_app/models/food_models.dart';
import 'package:intl/intl.dart';

class Cart{
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Food food, List<Addon> selectedAddons){
    CartItem? item = _items.firstWhereOrNull((element) {
      bool isFoodSame = element.food == food;

      bool isAddodsSame = const ListEquality().equals(element.addons, selectedAddons);

      return isFoodSame && isAddodsSame;
    } );

    if (item != null) { item.quantity++; }
    else{
      _items.add(CartItem(food: food, addons: selectedAddons));
    }
  }

  void removeFromCart(CartItem item){
    if (_items.contains(item)){
      if (item.quantity > 1) { item.quantity--; }
      else {
        _items.remove(item);
      }
    }
  }

  double get totalCartPrice{
    double totalPrice = 0;

    for(CartItem item in _items){
      totalPrice += item.totalPrice * item.quantity;
    }

    return totalPrice;
  }

  int get totalItemsAmount{
    int amount = 0;

    for(CartItem item in _items){
      amount += item.quantity;
    }

    return amount;
  }

  void clearCart(){
    _items.clear();
  }

  String displayCartReciept(){
    final reciept = StringBuffer();
    reciept.writeln("Вот, ваш чек.");
    reciept.writeln();

    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    reciept.writeln(formattedDate);
    reciept.writeln();
    reciept.writeln("----------");

    for(final item in items){
      reciept.writeln("${item.quantity} x ${item.food.name} - ${_formatPrice(item.food.price)}");

      if(item.addons.isNotEmpty){
        reciept.writeln("   Дополнительно: ${_formatAddons(item.addons)}");
      }
    }

    reciept.writeln("----------");
    reciept.writeln();
    reciept.writeln("Всего: $totalItemsAmount ");
    reciept.writeln("Суммарная стоимость: $totalCartPrice ₽");

    return reciept.toString();
  }

  static String _formatPrice(double price){
    return "$price ₽";
  }

  static String _formatAddons(List<Addon> addons){
    return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(", \n   ");
  }
}

class CartItem{
  Food food;
  List<Addon> addons;
  int quantity;

  CartItem({required this.food, required this.addons, this.quantity = 1});

  double get totalPrice{
    double totalPrice = food.price;
    for (Addon addon in addons){
      totalPrice += addon.price;
    }
    return totalPrice;
  }
}