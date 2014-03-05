//
//  ZViewController.m
//  flipmenu
//
//  Created by Sun on 14-3-5.
//  Copyright (c) 2014年 z. All rights reserved.
//

#import "ZViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ZViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *icon1;
@property (strong, nonatomic) IBOutlet UIImageView *icon2;
@property (strong, nonatomic) IBOutlet UIImageView *icon3;

- (IBAction)startAnimation:(id)sender;

@end

@implementation ZViewController {
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startAnimation:(id)sender {
    NSArray *a = @[self.icon1, self.icon2, self.icon3];
    CAMediaTimingFunction *func1 = [CAMediaTimingFunction functionWithControlPoints:.5:1.53:.49:1.523];
    CFTimeInterval offset = 0;
    for (int i = 0; i < 3; i++) {
        UIView *v = [a objectAtIndex:i];
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
        anim.fromValue =[NSValue valueWithCGPoint:CGPointMake(v.layer.position.x, 400)];
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(v.layer.position.x, 150)];
        anim.duration = 0.4;
        anim.timingFunction = func1;
        anim.beginTime = CACurrentMediaTime() + offset;
        offset += 0.05;
        anim.delegate = self;
        anim.removedOnCompletion = NO;
        anim.fillMode = kCAFillModeForwards;
        [v.layer addAnimation:anim forKey:@"p"];
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if ([self.icon1.layer animationForKey:@"p"] == anim) {
        [self.icon1.layer setPosition:CGPointMake(56, 150)];
        [self.icon1.layer removeAnimationForKey:@"p"];
    }
    if ([self.icon2.layer animationForKey:@"p"] == anim) {
        [self.icon2.layer setPosition:CGPointMake(160, 150)];
        [self.icon2.layer removeAnimationForKey:@"p"];
    }
    if ([self.icon3.layer animationForKey:@"p"] == anim) {
        [self.icon3.layer setPosition:CGPointMake(264, 150)];
        [self.icon3.layer removeAnimationForKey:@"p"];
    }
}
@end
