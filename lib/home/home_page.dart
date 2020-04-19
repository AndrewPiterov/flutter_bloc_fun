import 'package:bloc_example/home/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BLOC'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        bloc: bloc,
        builder: (context, state) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: state.count < 1
                        ? null
                        : () {
                            bloc.add(DecrementEvent());
                          }),
                Text(
                  state.count.toString(),
                  style: TextStyle(fontSize: 42),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    bloc.add(IncrementEvent());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
