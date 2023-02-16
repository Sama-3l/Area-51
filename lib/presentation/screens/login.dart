// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:area_51/constants/colors.dart';
import 'package:area_51/constants/methods.dart';
import 'package:area_51/data/repositories/cart_Products.dart';
import 'package:area_51/data/repositories/wishlist_products.dart';
import 'package:area_51/main.dart';
import 'package:area_51/presentation/screens/mainApp.dart';
import 'package:area_51/presentation/widgets/login/InputField.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:area_51/alogrithms/aes.dart';

import '../../data/models/product.dart';
import '../../data/models/user.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  LightMode theme = LightMode();

  bool checkInput(String text) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogInForm(theme: theme),
    );
  }
}

class LogInForm extends StatelessWidget {
  LogInForm({
    super.key,
    required this.theme,
  });

  final LightMode theme;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final users = FirebaseFirestore.instance.collection('Users');
  late CurrentUser user;
  Methods methods = Methods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.mainAccent,
        body: Stack(children: [
          Align(
            alignment: Alignment(0, -0.75),
            child: AutoSizeText("Log In",
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
                heightFactor: 0.3,
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
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: FractionallySizedBox(
                              widthFactor: 0.5,
                              heightFactor: 1,
                              child: GestureDetector(
                                onTap: () async {
                                  bool exists = false;
                                  int indexOfUser = 0;
                                  final ref = await FirebaseFirestore.instance
                                      .collection('Users')
                                      .get();
                                  for (int i = 0; i < ref.size; i++) {
                                    if (ref.docs.elementAt(i)['name'] ==
                                        username.text) {
                                      exists = true;
                                      indexOfUser = i;
                                    }
                                  }
                                  /*users.doc(username.text).set({
                                      'name': username.text,
                                      'password':
                                          EncryptData.encryptAES(password.text),
                                      'cart': null,
                                      'wishlist': null
                                    });*/
                                  if (!exists) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUp(theme: theme)));
                                    /*users.doc(username.text).set({
                                      'name': username.text,
                                      'password':
                                          EncryptData.encryptAES(password.text),
                                      'cart': null,
                                      'wishlist': null
                                    });*/
                                  } else {
                                    CartProducts cart = CartProducts();
                                    WishlistProducts wishlist =
                                        WishlistProducts();
                                    if (ref.docs.elementAt(
                                                indexOfUser)['password'] ==
                                            EncryptData.encryptAES(
                                                password.text) &&
                                        ref.docs.elementAt(
                                                indexOfUser)['name'] ==
                                            username.text) {
                                      if (ref.docs
                                              .elementAt(indexOfUser)['cart'] !=
                                          null) {
                                        List<Map> tempList = [];
                                        for (int i = 0;
                                            i <
                                                ref.docs
                                                    .elementAt(
                                                        indexOfUser)['cart']
                                                    .length;
                                            i++) {
                                          tempList.add(methods.initializeObject(
                                              ref.docs.elementAt(
                                                  indexOfUser)['cart'][i]));
                                        }
                                        cart.cartProducts = tempList;
                                      }
                                      if (ref.docs.elementAt(
                                              indexOfUser)['wishlist'] !=
                                          null) {
                                        List<Map> tempList = [];
                                        for (int i = 0;
                                            i <
                                                ref.docs
                                                    .elementAt(
                                                        indexOfUser)['cart']
                                                    .length;
                                            i++) {
                                          tempList.add(methods.initializeObject(
                                              ref.docs.elementAt(
                                                  indexOfUser)['wishlist'][i]));
                                        }
                                        wishlist.wishlist = tempList;
                                      }
                                      user = CurrentUser(
                                          cartProducts: cart,
                                          username: ref.docs
                                              .elementAt(indexOfUser)['name'],
                                          wishListProducts: wishlist);
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) => MyApp(
                                                  theme: theme,
                                                  currentUser: user)));
                                    }
                                  }
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: theme.mainAccent,
                                        borderRadius: BorderRadius.circular(50),
                                        border:
                                            Border.all(color: theme.oppAccent)),
                                    child: Center(
                                      child: Text("Log In",
                                          style: GoogleFonts.poppins(
                                              color: theme.oppAccent,
                                              fontWeight: FontWeight.w300,
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
              alignment: Alignment(0, -0.6),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => SignUp(theme: theme)));
                  },
                  child: AutoSizeText('New User? Sign up',
                      maxFontSize: 12,
                      minFontSize: 9,
                      style: GoogleFonts.poppins(
                          color: theme.oppAccent,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500))))
        ]));
  }
}

class SignUp extends StatefulWidget {
  SignUp({super.key, required this.theme});

  LightMode theme;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
