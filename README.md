# factory_method_pattern

A Factory Method Design Pattern Fluuter Projects 

### Usage

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformButton {
  Widget build(VoidCallback onTap, Widget child);
}

class AndroidBtn extends PlatformButton {
  @override
  Widget build(VoidCallback onTap, Widget child) {
    return ElevatedButton(onPressed: onTap, child: child);
  }
}

class IOSBtn implements PlatformButton {
  @override
  Widget build(VoidCallback onTap, Widget child) {
    return CupertinoButton(onPressed: onTap, child: child);
  }
}

class ButtonFactory {
  static PlatformButton getButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidBtn();
      case TargetPlatform.iOS:
        return IOSBtn();
      default:
        return AndroidBtn();
    }
  }
}
### When You don't know which Platform is coming

You can use this pattern :

This returns basically Widget AnyWhere You can use this widgets.

ButtonFactory.getButton(TargetPlatform.android).build(
            () => log("On Tap Clicked"),
            const Text("Clik Me"),
          ),