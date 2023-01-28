import 'package:flutter/material.dart';
import 'package:klik_ustadz/packages/usztad.dart';
import 'package:klik_ustadz/styles/colors.dart';

import 'styles/font.dart';

class UstadzDetail extends StatelessWidget {
  final Ustadz us;
  const UstadzDetail({super.key, required this.us});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
            Center(
              child: SizedBox(
              width: 200,
              height: 200,
                child: CircleAvatar(
                  backgroundColor: customGreenSec,
                  child:  Text(us.initial!),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
                child: Text(
              us.name!,
              style: Headline18,
            )),
            Center(
                child: Text(
              us.location!,
              style: BodyGray,
            )),
            SizedBox(
              height: 20,
            ),
            Text(
              'Profil Ustadz',
              style: Headline14,
            ),
            Text(
              us.description!,
              style: BodyGray,
            ),
          ],
        ),
      ),
    );
  }
}
