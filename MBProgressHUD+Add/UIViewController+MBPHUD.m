//
//  UIViewController+MBPHUD.m
//  HBGovSwift
//
//  Created by 余汪送 on 2017/12/12.
//  Copyright © 2017年 capsule. All rights reserved.
//

#import "UIViewController+MBPHUD.h"

@implementation UIViewController (MBPHUD)

@dynamic HUD;

- (MBProgressHUD *)HUD {
    return self.view.HUD;
}

- (void)showHUD {
    [self.view showWithMessage:nil];
}

- (void)showWithMessage:(nullable NSString *)message {
    [self.view showWithMessage:message];
}

- (void)showMessage:(NSString *)message {
    [self.view showMessage:message];
}

- (void)showWithImage:(UIImage *)image {
    [self.view showWithImage:image message:nil];
}

- (void)showWithImage:(UIImage *)image message:(nullable NSString *)message {
    [self.view showWithImage:image message:message];
}

- (void)showProgressHUD {
    [self.view showProgressWithMessage:nil];
}

- (void)showProgressWithMessage:(nullable NSString *)message {
    [self.view showProgressWithMessage:message style:MBPHUDProgressStyleNormal];
}

- (void)showProgressWithMessage:(nullable NSString *)message style:(MBPHUDProgressStyle)style {
    [self.view showProgressWithMessage:message style:style];
}

- (void)updateProgress:(CGFloat)progress {
    self.view.HUD.progress = progress;
}

- (void)hideHUD {
    [self.view hideHUDCompletion:nil];
}

- (void)hideHUDCompletion:(nullable void(^)(void))completion {
    [self.view hideHUDCompletion:completion];
}

@end
