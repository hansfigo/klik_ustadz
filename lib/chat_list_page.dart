import 'package:flutter/material.dart';

import 'styles/font.dart';


class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

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
                        icon: const Icon(Icons.arrow_back))
                    : const SizedBox(height: 0),
                const SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text(
                  'Chat Page',
                  style: headline_18,
                )),
              ],
            );
          },
        ),
      ));
  }
}



