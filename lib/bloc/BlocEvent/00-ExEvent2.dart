import 'package:flutter_bloc/flutter_bloc.dart';

//-------------------------------------------------

abstract class Example2_Event {}

class Example2_GET extends Example2_Event {}

class Example2_flush extends Example2_Event {}

class Example2_Bloc extends Bloc<Example2_Event, Example2class> {
  Example2_Bloc() : super(Example2class()) {
    on<Example2_GET>((event, emit) {
      return _Example2_GET(Example2class(), emit);
    });
    on<Example2_flush>((event, emit) {
      return _Example2_flush(Example2class(), emit);
    });
  }
  Future<void> _Example2_GET(
      Example2class toAdd, Emitter<Example2class> emit) async {
    Example2class output = Example2class();
    emit(output);
  }

  Future<void> _Example2_flush(
      Example2class toAdd, Emitter<Example2class> emit) async {
    Example2class output = Example2class();

    emit(output);
  }
}

class Example2class {
  Example2class({
    this.PO = '',
  });

  String PO;
}
