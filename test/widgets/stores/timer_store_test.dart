import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer/stores/timer_store.dart';
import 'package:mobx/mobx.dart';



final customContext = ReactiveContext();


void main() {
  group("test $MultiTimer", () {
    late MultiTimer store;

    setUp(() {
      store=MultiTimer();
    });
    test('each store should contain title, description and duration', () {
      store.addTimer(
        title: "title 1",
        description: "description 1",
        duration: const Duration(minutes: 1),
      );

      store.addTimer(
        title: "title 2",
        description: "description 2",
        duration: const Duration(minutes: 1),
      );

      expect(store.timers.length, 2);
    });

  });

  group("test $SingleTimer", () {
    late SingleTimer store;

    setUp(() {
      store = SingleTimer();
      store.setTimerInfo(
        title: "title",
        description: "description",
        duration: const Duration(minutes: 1),
      );
    });

    test('each store should contain title, description and duration', () {
      expect(store.title, "title");
      expect(store.description, "description");
      expect(store.duration, const Duration(minutes: 1));
    });

  });

}