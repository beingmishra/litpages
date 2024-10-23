
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litpages/config/theme/app_colors.dart';
import 'package:litpages/config/utils/helper_widgets.dart';
import 'package:litpages/core/widgets/book_card_widget.dart';
import 'package:litpages/features/home/bloc/home_bloc.dart';
import 'package:litpages/features/home/models/dashboard_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isSearching = ValueNotifier<bool>(false);
  DashboardModel? dashboardModel;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(FetchDashboardEvent());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is DashboardLoading) {
            _isLoading.value = true;
          }

          if (state is HomeFailure) {
            _isLoading.value = false;
          }

          if (state is DashboardSuccessState) {
            dashboardModel = state.data;
            _isLoading.value = false;
          }
        },
        child: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: _isLoading,
              builder: (context, value, child) {
                return value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : dashboardModel == null ? const SizedBox() : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ValueListenableBuilder(valueListenable: _isSearching,
                              builder: (context, value, child) {
                                return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  height: value ? 0 : size.height * 0.25,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 28.0),
                                          child: Text(
                                            "Hey User, What are we looking for today?",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.nunitoSans(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
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
                                    onEditingComplete: () {
                                      _isSearching.value = true;
                                    },
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
                                    Text(
                                      "Deals today",
                                      style: GoogleFonts.nunitoSans(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                verticalGap(12),
                                CarouselSlider(
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                                    enlargeFactor: 0.25,
                                    padEnds: false,
                                    viewportFraction: 0.85,
                                    enlargeCenterPage: true
                                  ),
                                  items: dashboardModel!.deals.map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              color: AppColors.cardDarkColor,
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                    child: Image.network(
                                                      "https://manybooks.net/${i.poster}",
                                                      fit: BoxFit.cover,
                                                      height: 180,
                                                      width: size.width * 0.3,
                                                    ),
                                                  ),
                                                  horizontalGap(12),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(i.title, style: GoogleFonts.nunitoSans(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold
                                                        ),),
                                                        verticalGap(8),
                                                        Text("By ${i.author ?? "-"}", style: GoogleFonts.nunitoSans(),),
                                                        const Spacer(),
                                                        Text(i.currentPrice ?? "-", style: GoogleFonts.nunitoSans(
                                                          fontSize: 20
                                                        ),),
                                                        Text(i.retailPrice ?? "-", style: GoogleFonts.nunitoSans(
                                                          decoration: TextDecoration.lineThrough,
                                                          color: AppColors.hintColor
                                                        ),),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                                verticalGap(24),
                                Row(
                                  children: [
                                    Text(
                                      "Editor's Choice",
                                      style: GoogleFonts.nunitoSans(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )
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
                                    children: dashboardModel!.editorChoice.map((item) => BookCardWidget(bookData: item)).toList(),
                                  ),
                                ),
                                verticalGap(24),
                                Row(
                                  children: [
                                    Text(
                                      "Trending Books",
                                      style: GoogleFonts.nunitoSans(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )
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
                                    children: dashboardModel!.trending.map((item) => BookCardWidget(bookData: item)).toList(),
                                  ),
                                ),
                                verticalGap(24),
                                Row(
                                  children: [
                                    Text(
                                      "Popular Books",
                                      style: GoogleFonts.nunitoSans(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )
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
                                    children: dashboardModel!.popular.map((item) => BookCardWidget(bookData: item)).toList(),
                                  ),
                                ),
                              ],
                            );
                              }),
                        ),
                      );
              }),
        ),
      ),
    );
  }
}
