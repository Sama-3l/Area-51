import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc()
      : super(
            CatalogStateInitial(Product(price: 999, name: "", description: ""))) {
    on<ShowCatalogEvent>((event, emit) {
      emit(ShowCatalogState(event.product));
    });
    on<ShowProductEvent>((event, emit) {
      emit(ShowProductState(event.product));
    });
  }
}
