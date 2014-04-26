//
//  MDCHUDActivityView.h
//  MDCHudActivityViewExample
//
//  Created by Matthew Cheetham on 26/04/2014.
//  Copyright (c) 2014 Matthew Cheetham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDCHUDActivityView : UIView

/**
 *  Adds an animated HUD to the centre of the view to indicate loading
 *
 *  @param view The view that should present the loading HUD
 */
+ (void)startInView:(UIView *)view;

/**
 *  Adds an animated HUD to the centre of the view to indicate loading with a message displayed underneath the activity indicator
 *
 *  @param view The view that should present the loading HUD
 *  @param text The text to display beneath the indicator
 */
+ (void)startInView:(UIView *)view text:(NSString *)text;

/**
 *  Removes any loading HUD views from the specified view
 *
 *  @param view The view which already contains a loading HUD
 */
+ (void)finishInView:(UIView *)view;

/**
 *  Updates the text label beneath an already running loading indicator
 *
 *  @param view The view which already contains a loading HUD
 *  @param text The text to replace the existing text with in the view
 */
+ (void)updateActivityInView:(UIView *)view withText:(NSString *)text;
@end
