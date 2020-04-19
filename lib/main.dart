import 'package:bloc_example/home/bloc/counter_bloc.dart';
import 'package:bloc_example/home/home_page.dart';
import 'package:bloc_example/random/bloc/random_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return CounterBloc();
          },
        ),
        BlocProvider(create: (context) {
          return RandomBloc();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
