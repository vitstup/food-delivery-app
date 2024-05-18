import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_reciept.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/services/database/firestore.dart';
import 'package:get_it/get_it.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {

  String reciept = GetIt.I.get<Cart>().displayCartReciept();
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();
    
    try{
      db.saveOrderToDatabase(reciept);
    }
    catch (E){
      showDialog(context: context, builder: (context) => const AlertDialog(title: Text("Ошибка, ваш заказ не принят, свяжитесь пожалуйста с тех поддержкой")));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Доставка в процессе..."),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text("Спасибо за покупку!"),
              MyReciept(reciept: reciept),
              const Text("Ожидайте... Доставят через ~ 66 минут"),
            ],
          ),
        ],
      ),
    );
  }
}