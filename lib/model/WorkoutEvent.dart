// Model class for WorkoutEvent
class WorkoutEvent {
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;

  WorkoutEvent({
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
  });
}