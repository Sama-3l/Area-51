// ignore_for_file: prefer_const_constructors_in_immutables

part of 'catalog_bloc.dart';

@immutable
abstract class CatalogState {
  final Product product;

  CatalogState(this.product);
}

class CatalogStateInitial extends CatalogState{
  CatalogStateInitial(super.product);
}

class ShowProductState extends CatalogState {
  ShowProductState(super.product);
}

class ShowCatalogState extends CatalogState {
  ShowCatalogState(super.product);
}