import 'package:bloc_counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyWidget()),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.title'),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          // if (state.isIncrimented == true) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //     content: Text('incrimented'),
          //     duration: Duration(microseconds: 300),
          //   ));
          // } else {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //     content: Text('decrimented'),
          //     duration: Duration(microseconds: 300),
          //   ));
          // }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              // BlocBuilder<CounterCubit, CounterState>(
              //   builder: (context, state) {
              //     print(state.countValue);
              //     return Text(
              //       state.countValue.toString(),
              //       style: Theme.of(context).textTheme.headline4,
              //     );
              //   },
              // ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.isIncrimented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('incrimented'),
                      duration: Duration(microseconds: 300),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('decrimented'),
                        duration: Duration(microseconds: 300),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  
                  print(state.countValue);
                  return Text(
                    state.countValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).incriment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decriment();
            },
            tooltip: 'Decriment',
            child: const Icon(Icons.minimize_outlined),
          ),
        ],
      ),
    );
  }
}
