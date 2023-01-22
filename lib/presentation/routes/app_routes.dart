import 'package:area_51/constants/colors.dart';
import 'package:area_51/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:area_51/presentation/pages/productPage.dart';
import 'package:area_51/presentation/pages/catalog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubits/cartCubit/cart_cubit.dart';
import '../screens/cart.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings, LightMode theme, BuildContext context) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: ((context) => Home(theme: theme)));
      case '/product':
        return MaterialPageRoute(
            builder: ((context) => ProductPage(theme: theme)));
      case '/cart':
        DefaultTabController.of(context)!.animateTo(3);
        return null;
      default:
        return null;
    }
  }
}
