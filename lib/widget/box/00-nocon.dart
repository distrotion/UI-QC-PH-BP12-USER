import 'package:flutter/material.dart';

class NOCON extends StatelessWidget {
  NOCON({
    Key? key,
    this.load,
  }) : super(key: key);
  bool? load;

  @override
  Widget build(BuildContext context) {
    bool _load = load ?? false;
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 15, end: 15, top: 10, bottom: 10),
      child: Container(
        // color: Colors.black,
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        child: Center(
          child: _load
              ? Text("--")
              : SizedBox(
                  height: 75,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(width: 30),
                      CircularProgressIndicator(),
                      SizedBox(width: 20),
                      Text("Loading"),
                    ],
                  )),
        ),
      ),
    );
  }
}
