import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super((CounterState(countValue: 0)));

  void incriment() =>
      emit(CounterState(countValue: state.countValue + 1, isIncrimented: true));

  void decriment() => emit(
      CounterState(countValue: state.countValue - 1, isIncrimented: false));
}
