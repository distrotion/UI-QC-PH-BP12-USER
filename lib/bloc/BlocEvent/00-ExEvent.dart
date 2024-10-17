import 'package:flutter_bloc/flutter_bloc.dart';

//-------------------------------------------------

abstract class Example_Event {}

class Example_GET extends Example_Event {}

class Example_flush extends Example_Event {}

class Example_Bloc extends Bloc<Example_Event, List<Exampleclass>> {
  Example_Bloc() : super([]) {
    on<Example_GET>((event, emit) {
      return _Example_GET([], emit);
    });
    on<Example_flush>((event, emit) {
      return _Example_flush([], emit);
    });
  }
  Future<void> _Example_GET(
      List<Exampleclass> toAdd, Emitter<List<Exampleclass>> emit) async {
    List<Exampleclass> output = [];
    emit(output);
  }

  Future<void> _Example_flush(
      List<Exampleclass> toAdd, Emitter<List<Exampleclass>> emit) async {
    List<Exampleclass> output = [];

    emit(output);
  }
}

class Exampleclass {
  Exampleclass({
    this.PO = '',
  });

  String PO;
}
