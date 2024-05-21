import 'package:flutter/material.dart';
import 'package:freezes_counter_app/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print("initial Build");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  print("Second Build");
                  return Text(
                    "${state.count}",
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        color: Colors.blue,
                        child: TextButton(
                            onPressed: () {
                              context.read<CounterBloc>().add(Increment());
                            },
                            child: Text(
                              "+",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                            ))),
                    Container(
                        color: Colors.blue,
                        child: TextButton(
                            onPressed: () {
                              context.read<CounterBloc>().add(Decrement());
                            },
                            child: Text(
                              "-",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                            ))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
