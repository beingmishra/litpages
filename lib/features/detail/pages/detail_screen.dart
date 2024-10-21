import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litpages/config/theme/app_colors.dart';
import 'package:litpages/config/utils/helper_widgets.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({super.key});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.75,
              child: Stack(
                children: [
                  Image.network(
                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg",
                    fit: BoxFit.cover,
                    height: size.height * 0.75,
                    width: size.width,
                  ),
                  Container(
                    height: size.height * 0.75,
                    width: size.width,
                    color: AppColors.primaryColor.withOpacity(0.9),
                  ),
                  SafeArea(
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.arrow_back_ios_new, color: Colors.white,),
                                Text("Details", style: GoogleFonts.nunitoSans(
                                  fontSize: 18
                                ),),
                                const Icon(Icons.favorite_border, color: Colors.white,)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg",
                                    fit: BoxFit.cover,
                                    height: 220,
                                    width: size.width * 0.38,
                                  ),
                                ),
                                verticalGap(8),
                                Text(
                                  "Book name",
                                  style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                verticalGap(4),
                                Text(
                                  "James robin",
                                  style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: const Color(0xff6B3F87).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text("0.0", style: GoogleFonts.nunitoSans(
                                      fontSize: 18
                                    ),),
                                    verticalGap(4),
                                    Text("Ratings", style: GoogleFonts.nunitoSans(
                                      color: AppColors.hintColor
                                    ),)
                                  ],
                                ),
                                Container(
                                  width: 2,
                                  height: 45,
                                  color: AppColors.hintColor,
                                ),
                                Column(
                                  children: [
                                    Text("123", style: GoogleFonts.nunitoSans(
                                      fontSize: 18
                                    ),),
                                    verticalGap(4),
                                    Text("Pages", style: GoogleFonts.nunitoSans(
                                      color: AppColors.hintColor
                                    ),)
                                  ],
                                ),
                                Container(
                                  width: 2,
                                  height: 45,
                                  color: AppColors.hintColor,
                                ),
                                Column(
                                  children: [
                                    Text("EN", style: GoogleFonts.nunitoSans(
                                      fontSize: 18
                                    ),),
                                    verticalGap(4),
                                    Text("Language", style: GoogleFonts.nunitoSans(
                                      color: AppColors.hintColor
                                    ),)
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
