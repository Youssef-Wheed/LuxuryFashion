import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';

  bool isShowCard = false;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const CustomAppbar(isBlack: false),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(20),
                Center(
                  child: CustomText(
                    text: 'payment method'.toUpperCase(),
                    spacing: 5,
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(5),
                Center(
                  child: Image.asset(
                    'assets/svgs/line.png',
                    width: 190,
                    color: Color(0xff555555),
                  ),
                ),
                Gap(15),

                ///visa
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isShowCard,
                  onCreditCardWidgetChange: (v) {},
                  cardBgColor: Colors.black,
                  isSwipeGestureEnabled: false,
                  isHolderNameVisible: true,
                ),

                ///form
                CreditCardForm(
                  formKey: _key,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onCreditCardModelChange,
                  isCardHolderNameUpperCase: true,
                ),
                Gap(130),

                CustomButton(
                  text: "Add card",
                  image: false,
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      final data = {
                        'number': cardNumber,
                        'name': cardHolderName,
                        'date': expiryDate,
                        'cvv': cvvCode,
                      };
                      Navigator.pop(context,data);
                    }

                  },
                ),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      expiryDate = data.expiryDate;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      isShowCard = data.isCvvFocused;
    });
  }
}
