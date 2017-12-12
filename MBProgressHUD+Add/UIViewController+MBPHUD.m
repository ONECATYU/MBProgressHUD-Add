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
    [self.view showHUDWithMessage:nil];
}

- (void)showHUDWithMessage:(nullable NSString *)message {
    [self.view showHUDWithMessage:message];
}

- (void)showHUDMessage:(NSString *)message {
    [self.view showHUDMessage:message];
}

- (void)showHUDWithImage:(UIImage *)image {
    [self.view showHUDWithImage:image message:nil];
}

- (void)showHUDWithImage:(UIImage *)image message:(nullable NSString *)message {
    [self.view showHUDWithImage:image message:message];
}

- (void)showHUDProgressHUD {
    [self.view showHUDProgressWithMessage:nil];
}

- (void)showHUDProgressWithMessage:(nullable NSString *)message {
    [self.view showHUDProgressWithMessage:message style:MBPHUDProgressStyleNormal];
}

- (void)showHUDProgressWithMessage:(nullable NSString *)message style:(MBPHUDProgressStyle)style {
    [self.view showHUDProgressWithMessage:message style:style];
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
