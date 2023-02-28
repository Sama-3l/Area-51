import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(bool istheme) : super(ThemeState(themeIsLight: istheme));

  void changeTheme() => emit(ThemeState(themeIsLight: !state.themeIsLight));
}
