import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litpages/config/theme/app_colors.dart';
import 'package:litpages/config/utils/helper_widgets.dart';
import 'package:litpages/features/detail/pages/detail_screen.dart';
import 'package:overlapped_carousel/overlapped_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> widgets = List.generate(
    10,
    (index) => ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
      child: Image.network(
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg', //Images stored in assets folder
        fit: BoxFit.fill,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.25,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: Text(
                            "Hey User, What are we looking for today?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunitoSans(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cardDarkColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.only(right: 16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search here",
                        contentPadding: EdgeInsets.only(top: 15),
                        prefixIcon: Icon(Icons.search)),
                  ),
                ),
                verticalGap(32),
                Row(
                  children: [
                    Text("Editor's Choice", style: GoogleFonts.nunitoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),)
                  ],
                ),
                verticalGap(12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 12,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runSpacing: 12,
                    children: List.generate(
                      12,
                      (index) => SizedBox(
                        width: size.width * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg",
                                fit: BoxFit.cover,
                                height: 180,
                                width: size.width * 0.3,
                              ),
                            ),
                            verticalGap(8),
                            Text(
                              "Book name",
                              style: GoogleFonts.nunitoSans(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                verticalGap(24),
                Row(
                  children: [
                    Text("Trending Books", style: GoogleFonts.nunitoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),)
                  ],
                ),
                verticalGap(12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 12,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runSpacing: 12,
                    children: List.generate(
                      12,
                      (index) => SizedBox(
                        width: size.width * 0.3,
                        child: GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailScreen())),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg",
                                  fit: BoxFit.cover,
                                  height: 180,
                                  width: size.width * 0.3,
                                ),
                              ),
                              verticalGap(8),
                              Text(
                                "Book name",
                                style: GoogleFonts.rubik(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
