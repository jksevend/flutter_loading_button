import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loading_button/loading_button.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Circular loading widget displayed
            LoadingButton(
              onPressed: () async {
                await Future.delayed(
                  const Duration(seconds: 3),
                  () => print('Task done!'),
                );
              },
              child: const Text('Press me!'),
              loadingWidget: const CircularProgressIndicator(),
            ),

            /// Linear loading widget displayed
            ///
            /// Notice the extra container the linear progress indicator is put into
            /// this is to prevent its width from being infinite and I will look into a cleaner
            /// solution!
            LoadingButton(
              onPressed: () async {
                await Future.delayed(
                  const Duration(seconds: 3),
                  () => print('Task done!'),
                );
              },
              child: const Text('Press me!'),
              loadingWidget: Container(
                constraints: const BoxConstraints(
                  maxWidth: 200,
                ),
                child: const LinearProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
