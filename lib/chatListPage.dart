import 'package:flutter/material.dart';

import 'styles/font.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: LayoutBuilder(
          builder: (p0, p1) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                p1.maxWidth >= 600
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back))
                    : SizedBox(height: 0),
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text(
                  'Chat Page',
                  style: Headline18,
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}
