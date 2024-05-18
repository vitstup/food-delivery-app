import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/pages/delivery_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void pay(){
    if(formKey.currentState!.validate()){
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text("Подтвердите оплату"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Номер карты: $cardNumber"),
                Text("Годна до: $expiryDate"),
                Text("Владелец: $cardHolderName"),
                Text("Cvv: $cvvCode")
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Отмена")),
            TextButton(onPressed: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DeliveryPage()));
            }, child: const Text("Подтверждаю")),
          ],
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Оплата"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CreditCardWidget(
            cardBgColor: Colors.red,
              isHolderNameVisible: true,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {}),

          // form

          CreditCardForm(
              inputConfiguration: const InputConfiguration(
                cardNumberDecoration: InputDecoration(labelText: "Номер карты"),
                expiryDateDecoration: InputDecoration(labelText: "Дата окончания"),
                cvvCodeDecoration: InputDecoration(labelText: "Cvv код"),
                cardHolderDecoration: InputDecoration(labelText: "Владелец карты")
              ),
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data){
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
              formKey: formKey),

          const SizedBox(height: 40),

          MyButton(onTap: pay, text: "Оплатить сейчас"),

          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
