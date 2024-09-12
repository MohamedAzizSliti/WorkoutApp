import 'package:fitness_app/data/event_data.dart';
import 'package:fitness_app/model/WorkoutEvent.dart';
import 'package:fitness_app/style/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart'; // For date formatting

Color eventColor = const Color(0xffFFD54F); // Color for the event dot

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage>
    with SingleTickerProviderStateMixin {
  late Map<DateTime, List<WorkoutEvent>> _events;
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late final ValueNotifier<List<WorkoutEvent>> _selectedEvents;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    _events = getFakeEvents();
    _selectedEvents = ValueNotifier(_getEventsForDay(DateTime.now()));

    // Initialize the AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward(from: 0.0);

    // Set up the slide-right animation by starting from left (negative x value)
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Start from left side (-1.0)
      end: Offset.zero, // End at normal position (0, 0)
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Set up fade animation
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose the controller when done
    super.dispose();
  }

  List<WorkoutEvent> _getEventsForDay(DateTime day) {
    final normalizedDate = DateTime(day.year, day.month, day.day);
    return _events[normalizedDate] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _selectedEvents.value = _getEventsForDay(selectedDay);

      // Trigger the animation whenever the day is changed
      _animationController.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xffF1F2F5),
                  radius: 24,
                  child: Icon(Icons.map, color: primaryColor),
                ),
                const Text("Agenda",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
                CircleAvatar(
                  backgroundColor: const Color(0xffF1F2F5),
                  radius: 24,
                  child: Icon(Icons.more_horiz, color: primaryColor),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Calendar Widget
            TableCalendar<WorkoutEvent>(
              weekNumbersVisible: true,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: _calendarFormat,
              onDaySelected: _onDaySelected,
              eventLoader: _getEventsForDay,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: secondColor,
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronIcon: Icon(Icons.chevron_left,
                    color: Colors.green.withOpacity(0.5)),
                rightChevronIcon: Icon(Icons.chevron_right,
                    color: Colors.green.withOpacity(0.5)),
              ),
            ),
            const SizedBox(height: 16),
            // Animated Event List (Slide-Right)
            Expanded(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return SlideTransition(
                    position: _slideAnimation, // Slide from left to right
                    child: FadeTransition(
                      opacity: _fadeAnimation, // Apply fade-in effect
                      child: ValueListenableBuilder<List<WorkoutEvent>>(
                        valueListenable: _selectedEvents,
                        builder: (context, events, child) {
                          return events.isEmpty
                              ? const Center(
                                  child: Text('No events for selected day'))
                              : ListView.builder(
                                  itemCount: events.length,
                                  itemBuilder: (context, index) {
                                    final event = events[index];
                                    return AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                      margin:
                                          const EdgeInsets.only(bottom: 12.0),
                                      padding: const EdgeInsets.all(16.0),
                                      decoration: BoxDecoration(
                                        color: cardColor,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.fitness_center,
                                              color: primaryColor, size: 32),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  event.title,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  _formatEventTime(event),
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to format date and time
  String _formatEventTime(WorkoutEvent event) {
    final startTime = event.startTime;
    final formattedDate =
        DateFormat('EEEE d').format(startTime); // e.g., Monday 13
    final formattedTime =
        DateFormat('h:mm a').format(startTime); // e.g., 7:30 AM
    return '$formattedDate at $formattedTime';
  }
}
