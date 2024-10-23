import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litpages/config/utils/helper_widgets.dart';
import 'package:litpages/features/detail/pages/detail_screen.dart';
import 'package:litpages/features/home/models/book_listing_model.dart';

class BookCardWidget extends StatelessWidget {
  final BookListingModel bookData;
  const BookCardWidget({super.key, required this.bookData});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailScreen(keyStr: bookData.id))),
      child: SizedBox(
        width: size.width * 0.3,
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
              BorderRadius.circular(12),
              child: Image.network(
                "https://manybooks.net/${bookData.poster}",
                fit: BoxFit.cover,
                height: 180,
                width: size.width * 0.3,
              ),
            ),
            verticalGap(8),
            Text(
              bookData.title,
              style: GoogleFonts.nunitoSans(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
