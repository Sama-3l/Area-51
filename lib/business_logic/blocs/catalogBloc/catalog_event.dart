part of 'catalog_bloc.dart';

@immutable
abstract class CatalogEvent {
  final Product product;

  CatalogEvent(this.product);
}

class ShowProductEvent extends CatalogEvent {
  ShowProductEvent(super.product);
}

class ShowCatalogEvent extends CatalogEvent {
  ShowCatalogEvent(super.product);
}