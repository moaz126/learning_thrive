import 'package:learning_thrive/screens/LocateTutor.dart';
import 'package:learning_thrive/screens/ScheduleMeeting/calendar.dart';
import 'package:learning_thrive/screens/tutor_login/messaging/constants.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            BackButton(),
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/user_2.png"),
            ),
            const SizedBox(width: kDefaultPadding * 0.75),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Ali Arsam",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Online",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.local_phone),
            onPressed: () {
              Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => schedule_meeting()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => schedule_meeting()));
            },
          ),
          SizedBox(width: kDefaultPadding / 2),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          child: SafeArea(
            child: Row(
              children: [
                Icon(Icons.mic, color: kPrimaryColor),
                SizedBox(width: kDefaultPadding),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 0.75,
                    ),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.sentiment_satisfied_alt_outlined,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.64),
                        ),
                        SizedBox(width: kDefaultPadding / 4),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Type message",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.attach_file,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.64),
                        ),
                        SizedBox(width: kDefaultPadding / 4),
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.64),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
