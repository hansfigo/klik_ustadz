import 'package:flutter/material.dart';
import 'package:klik_ustadz/packages/usztad.dart';
import 'package:klik_ustadz/styles/colors.dart';
import 'package:klik_ustadz/styles/font.dart';
import 'package:klik_ustadz/detail_ustadz_page.dart';

class UstadzCard extends StatelessWidget {
  final Ustadz us;
  final Widget avatar;
  const UstadzCard({Key? key, required this.us, required this.avatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(seconds: 1),
                pageBuilder: (_, __, ___) => UstadzDetail(
                      us: us,
                      avatar: avatar,
                    )));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Hero(
                        tag: 'img-${us.name}',
                        child: Container(
                          width: 100,
                          height: 100,
                          color: customGreenSec,
                          child: avatar,
                        ),
                      ),
                    ),
                    const BookmarkButton(),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                us.name!,
                style: headline_12,
              ),
              Text(
                us.location!,
                style: body_12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({super.key});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isSelectedBookmark = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isSelectedBookmark
          ? const Icon(
              Icons.bookmark, color: customGreen,
            )
          : const Icon(
              Icons.bookmark_border, color: customGreen,
            ),
      onPressed: () {
        setState(() {
          if (isSelectedBookmark == true) {
            isSelectedBookmark = false;
          }else{
            isSelectedBookmark = true;
          }
          
        });
      },
    );
  }
}
