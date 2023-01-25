// ignore_for_file: prefer_const_constructors

import 'package:area_51/business_logic/blocs/bloc/cart_bloc.dart';
import 'package:area_51/constants/colors.dart';
import 'package:area_51/data/repositories/cart_Products.dart';
import 'package:area_51/presentation/routes/app_routes.dart';
import 'package:area_51/presentation/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/screens/home.dart';
import 'constants/colors.dart';

import 'package:area_51/business_logic/cubits/themeCubit/theme_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  LightMode theme = LightMode();
  CartProducts cart = CartProducts();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: ((context) => ThemeCubit()),
        ),
        BlocProvider<CartBloc>(create: ((context) => CartBloc()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 4,
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                if (state.themeIsLight) {
                  theme = LightMode();
                } else {
                  theme = DarkMode();
                }
                return Scaffold(
                  backgroundColor: theme.mainAccent,
                  body: BottomNavBarTabs(
                    cart: cart,
                    state: state,
                    theme: theme,
                  ),
                  bottomNavigationBar: BottomNavBar(state: state, theme: theme),
                );
              },
            )),
      ),
    );
  }
}
