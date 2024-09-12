import 'package:fitness_app/style/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class headerUser extends StatefulWidget {
  const headerUser({super.key});

  @override
  State<headerUser> createState() => _headerUserState();
}

class _headerUserState extends State<headerUser> {
  late String formattedDate;
  String formatTodayDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, d MMM').format(now);
    return formattedDate;
  }

  @override
  void initState() {
    formattedDate = formatTodayDate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(formattedDate,
                  style: TextStyle(fontSize: 14, color: Colors.grey[500])),
              Text('Have a nice day',
                  style: TextStyle(fontSize: 16, color: primaryColor)),
            ],
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor:
                Colors.grey[300], // Set your desired background color here
            child: ClipOval(
              child: Image.asset(
                "assets/images/woman.png",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
