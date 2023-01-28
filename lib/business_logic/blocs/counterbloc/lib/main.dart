// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:counterbloc/bloc/counter_bloc.dart';
import 'package:counterbloc/model/Product.dart';
import 'package:counterbloc/model/cartProducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc/widget_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => WidgetBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key, required String title});

  late String title = "";
  CartProducts cart = CartProducts(cartProducts: []);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: TabBarView(children: [
          Home(cart: cart),
          Search(cart: cart),
        ]),
        bottomNavigationBar: TabBar(tabs: [
          Icon(
            Icons.home,
            color: Colors.black,
          ),
          Icon(
            Icons.search,
            color: Colors.black,
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final bloc = BlocProvider.of<CounterBloc>(context)
                .add(AddProduct(cart: cart));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key, required this.cart}) : super(key: key);

  late CartProducts cart;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Expanded(child: BlocBuilder<WidgetBloc, WidgetState>(
            builder: (context, state) {
              if (state is ShowButtonsState)
                return ButtonList();
              else if (state is ShowResultState)
                return Container(
                  color: Colors.red,
                  child: Text(
                    '${state.count}',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                );
              else
                return ButtonList();
            },
          )),
        ],
      ),
    );
  }
}

class ButtonList extends StatelessWidget {
  const ButtonList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ElevatedButton(onPressed: () {
        final bloc = BlocProvider.of<WidgetBloc>(context).add(ShowResultEvent(count: 1));
      }, child: Text("To Display 1")),
      ElevatedButton(onPressed: () {
        final bloc = BlocProvider.of<WidgetBloc>(context).add(ShowResultEvent(count: 2));
      }, child: Text("To Display 2")),
      ElevatedButton(onPressed: () {
        final bloc = BlocProvider.of<WidgetBloc>(context).add(ShowResultEvent(count: 3));
      }, child: Text("To Display 3")),
      ElevatedButton(onPressed: () {
        final bloc = BlocProvider.of<WidgetBloc>(context).add(ShowResultEvent(count: 4));
      }, child: Text("To Display 4")),
      ElevatedButton(onPressed: () {
        final bloc = BlocProvider.of<WidgetBloc>(context).add(ShowResultEvent(count: 5));
      }, child: Text("To Display 5")),
    ]);
  }
}

class Search extends StatelessWidget {
  Search({Key? key, required this.cart}) : super(key: key);

  CartProducts cart;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              final bloc = BlocProvider.of<CounterBloc>(context)
                  .add(AddProduct(cart: cart));
              DefaultTabController.of(context).animateTo(0);
            },
            child: Text('hello')));
  }
}
