import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litpages/config/theme/app_colors.dart';
import 'package:litpages/config/utils/helper_widgets.dart';
import 'package:litpages/features/detail/bloc/detail_bloc.dart';
import 'package:litpages/features/detail/models/book_detail_model.dart';

class BookDetailScreen extends StatefulWidget {
  final String keyStr;
  const BookDetailScreen({super.key, required this.keyStr});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  BookDetailModel? bookDetailModel;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailBloc>(context)
        .add(FetchBookDetailEvent(widget.keyStr));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: BlocListener<DetailBloc, DetailState>(
        listener: (context, state) {
          if (state is DetailLoading) {
            _isLoading.value = true;
          }

          if (state is DetailFailure) {
            _isLoading.value = false;
          }

          if (state is FetchDetailSuccessState) {
            bookDetailModel = state.data;
            _isLoading.value = false;
          }
        },
        child: ValueListenableBuilder(
            valueListenable: _isLoading,
            builder: (context, value, child) {
              return value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : bookDetailModel == null ? const SizedBox() : SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.75,
                            child: Stack(
                              children: [
                                Image.network(
                                  "https://manybooks.net/${bookDetailModel?.poster}",
                                  fit: BoxFit.cover,
                                  height: size.height * 0.75,
                                  width: size.width,
                                ),
                                Container(
                                  height: size.height * 0.75,
                                  width: size.width,
                                  color:
                                      AppColors.primaryColor.withOpacity(0.9),
                                ),
                                SafeArea(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () =>
                                                    Navigator.pop(context),
                                                child: const Icon(
                                                  Icons.arrow_back_ios_new,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "Details",
                                                style: GoogleFonts.nunitoSans(
                                                    fontSize: 18),
                                              ),
                                              const Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  "https://manybooks.net/${bookDetailModel?.poster}",
                                                  fit: BoxFit.cover,
                                                  height: 220,
                                                  width: size.width * 0.38,
                                                ),
                                              ),
                                              verticalGap(8),
                                              Text(
                                                bookDetailModel?.title ?? "",
                                                style: GoogleFonts.nunitoSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              verticalGap(4),
                                              Text(
                                                bookDetailModel?.author ?? "",
                                                style: GoogleFonts.nunitoSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          padding: const EdgeInsets.all(24),
                                          decoration: BoxDecoration(
                                            color: const Color(0xff6B3F87)
                                                .withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "0.0",
                                                    style:
                                                        GoogleFonts.nunitoSans(
                                                            fontSize: 18),
                                                  ),
                                                  verticalGap(4),
                                                  Text(
                                                    "Ratings",
                                                    style:
                                                        GoogleFonts.nunitoSans(
                                                            color: AppColors
                                                                .hintColor),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                width: 2,
                                                height: 45,
                                                color: AppColors.hintColor,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    bookDetailModel?.pages ?? "",
                                                    style:
                                                        GoogleFonts.nunitoSans(
                                                            fontSize: 18),
                                                  ),
                                                  verticalGap(4),
                                                  Text(
                                                    "Pages",
                                                    style:
                                                        GoogleFonts.nunitoSans(
                                                            color: AppColors
                                                                .hintColor),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                width: 2,
                                                height: 45,
                                                color: AppColors.hintColor,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "EN",
                                                    style:
                                                        GoogleFonts.nunitoSans(
                                                            fontSize: 18),
                                                  ),
                                                  verticalGap(4),
                                                  Text(
                                                    "Language",
                                                    style:
                                                        GoogleFonts.nunitoSans(
                                                            color: AppColors
                                                                .hintColor),
                                                  )
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
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Wrap(
                                    spacing: 12,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    runSpacing: 12,
                                    children: List.generate(
                                        (bookDetailModel?.genre ?? []).length,
                                        (index) => Chip(
                                            label: Text(bookDetailModel?.genre[index] ?? ""))),
                                  ),
                                ),
                                verticalGap(16),
                                Text(
                                  "Description",
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                verticalGap(12),
                                Text(bookDetailModel?.description ?? "")
                              ],
                            ),
                          )
                        ],
                      ),
                    );
            }),
      ),
    );
  }
}
