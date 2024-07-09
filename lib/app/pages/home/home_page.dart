import 'package:delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/pages/home/home_controller.dart';
import 'package:delivery_app/app/pages/home/home_state.dart';
import 'package:delivery_app/app/pages/home/widgets/shopping_bag_widget.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../core/base_state/base_state.dart';
import 'widgets/delivery_product_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  int _selectedIndex = 0;
  @override
  void onReady() {
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      bottomNavigationBar: NavigationBar(
        height: 50,
        elevation: 1,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(icon: _selectedIndex == 0 ? Icon(Iconsax.home_2_bold, color: ColorsApp.i.primary) : const Icon(Iconsax.home_2_outline, color: Colors.grey), label: "Início"),
          NavigationDestination(icon: _selectedIndex == 1 ? Icon(Iconsax.receipt_2_1_bold, color: ColorsApp.i.primary) : const Icon(Iconsax.receipt_2_1_outline, color: Colors.grey), label: "Pedidos"),
          NavigationDestination(icon: _selectedIndex == 2 ? Icon(BoxIcons.bxs_user, color: ColorsApp.i.primary) : const Icon(BoxIcons.bx_user, color: Colors.grey), label: "Conta"),
        ],
      ),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
              any: () => hideLoader(),
              loading: () => showLoader(),
              error: () {
                hideLoader();
                showError(state.errorMessage ?? 'Erro não informado');
              });
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      final orders = state.shoppingBag.where((order) => order.product == product);
                      return DeliveryProductTile(
                        product: product,
                        orderProduct: orders.isNotEmpty ? orders.first : null,
                      );
                    }),
              ),
              Visibility(visible: state.shoppingBag.isNotEmpty, child: ShoppingBagWidget(bag: state.shoppingBag)),
            ],
          );
        },
      ),
    );
  }
}
