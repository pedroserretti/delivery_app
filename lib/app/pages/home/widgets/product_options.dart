import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ProductOptions extends StatefulWidget {
  const ProductOptions({super.key});

  @override
  State<ProductOptions> createState() => _ProductOptionsState();
}

class _ProductOptionsState extends State<ProductOptions> {
  List<String> items = ["Hamburguer", "Porções", "Sucos", "Refris", "Cervejas", "Sobremesas", "Molhos"];
  final ScrollController _listController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _listController,
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, item) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blueGrey[50],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                items[item],
                style: context.textStyles.textBold,
              ),
            ),
          ),
        );
      },
    );
  }
}
