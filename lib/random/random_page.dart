import 'package:bloc_example/home/bloc/counter_bloc.dart';
import 'package:bloc_example/random/bloc/random_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomPage extends StatefulWidget {
  @override
  _RandomPageState createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  int total = 0;

  void _updateTotal() {
    setState(() {
      total = BlocProvider.of<CounterBloc>(context).state.count +
          BlocProvider.of<RandomBloc>(context).state.randomNumber;
    });
  }

  @override
  void didChangeDependencies() {
    _updateTotal();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MultiBlocListener(
            listeners: [
              BlocListener<CounterBloc, CounterState>(
                listener: (context, state) {
                  BlocProvider.of<RandomBloc>(context).add(
                    GenerateRandom(),
                  );
                  _updateTotal();
                },
              ),
              BlocListener<RandomBloc, RandomState>(
                listener: (context, state) {
                  _updateTotal();
                },
              ),
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      BlocBuilder<CounterBloc, CounterState>(
                        builder: (context, state) {
                          return Text(
                            state.count.toString(),
                          );
                        },
                      ),
                      RaisedButton(
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context)
                              .add(IncrementEvent());
                        },
                        child: Text('Increment'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('+'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      BlocBuilder<RandomBloc, RandomState>(
                        builder: (context, state) {
                          return Text(
                            state.randomNumber.toString(),
                          );
                        },
                      ),
                      RaisedButton(
                        onPressed: () {
                          BlocProvider.of<RandomBloc>(context)
                              .add(GenerateRandom());
                        },
                        child: Text('Random'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('='),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(total.toString()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
