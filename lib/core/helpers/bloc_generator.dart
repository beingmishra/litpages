import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litpages/features/home/bloc/home_bloc.dart';
import 'package:provider/single_child_widget.dart';

class BlocGenerator {
  BlocGenerator._();

  static List<SingleChildWidget> generateBloc() {
    return [
      BlocProvider<HomeBloc>(create: (BuildContext context) => HomeBloc()),
    ];
  }
}