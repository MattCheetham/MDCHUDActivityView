//
//  MDCHUDActivityView.m
//  MDCHudActivityViewExample
//
//  Created by Matthew Cheetham on 26/04/2014.
//  Copyright (c) 2014 Matthew Cheetham. All rights reserved.
//

#import "MDCHUDActivityView.h"

@interface MDCHUDActivityView ()

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation MDCHUDActivityView

#pragma mark - Setup
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, 100, 100)];
    if (self) {
        
        UIView *background = [[UIView alloc] initWithFrame:self.bounds];
        background.backgroundColor = [UIColor blackColor];
        background.alpha = 0.7;
        background.layer.cornerRadius = 8;
        [self addSubview:background];
        
        self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self addSubview:self.activityIndicatorView];
        [self.activityIndicatorView startAnimating];
        
        self.textLabel = [UILabel new];
        self.textLabel.text = @"Loading...";
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.adjustsFontSizeToFitWidth = YES;
        self.textLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.textLabel];
        
    }
    return self;
}

#pragma mark - Adding

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
#pragma mark - Finding Existing

+ (MDCHUDActivityView *)activityInView:(UIView *)view
{
    for (MDCHUDActivityView *activityView in view.subviews) {
        if ([activityView isKindOfClass:[MDCHUDActivityView class]]) {
            return activityView;
        }
    }
    
    return nil;
}

#pragma mark - Removing

+ (void)finishInView:(UIView *)view
{
    MDCHUDActivityView *activityView = [MDCHUDActivityView activityInView:view];
    
    [activityView finish];
}

- (void)finish
{
    [UIView animateWithDuration:0.35 animations:^{
        
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
}

#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.activityIndicatorView setFrame:CGRectMake(self.frame.size.width / 2 - 15, self.frame.size.height / 2 - 15, 30, 30)];
    self.textLabel.frame = CGRectMake(5, self.frame.size.height - 22, self.frame.size.width - 10, 22);
}


@end
