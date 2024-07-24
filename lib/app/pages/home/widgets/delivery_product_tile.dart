import 'dart:async';

import 'package:delivery_app/app/core/extensions/formatter_extension.dart';
import 'package:delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:delivery_app/app/dto/order_product_dto.dart';
import 'package:delivery_app/app/models/product_model.dart';
import 'package:delivery_app/app/pages/product_detail/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_controller.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;
  final OrderProductDto? orderProduct;

  const DeliveryProductTile({super.key, required this.product, required this.orderProduct});

  Future<dynamic> _openProductDetails(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return ProductDetailPage(product: product, order: orderProduct);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final controller = context.read<HomeController>();

        final orderProductResult = await _openProductDetails(context);
        // final orderProductResult = await Navigator.of(context).pushNamed('/productDetail', arguments: {
        // 'product': product,
        // 'order': orderProduct,
        // });

        if (orderProductResult != null) {
          controller.addOrUpdateBag(orderProductResult as OrderProductDto);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey[50],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        product.name,
                        style: context.textStyles.textExtraBold.copyWith(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        product.description,
                        style: context.textStyles.textRegular.copyWith(fontSize: 13),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        product.price.currencyPTBR,
                        style: context.textStyles.textMedium.copyWith(fontSize: 12, color: context.colors.secondary),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    product.imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    // loadingBuilder: (context, child, loadingProgress) {
                    //   if (loadingProgress == null) return child;
                    //   return Center(
                    //     child: Lottie.asset(
                    //       'assets/json/loading_product.json',
                    //       width: 50,
                    //       height: 50,
                    //       fit: BoxFit.contain,
                    //     ),
                    //   );
                    // },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<ImageInfo> _loadImage(String imageUrl) async {
  final Completer<ImageInfo> completer = Completer();
  final NetworkImage networkImage = NetworkImage(imageUrl);

  networkImage.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener(
          (ImageInfo info, bool synchronousCall) {
            completer.complete(info);
          },
          onError: (dynamic error, StackTrace? stackTrace) {
            completer.completeError(error);
          },
        ),
      );

  return completer.future;
}
