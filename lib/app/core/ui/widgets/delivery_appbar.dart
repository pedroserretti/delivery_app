import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class DeliveryAppbar extends AppBar {
  DeliveryAppbar(BuildContext context, {super.key, double elevation = 0.5})
      : super(
          elevation: elevation,
          title: Row(
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
        );
}
