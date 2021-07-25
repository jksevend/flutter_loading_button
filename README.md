# Flutter Loading Button
This package is a wrapper around the existing material buttons to provide support to display a loading widget while the onPressed method of the buttons performs an async task. This can for example be a HTTP request to your API to query some data but a basic timer task will do it too.

## Info
Right now this package **only** wraps around the ```TextButton``` widget. Support for ```IconButton```, ```ElevatedButton``` and ```OutlinedButton``` are currently in the process. 

## Getting started
First add the dependency into your ```pubspec.yaml```:
```
dependencies:
    flutter_loading_button: 0.0.1
```

**OR**
Add the dependency via terminal:
```
flutter pub add flutter_loading_button
```

When making use of the package:
```
import 'package:flutter_loading_button/loading_button.dart';
```

## Usage
Add a ```LoadingButton``` with a ```CircularProgressIndicator``` being displayed while this widget is in the loading state to your widget tree:
```
LoadingButton(
    // This needs to be async
    onPressed: () async {
        await Future.delayed(const Duration(seconds: 3), () => print('Task done!'),
        );
    },
    child: const Text('Button'),
    loadingWidget: const CircularProgressIndicator(),
)
```

You can also pass a ```LinearProgressIndicator``` but when trying to render it it will take the whole width available to display itself. Try wrapping it around in a ```Container```:
```
LoadingButton(
    // This needs to be async
    onPressed: () async {
        await Future.delayed(const Duration(seconds: 3), () => print('Task done!'),
        );
    },
    child: const Text('Button'),
    loadingWidget: Container(
        constraints: const BoxConstraints(maxWidth: 200),
        child: const LinearProgressIndicator(),
    ),
)
```

**NOTE:** The ```onPressed``` method needs to be async for the loading widget to appear.

## Future Updates
Currently the plan is to add support for
* IconButton, ElevatedButton and OutlinedButton
* Passing a style to the LoadingButton

## Bugs, Errors etc.
If you find any weird behaviour, bugs or errors please let me know.
Also an image or a gif will help a lot if the UI behaves differently.