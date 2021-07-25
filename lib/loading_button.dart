import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Normal loading button containing a child, most likely a text
class LoadingButton extends StatefulWidget {
  // BLABLABLA
  final Widget child;
  final AsyncCallback onPressed;
  final Widget loadingWidget;
  const LoadingButton({
    Key? key,
    required this.child,
    required this.onPressed,
    required this.loadingWidget,
  }) : super(key: key);

  @override
  _LoadingButtonState createState() => _LoadingButtonState();

  /// Optional constructor to create a loading button containing an icon and a child
  factory LoadingButton.icon({
    Key? key,
    required final Widget child,
    required final AsyncCallback onPressed,
    required final Widget loadingWidget,
    required final Icon icon,
  }) = _LoadingIconButton;
}

/// The LoadingButton.icon() works no different than the LoadingButton itself
/// only difference is the child
class _LoadingIconButton extends LoadingButton {
  _LoadingIconButton({
    Key? key,
    required Widget child,
    required AsyncCallback onPressed,
    required Widget loadingWidget,
    required final Icon icon,
  }) : super(
          key: key,
          child: _LoadingIconButtonChild(
              icon: icon, child: child, onPressed: onPressed),
          onPressed: onPressed,
          loadingWidget: loadingWidget,
        );
}

/// Represents the child of an LoadingButton.icon() instance
class _LoadingIconButtonChild extends StatelessWidget {
  final Icon icon;
  final Widget child;
  final AsyncCallback onPressed;

  const _LoadingIconButtonChild({
    Key? key,
    required this.icon,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(onPressed: onPressed, icon: icon, label: child);
  }
}

/// The state of each loading button
class _LoadingButtonState extends State<LoadingButton> {
  late bool _pressed;

  @override
  void initState() {
    super.initState();
    _pressed = false;
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (_pressed) {
      content = widget.loadingWidget;
    } else {
      content = _buildButton();
    }
    return content;
  }

  void _onTapped() async {
    _togglePressed();
    await widget.onPressed().whenComplete(() => _togglePressed());
  }

  ///
  Widget _buildButton() {
    return TextButton(
      onPressed: () => _onTapped(),
      child: widget.child,
    );
  }

  /// Toggles the [_pressed] value and resets the state
  void _togglePressed() {
    setState(() {
      _pressed = !_pressed;
    });
  }
}
