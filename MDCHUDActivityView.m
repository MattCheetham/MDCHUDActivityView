//
//  MDCHUDActivityView.m
//  MDCHudActivityViewExample
//
//  Created by Matthew Cheetham on 26/04/2014.
//  Copyright (c) 2014 Matthew Cheetham. All rights reserved.
//

#import "MDCHUDActivityView.h"

@implementation MDCHUDActivityView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, 100, 100)];
    if (self) {
        
        UIView *background = [[UIView alloc] initWithFrame:self.bounds];
        background.backgroundColor = [UIColor blackColor];
        background.alpha = 0.7;
        background.layer.cornerRadius = 8;
        [self addSubview:background];
        
    }
    return self;
}

+ (void)startInView:(UIView *)view
{
    MDCHUDActivityView *activityView = [[MDCHUDActivityView alloc] initWithFrame:CGRectZero];
    
    [activityView showInView:view];
}

- (void)showInView:(UIView *)view
{
    [view addSubview:self];
    
    [self setFrame:CGRectMake(view.frame.size.width / 2 - 50, view.frame.size.height / 2 - 50, 100, 100)];
    
    // Pop
    CAKeyframeAnimation *animation = [CAKeyframeAnimation
                                      animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(0.1, 0.1, 1);
    CATransform3D scale2 = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D scale3 = CATransform3DMakeScale(0.9, 0.9, 1);
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
    NSArray *frameValues = @[[NSValue valueWithCATransform3D:scale1],
                             [NSValue valueWithCATransform3D:scale2],
                             [NSValue valueWithCATransform3D:scale3],
                             [NSValue valueWithCATransform3D:scale4]];
    [animation setValues:frameValues];
    
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = 0.65;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self.layer addAnimation:animation forKey:@"popup"];
}

@end
