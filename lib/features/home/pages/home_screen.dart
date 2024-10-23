import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litpages/config/theme/app_colors.dart';
import 'package:litpages/config/utils/helper_widgets.dart';
import 'package:litpages/core/widgets/book_card_widget.dart';
import 'package:litpages/features/detail/pages/detail_screen.dart';
import 'package:litpages/features/home/bloc/home_bloc.dart';
import 'package:litpages/features/home/models/dashboard_model.dart';
import 'package:overlapped_carousel/overlapped_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
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
                    : SingleChildScrollView(
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
                          ),
                        ),
                      );
              }),
        ),
      ),
    );
  }
}
