import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class BestProducts extends StatelessWidget {
  const BestProducts(this.cardImage, this.cardText, {super.key});
  // const BestProducts(this.cardImage, this.cardText, this.onTap, {super.key});
  final NetworkImage cardImage;
  final String cardText;
  // final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, -2),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: cardImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(cardText, style: context.textStyles.textBold),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
