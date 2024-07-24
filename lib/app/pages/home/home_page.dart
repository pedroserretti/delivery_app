import 'package:delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/pages/home/home_controller.dart';
import 'package:delivery_app/app/pages/home/home_state.dart';
import 'package:delivery_app/app/pages/home/widgets/best_products.dart';
import 'package:delivery_app/app/pages/home/widgets/home_search.dart';
import 'package:delivery_app/app/pages/home/widgets/shopping_bag_widget.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../core/base_state/base_state.dart';
import 'widgets/delivery_product_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  bool _isLoading = false;

  @override
  void onReady() {
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
            any: () async {
              await Future.delayed(const Duration(seconds: 2));
              setState(() => _isLoading = false);
            },
            loading: () => setState(() => _isLoading = true),
            error: () {
              showError(state.errorMessage ?? 'Erro não informado');
              setState(
                () => _isLoading = false,
              );
            },
          );
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          return Skeletonizer(
            enabled: _isLoading,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                const DeliveryAppbar(
                  title: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HomeSearch(),
                  ),
                ),
              ],
              body: Stack(
                children: [
                  ListView(
                    children: [
                      SizedBox(
                        height: context.screenHeight - 620,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            final product = state.products[index];
                            return BestProducts(NetworkImage(product.imageUrl), product.name);
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            final product = state.products[index];
                            final orders = state.shoppingBag.where((order) => order.product == product);
                            return DeliveryProductTile(
                              product: product,
                              orderProduct: orders.isNotEmpty ? orders.first : null,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Visibility(
                      visible: state.shoppingBag.isNotEmpty,
                      child: ShoppingBagWidget(bag: state.shoppingBag),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
