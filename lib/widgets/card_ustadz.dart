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
      child: SizedBox(
        width: 160,
        height: 240,
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
                      Expanded(
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Hero(
                              tag: 'img-${us.name}',
                              child: Container(
                                color: customGreenSec,
                                // child: avatar,
                                child: Image.asset(us.picture!),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const BookmarkButton(
                        iconSize: 18,
                      ),
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
                Row(
                  children: [
                    const Icon(Icons.location_pin, color: customGreen, size: 14,),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        us.location!,
                        style: body_12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookmarkButton extends StatefulWidget {
  final iconSize;

  const BookmarkButton({
    super.key,
    this.iconSize,
  });

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isSelectedBookmark = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.6),
      ),
      child: IconButton(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: isSelectedBookmark
            ? Icon(
                Icons.bookmark,
                color: customGreen,
                size: widget.iconSize,
              )
            : Icon(
                Icons.bookmark_border,
                color: customGreen,
                size: widget.iconSize,
              ),
        onPressed: () {
          setState(() {
            if (isSelectedBookmark == true) {
              isSelectedBookmark = false;
            } else {
              isSelectedBookmark = true;
            }
          });
        },
      ),
    );
  }
}
