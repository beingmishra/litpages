import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litpages/core/helpers/scrapper.dart';
import 'package:litpages/features/detail/models/book_detail_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<FetchBookDetailEvent>(_onFetchDashboard);
  }

  void _onFetchDashboard(FetchBookDetailEvent event, Emitter<DetailState> emit) async {
    try {
      emit(DetailLoading());

      final response = await http.get(Uri.parse("https://manybooks.net/titles/${event.key}"));
      if (response.statusCode != 200) {
        throw Exception('Failed to load page: ${response.statusCode}');
      }

      final document = parse(response.body);
      var detailModel = ScrapeHelper.extractBookDetails(document);
      emit(FetchDetailSuccessState(detailModel));
    } on SocketException {
      emit(const DetailFailure(mError: "Please check your internet connection"));
    } on ClientException {
      emit(const DetailFailure(mError: "Please check your internet connection"));
    } catch (e, stack) {
      log(e.toString());
      log(stack.toString());
      debugPrintStack(stackTrace: stack);
      emit(DetailFailure(mError: e.toString()));
    }
  }

}
