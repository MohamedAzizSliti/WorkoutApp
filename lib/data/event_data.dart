import 'package:fitness_app/model/WorkoutEvent.dart';

Map<DateTime, List<WorkoutEvent>> getFakeEvents() {
  final today = DateTime.now();
  final yesterday = today.subtract(Duration(days: 1));
  final tomorrow = today.add(Duration(days: 1));
  final twoDaysAgo = today.subtract(Duration(days: 2));
  final threeDaysAgo = today.subtract(Duration(days: 3));
  final twoDaysLater = today.add(Duration(days: 2));
  final threeDaysLater = today.add(Duration(days: 3));

  return {
    // Events for three days ago
    DateTime(threeDaysAgo.year, threeDaysAgo.month, threeDaysAgo.day): [
      WorkoutEvent(
        title: 'Pilates Class',
        description: 'Focus on core strength and flexibility',
        startTime: threeDaysAgo.add(Duration(hours: 8)),
        endTime: threeDaysAgo.add(Duration(hours: 9)),
      ),
      WorkoutEvent(
        title: 'HIIT Session',
        description: 'High-intensity interval training',
        startTime: threeDaysAgo.add(Duration(hours: 17)),
        endTime: threeDaysAgo.add(Duration(hours: 18)),
      ),
    ],

    // Events for two days ago
    DateTime(twoDaysAgo.year, twoDaysAgo.month, twoDaysAgo.day): [
      WorkoutEvent(
        title: 'CrossFit',
        description: 'Intense full-body workout',
        startTime: twoDaysAgo.add(Duration(hours: 6)),
        endTime: twoDaysAgo.add(Duration(hours: 7)),
      ),
      WorkoutEvent(
        title: 'Kickboxing',
        description: 'Cardio and strength workout',
        startTime: twoDaysAgo.add(Duration(hours: 19)),
        endTime: twoDaysAgo.add(Duration(hours: 20)),
      ),
    ],

    // Yesterday's events
    DateTime(yesterday.year, yesterday.month, yesterday.day): [
      WorkoutEvent(
        title: 'Cardio Workout',
        description: 'High-intensity cardio session',
        startTime: yesterday.add(Duration(hours: 10)),
        endTime: yesterday.add(Duration(hours: 11)),
      ),
      WorkoutEvent(
        title: 'Zumba Dance',
        description: 'Fun and energetic dance workout',
        startTime: yesterday.add(Duration(hours: 18)),
        endTime: yesterday.add(Duration(hours: 19)),
      ),
    ],

    // Today's events
    DateTime(today.year, today.month, today.day): [
      WorkoutEvent(
        title: 'Strength Training',
        description: 'Focus on upper body',
        startTime: today.add(Duration(hours: 14)),
        endTime: today.add(Duration(hours: 15)),
      ),
      WorkoutEvent(
        title: 'Yoga for Beginners',
        description: 'Relaxing yoga session for beginners',
        startTime: today.add(Duration(hours: 18)),
        endTime: today.add(Duration(hours: 19)),
      ),
    ],

    // Tomorrow's events
    DateTime(tomorrow.year, tomorrow.month, tomorrow.day): [
      WorkoutEvent(
        title: 'Yoga Session',
        description: 'Relaxing and stretching',
        startTime: tomorrow.add(Duration(hours: 9)),
        endTime: tomorrow.add(Duration(hours: 10)),
      ),
      WorkoutEvent(
        title: 'Spinning Class',
        description: 'Cardio on a stationary bike',
        startTime: tomorrow.add(Duration(hours: 17)),
        endTime: tomorrow.add(Duration(hours: 18)),
      ),
    ],

    // Events for two days later
    DateTime(twoDaysLater.year, twoDaysLater.month, twoDaysLater.day): [
      WorkoutEvent(
        title: 'Bodybuilding',
        description: 'Focus on muscle building and strength',
        startTime: twoDaysLater.add(Duration(hours: 10)),
        endTime: twoDaysLater.add(Duration(hours: 11)),
      ),
      WorkoutEvent(
        title: 'Swimming',
        description: 'Endurance swimming session',
        startTime: twoDaysLater.add(Duration(hours: 16)),
        endTime: twoDaysLater.add(Duration(hours: 17)),
      ),
    ],

    // Events for three days later
    DateTime(threeDaysLater.year, threeDaysLater.month, threeDaysLater.day): [
      WorkoutEvent(
        title: 'Circuit Training',
        description: 'Full-body circuit workout',
        startTime: threeDaysLater.add(Duration(hours: 8)),
        endTime: threeDaysLater.add(Duration(hours: 9)),
      ),
      WorkoutEvent(
        title: 'Tai Chi',
        description: 'Relaxing martial arts session',
        startTime: threeDaysLater.add(Duration(hours: 18)),
        endTime: threeDaysLater.add(Duration(hours: 19)),
      ),
    ],
  };
}
