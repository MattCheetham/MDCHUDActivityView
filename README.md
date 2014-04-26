MDCHudActivityView
==================

A loading indicator HUD that presents itself in the centre of any view it is given. Supports loading indicator, custom logo and minimal modes.

![Animated example](http://f.cl.ly/items/0S0e0d0o253P2n0y0s0M/out.gif)

# Features

* Animated Loading HUD
* Support for custom logo
* Support for minimal mode

# Requirements

* iOS 7

# Installation/Usage
Drag and drop the files located in the MDCHudActivityView folder into your project and optionally create a folder for convenience. 

Import the view into the view you wish to present it from

`#import "MDCHUDActivityView.h"`

To present the view, run the following example command

```
[MDCHUDActivityView startInView:self.view text:@"Downloading" style:MDCHUDActivityViewStyleDefault];
```

To change the text use;
```
[MDCHUDActivityView updateActivityInView:self.view withText:@"Unpacking"];
```

To remove the view use;

```
[MDCHUDActivityView finishInView:self.view];
```

