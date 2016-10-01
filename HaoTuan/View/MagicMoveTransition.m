//
//  MagicMoveTransition.m
//  HaoTuan
//
//  Created by yangyunen on 16/8/29.
//  Copyright © 2016年 yangyunen. All rights reserved.
//

#import "MagicMoveTransition.h"

@implementation MagicMoveTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
}

@end
