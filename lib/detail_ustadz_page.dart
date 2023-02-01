import 'package:flutter/material.dart';
import 'package:klik_ustadz/packages/usztad.dart';
import 'package:klik_ustadz/styles/colors.dart';

import 'styles/font.dart';

class UstadzDetail extends StatelessWidget {
  final Ustadz us;
  final Widget avatar;
  const UstadzDetail({super.key, required this.us, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical : 20, horizontal : 42.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: customGreen,
            textStyle: const TextStyle(color: Colors.white),
          ),
          onPressed: () {},
          child: Text('Hubungi Ustadz', style: buttonWhite_14,),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                      color: customGreenSec, shape: BoxShape.circle),
                  child: Hero(
                    tag: 'img-${us.name}',
                    child: avatar,
                    // child: CircleAvatar(
                    //   backgroundColor: customGreenSec,
                    //   backgroundImage: avatar,
                    //   // child:  Text(us.initial!),
                    // ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                  child: Text(
                us.name!,
                style: headline_18,
              )),
              Center(
                  child: Text(
                us.location!,
                style: bodyGray_12,
              )),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Profil Ustadz',
                style: headline_14,
              ),
              Text(
                us.description!,
                style: bodyGray_12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
