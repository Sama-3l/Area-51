// ignore_for_file: use_build_context_synchronously

import 'package:area_51/data/repositories/cart_Products.dart';
import 'package:area_51/data/repositories/wishlist_products.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../alogrithms/aes.dart';
import '../../business_logic/cubits/themeCubit/theme_cubit.dart';
import '../../constants/colors.dart';
import '../../constants/methods.dart';
import '../../data/models/user.dart';
import '../screens/mainApp.dart';
import 'login.dart';
import '../widgets/login/InputField.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  LightMode theme = DarkMode();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final users = FirebaseFirestore.instance.collection('Users');
  late CurrentUser user;
  Methods methods = Methods();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ThemeCubit(false),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            if (state.themeIsLight) {
              theme = LightMode();
            } else {
              theme = DarkMode();
            }
            return Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: theme.mainAccent,
                body: Stack(children: [
                  Align(
                    alignment: Alignment(0, -0.8),
                    child: AutoSizeText("Sign Up",
                        maxFontSize: 40,
                        minFontSize: 30,
                        style: GoogleFonts.poppins(
                            color: theme.oppAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: 40)),
                  ),
                  Align(
                      alignment: Alignment(0, -0.25),
                      child: FractionallySizedBox(
                        heightFactor: 0.4,
                        widthFactor: 0.9,
                        child: Container(
                            decoration: BoxDecoration(
                                color: theme.productAccent,
                                borderRadius: BorderRadius.circular(50)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: InputWidget(
                                      text: "Username",
                                      txt: username,
                                      error: false,
                                      theme: theme,
                                      fontSize: 18,
                                      hintColor: theme.oppAccent),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: InputWidget(
                                      text: "Password",
                                      txt: password,
                                      error: false,
                                      fontSize: 18,
                                      theme: theme,
                                      hintColor: theme.oppAccent),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 25, left: 70, right: 70),
                                    child: AspectRatio(
                                        aspectRatio: 5,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              BlocProvider.of<ThemeCubit>(
                                                      context)
                                                  .changeTheme();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: theme.oppAccent,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60))),
                                            child: Row(
                                              children: [
                                                Spacer(),
                                                Icon(
                                                  state.themeIsLight
                                                      ? CarbonIcons
                                                          .asleep_filled
                                                      : CarbonIcons.awake,
                                                  color: theme.oppAccent,
                                                  size: 35,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 3),
                                                    child: Text(
                                                      state.themeIsLight
                                                          ? "Dark Mode"
                                                          : "Light Mode",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: theme
                                                                  .oppAccent,
                                                              fontSize: 19,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    )),
                                                Spacer()
                                              ],
                                            )))),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: FractionallySizedBox(
                                      widthFactor: 0.5,
                                      heightFactor: 1,
                                      child: GestureDetector(
                                        onTap: () async {
                                          bool exists = false;
                                          int indexOfUser = 0;
                                          final ref = await FirebaseFirestore
                                              .instance
                                              .collection('Users')
                                              .get();
                                          for (int i = 0; i < ref.size; i++) {
                                            if (ref.docs.elementAt(i)['name'] ==
                                                username.text) {
                                              exists = true;
                                              indexOfUser = i;
                                            }
                                          }
                                          print(exists);
                                          if (!exists) {
                                            if (theme.runtimeType == DarkMode) {
                                              users.doc(username.text).set({
                                                'name': username.text,
                                                'password':
                                                    EncryptData.encryptAES(
                                                        password.text),
                                                'cart': null,
                                                'wishlist': null,
                                                'theme': 'Dark'
                                              });
                                            } else {
                                              users.doc(username.text).set({
                                                'name': username.text,
                                                'password':
                                                    EncryptData.encryptAES(
                                                        password.text),
                                                'cart': null,
                                                'wishlist': null,
                                                'theme': 'Light'
                                              });
                                            }
                                            CartProducts cartProducts =
                                                CartProducts();
                                            WishlistProducts wishlistProducts =
                                                WishlistProducts();
                                            final refAfterAddition =
                                                await FirebaseFirestore.instance
                                                    .collection('Users')
                                                    .get();
                                            for (int i = 0; i < refAfterAddition.size; i++) {
                                              if (refAfterAddition.docs
                                                      .elementAt(i)['name'] ==
                                                  username.text) {
                                                indexOfUser = i;
                                              }
                                            }
                                            print(indexOfUser);
                                            user = CurrentUser(
                                                cartProducts: cartProducts,
                                                username: ref.docs.elementAt(
                                                    indexOfUser)['name'],
                                                wishListProducts:
                                                    wishlistProducts,
                                                theme: theme);
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MyApp(
                                                                theme: theme,
                                                                currentUser:
                                                                    user)));
                                          } else {
                                            print('Already Exists');
                                          }
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: theme.mainAccent,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: theme.oppAccent)),
                                            child: Center(
                                              child: Text("Sign Up",
                                                  style: GoogleFonts.poppins(
                                                      color: theme.oppAccent,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 20)),
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      )),
                  Align(
                      alignment: Alignment(0, -0.65),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LogIn()));
                          },
                          child: AutoSizeText('Existing User? Log In',
                              maxFontSize: 12,
                              minFontSize: 9,
                              style: GoogleFonts.poppins(
                                  color: theme.oppAccent,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500))))
                ]));
          },
        ),
      ),
    );
  }
}
