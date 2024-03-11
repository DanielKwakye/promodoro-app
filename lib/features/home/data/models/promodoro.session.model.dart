import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:promodo/features/home/data/store/enums.dart';

part 'promodoro.session.model.g.dart';

@immutable
@CopyWith()
class PromodoroSessionModel extends Equatable{
  final PromodoroSession session;
  final int timeInSeconds;

  const PromodoroSessionModel({
    this.session = PromodoroSession.promodoro,
    this.timeInSeconds = 10
  });

  @override
  List<Object?> get props => [session, timeInSeconds];

}