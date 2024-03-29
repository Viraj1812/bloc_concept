import 'package:bloc_concept/logic/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  CounterCubit counterCubit = CounterCubit();
  group('CounterCubit', () {
    setUp(() {
      counterCubit;
    });

    test('the initial state for the CounterCubit is CounterState(counterValue:0)', () {
      expect(
        const CounterState(counterValue: 0),
        counterCubit.state,
      );
    });

    blocTest(
      'the cubit should emit a CounterState(counterValue:1, wasIncremented: true) when cubit.increment() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [const CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest(
      'the cubit should emit a CounterState(counterValue:-1, wasIncremented: false) when cubit.decrement() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [const CounterState(counterValue: -1, wasIncremented: false)],
    );
  });

  tearDown(() {
    counterCubit.close();
  });
}
