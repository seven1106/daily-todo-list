part of 'day_bloc.dart';

class DayState {
  final List<DayModel> allDays;
  final List<DayModel> removedDays;
  const DayState({
    this.allDays = const <DayModel>[],
    this.removedDays = const <DayModel>[],
  });

  Map<String, dynamic> toMap() {
    return {
      'allDays': allDays.map((x) => x.toMap()).toList(),
      'removedDays': removedDays.map((x) => x.toMap()).toList(),
    };
  }

  factory DayState.fromMap(Map<String, dynamic> map) {
    return DayState(
      allDays: List<DayModel>.from(map['allDays']?.map((x) => DayModel.fromMap(x))),
      removedDays: List<DayModel>.from(map['removedDays']?.map((x) => DayModel.fromMap(x))),
    );
  }

}

final class DayInitial extends DayState {}
