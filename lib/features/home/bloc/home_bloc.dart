import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:litpages/core/helpers/scrapper.dart';
import 'package:litpages/features/home/models/dashboard_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchDashboardEvent>(_onFetchDashboard);
  }

  void _onFetchDashboard(FetchDashboardEvent event, Emitter<HomeState> emit) async {
    try {
      emit(DashboardLoading());

      final response = await http.get(Uri.parse("https://manybooks.net"));
      if (response.statusCode != 200) {
        throw Exception('Failed to load page: ${response.statusCode}');
      }

      final document = parse(response.body);

      var deals = ScrapeHelper.extractFreeBooks(document);
      var editorChoice = ScrapeHelper.extractEditorChoice(document);
      var trending = ScrapeHelper.extractTrendingBooks(document);
      var popular = ScrapeHelper.extractPopularBooks(document);

      var dashboardModel = DashboardModel(deals, editorChoice, trending, popular);
      emit(DashboardSuccessState(dashboardModel));
    } on SocketException {
      emit(const HomeFailure(mError: "Please check your internet connection"));
    } on ClientException {
      emit(const HomeFailure(mError: "Please check your internet connection"));
    } catch (e, stack) {
      log(e.toString());
      log(stack.toString());
      debugPrintStack(stackTrace: stack);
      emit(HomeFailure(mError: e.toString()));
    }
  }

}
