// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/blocs/cartBloc/cart_bloc.dart';
import '../../business_logic/blocs/catalogBloc/catalog_bloc.dart';
import '../../business_logic/cubits/themeCubit/theme_cubit.dart';
import '../../constants/colors.dart';
import '../../data/models/user.dart';
import '../../data/repositories/cart_Products.dart';
import '../widgets/appNavigation/bottomNavBar.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.theme, required this.currentUser});

  LightMode theme;
  CurrentUser currentUser;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: ((context) =>
              ThemeCubit(theme.runtimeType == LightMode ? true : false)),
        ),
        BlocProvider<CartBloc>(create: ((context) => CartBloc())),
        BlocProvider<CatalogBloc>(create: ((context) => CatalogBloc())),
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
                  resizeToAvoidBottomInset: false,
                  extendBody: true,
                  body: BottomNavBarTabs(
                    state: state,
                    theme: theme,
                    user: currentUser,
                  ),
                  bottomNavigationBar: BottomNavBar(state: state, theme: theme),
                );
              },
            )),
      ),
    );
  }
}
