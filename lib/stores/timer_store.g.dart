// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SingleTimer on _SingleTimer, Store {
  Computed<String>? _$timeComputed;

  @override
  String get time => (_$timeComputed ??=
          Computed<String>(() => super.time, name: '_SingleTimer.time'))
      .value;

  late final _$titleAtom = Atom(name: '_SingleTimer.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_SingleTimer.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$timeStampAtom =
      Atom(name: '_SingleTimer.timeStamp', context: context);

  @override
  int get timeStamp {
    _$timeStampAtom.reportRead();
    return super.timeStamp;
  }

  @override
  set timeStamp(int value) {
    _$timeStampAtom.reportWrite(value, super.timeStamp, () {
      super.timeStamp = value;
    });
  }

  late final _$workTimeAtom =
      Atom(name: '_SingleTimer.workTime', context: context);

  @override
  TimerModel get workTime {
    _$workTimeAtom.reportRead();
    return super.workTime;
  }

  @override
  set workTime(TimerModel value) {
    _$workTimeAtom.reportWrite(value, super.workTime, () {
      super.workTime = value;
    });
  }

  late final _$restTimeAtom =
      Atom(name: '_SingleTimer.restTime', context: context);

  @override
  TimerModel get restTime {
    _$restTimeAtom.reportRead();
    return super.restTime;
  }

  @override
  set restTime(TimerModel value) {
    _$restTimeAtom.reportWrite(value, super.restTime, () {
      super.restTime = value;
    });
  }

  late final _$durationAtom =
      Atom(name: '_SingleTimer.duration', context: context);

  @override
  Duration get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(Duration value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  late final _$intervalTypeAtom =
      Atom(name: '_SingleTimer.intervalType', context: context);

  @override
  IntervalType get intervalType {
    _$intervalTypeAtom.reportRead();
    return super.intervalType;
  }

  @override
  set intervalType(IntervalType value) {
    _$intervalTypeAtom.reportWrite(value, super.intervalType, () {
      super.intervalType = value;
    });
  }

  late final _$_SingleTimerActionController =
      ActionController(name: '_SingleTimer', context: context);

  @override
  void setTimerInfo(
      {required String title,
      required String description,
      required Duration duration}) {
    final _$actionInfo = _$_SingleTimerActionController.startAction(
        name: '_SingleTimer.setTimerInfo');
    try {
      return super.setTimerInfo(
          title: title, description: description, duration: duration);
    } finally {
      _$_SingleTimerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void start() {
    final _$actionInfo =
        _$_SingleTimerActionController.startAction(name: '_SingleTimer.start');
    try {
      return super.start();
    } finally {
      _$_SingleTimerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stop() {
    final _$actionInfo =
        _$_SingleTimerActionController.startAction(name: '_SingleTimer.stop');
    try {
      return super.stop();
    } finally {
      _$_SingleTimerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void restart() {
    final _$actionInfo = _$_SingleTimerActionController.startAction(
        name: '_SingleTimer.restart');
    try {
      return super.restart();
    } finally {
      _$_SingleTimerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
timeStamp: ${timeStamp},
workTime: ${workTime},
restTime: ${restTime},
duration: ${duration},
intervalType: ${intervalType},
time: ${time}
    ''';
  }
}

mixin _$MultiTimer on _MultiTimer, Store {
  late final _$_MultiTimerActionController =
      ActionController(name: '_MultiTimer', context: context);

  @override
  void addTimer(
      {required String title,
      required String description,
      required Duration duration}) {
    final _$actionInfo =
        _$_MultiTimerActionController.startAction(name: '_MultiTimer.addTimer');
    try {
      return super
          .addTimer(title: title, description: description, duration: duration);
    } finally {
      _$_MultiTimerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTimer(int index) {
    final _$actionInfo = _$_MultiTimerActionController.startAction(
        name: '_MultiTimer.removeTimer');
    try {
      return super.removeTimer(index);
    } finally {
      _$_MultiTimerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
