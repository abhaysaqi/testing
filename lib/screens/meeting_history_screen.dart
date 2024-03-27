import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newtest/resources/firestore_methods.dart';

class Meeting_history extends StatelessWidget {
  const Meeting_history({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore_methods().Meeting_history,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: (snapshot.data! as dynamic).docs.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(
                      "Room Name: ${(snapshot.data! as dynamic).docs[index]['MeetingName']}",
                    ),
                    subtitle: Text(
                      "Room Name: ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['CreatedAt'].toDate())}",
                    ),
                  ));
        });
  }
}
