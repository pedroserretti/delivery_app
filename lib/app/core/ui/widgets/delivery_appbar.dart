import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class DeliveryAppbar extends StatelessWidget {
  final Widget title;

  const DeliveryAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(right: 8),
      //     child: InkWell(
      //       onTap: () {},
      //       child: const Icon(EvaIcons.shopping_cart),
      //     ),
      //   ),
      // ],
      title: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 220,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(EvaIcons.arrow_down),
              const SizedBox(width: 5),
              Text(
                "Rua teste 12 - Ouro Preto",
                style: context.textStyles.textBold.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: title,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
