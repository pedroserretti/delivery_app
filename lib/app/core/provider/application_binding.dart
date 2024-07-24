import 'package:delivery_app/app/core/rest%20client/custom_dio.dart';
import 'package:delivery_app/app/pages/product_detail/product_detail_controller.dart';
import 'package:delivery_app/app/repositories/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/auth/auth_repository.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;

  const ApplicationBinding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CustomDio(),
        ),
        Provider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            dio: context.read(),
          ),
        ),
        Provider<ProductDetailController>(
          create: (_) => ProductDetailController(),
        ),
      ],
      child: child,
    );
  }
}
