// ignore_for_file: prefer_const_constructors

import 'package:area_51/constants/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: ((context) => ThemeCubit()),
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
