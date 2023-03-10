import 'dart:async';

import 'package:mobx/mobx.dart';

part 'timer_store.g.dart';

class SingleTimer = _SingleTimer with _$SingleTimer;

abstract class _SingleTimer with Store {
  Timer? stopwatch;

  @observable
  String title = '';

  @observable
  String description = '';

  @observable
  int timeStamp = 0;

  @observable
  TimerModel workTime = TimerModel(0, Status.initial);

  @observable
  Duration duration = Duration.zero;


  @computed
  String get time {
    final value = duration.toString().split(':');
    return "${value[0]}:${value[1]}:${value[2].split('.').first}";
  }

  @action
  void setTimerInfo({
    required String title,
    required String description,
    required Duration duration,
  }) {
    this.title = title;
    this.description = description;
    this.duration = duration;
    timeStamp = DateTime.now().millisecondsSinceEpoch;
  }

  @action
  void start() {
    workTime = workTime.newStatus(Status.started);
    stopwatch?.cancel();
    stopwatch = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (duration.inSeconds == 0) {
        stopwatch?.cancel();
        workTime = workTime.newStatus(Status.completed);
      } else {
        duration -= const Duration(seconds: 1);
      }
    });
  }

  @action
  void stop() {
    workTime = workTime.newStatus(Status.stopped);
    stopwatch?.cancel();
  }

  @action
  void restart() {
    workTime = workTime.newStatus(Status.initial);
    stopwatch?.cancel();
    duration = Duration(minutes: workTime.time);
  }
}

class TimerModel {
  final Status _status;
  final int _time;

  TimerModel(this._time, this._status);

  bool get wasStarted => _status == Status.started;

  bool get wasStopped => _status == Status.stopped;

  bool get wasCompleted => _status == Status.completed;

  bool get isInitial => _status == Status.initial;

  int get time => _time;
  Status get status => _status;

  TimerModel newStatus(Status newStatus) {
    return TimerModel(_time, newStatus);
  }
}

class MultiTimer = _MultiTimer with _$MultiTimer;

abstract class _MultiTimer with Store {
  final ObservableList<SingleTimer> timers = ObservableList<SingleTimer>.of([]);

  @action
  void addTimer({
    required String title,
    required String description,
    required Duration duration,
  }) {
    SingleTimer timer = SingleTimer();
    timer.setTimerInfo(
      title: title,
      description: description,
      duration: duration,
    );
    timers.add(timer);
  }

  @action
  void removeTimer(int index) {
    timers.removeAt(index);
  }
}

enum Status {
  initial,
  started,
  stopped,
  completed,
}
