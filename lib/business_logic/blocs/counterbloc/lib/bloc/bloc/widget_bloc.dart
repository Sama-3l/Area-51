import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'widget_event.dart';
part 'widget_state.dart';

class WidgetBloc extends Bloc<WidgetEvent, WidgetState> {
  WidgetBloc() : super(WidgetInitial(count: 0)) {
    on<ShowButtonsEvent>((event, emit) {
      emit(ShowButtonsState(count: 0));
    });
    on<ShowResultEvent>((event, emit) {
      emit(ShowResultState(count: event.count));
    });
  }
}
