import 'package:flutter/material.dart';

import 'styles/font.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                  'Profile Page',
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