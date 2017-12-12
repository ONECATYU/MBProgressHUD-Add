//
//  UIView+MBPHUD.m
//  HBGovSwift
//
//  Created by 余汪送 on 2017/12/11.
//  Copyright © 2017年 capsule. All rights reserved.
//

#import "UIView+MBPHUD.h"

#define MBPHUD_EXECUTE(...) \
__weak typeof(self) weakself = self; \
[self hideHUDCompletion:^{ \
    __VA_ARGS__ \
}];

CGFloat const MBPHUDFontSize = 15;
CGFloat const MBPHUDShowTime = 2.0f;

@implementation UIView (MBPHUD)

@dynamic HUD;

- (MBProgressHUD *)HUD {
    return [MBProgressHUD HUDForView:self];
}

- (MBProgressHUD *)instanceHUD {
    MBProgressHUD *HUD = [[MBProgressHUD alloc]initWithView:self];
    [self setupHUD:HUD];
    return HUD;
}

- (void)showHUD {
    [self showWithMessage:nil];
}

- (void)showWithMessage:(nullable NSString *)message {
    MBPHUD_EXECUTE({
        MBProgressHUD *HUD = [weakself instanceHUD];
        [weakself addSubview:HUD];
        HUD.mode = MBProgressHUDModeIndeterminate;
        HUD.label.text = message;
        [HUD showAnimated:YES];
    })
}

- (void)showMessage:(NSString *)message {
    MBPHUD_EXECUTE({
        MBProgressHUD *HUD = [weakself instanceHUD];
        [weakself addSubview:HUD];
        HUD.mode = MBProgressHUDModeText;
        HUD.label.text = message;
        [HUD showAnimated:YES];
        [HUD hideAnimated:YES afterDelay:MBPHUDShowTime];
    })
}

- (void)showWithImage:(UIImage *)image {
    [self showWithImage:image message:nil];
}

- (void)showWithImage:(UIImage *)image message:(nullable NSString *)message {
    MBPHUD_EXECUTE({
        MBProgressHUD *HUD = [weakself instanceHUD];
        HUD.mode = MBProgressHUDModeCustomView;
        HUD.customView = [[UIImageView alloc] initWithImage:image];
        HUD.label.text = message;
        [weakself addSubview:HUD];
        [HUD showAnimated:YES];
        [HUD hideAnimated:YES afterDelay:MBPHUDShowTime];
    })
}

- (void)showProgressHUD {
    [self showProgressWithMessage:nil];
}

- (void)showProgressWithMessage:(nullable NSString *)message {
    [self showProgressWithMessage:message style:MBPHUDProgressStyleNormal];
}

- (void)showProgressWithMessage:(nullable NSString *)message style:(MBPHUDProgressStyle)style {
    MBPHUD_EXECUTE({
        MBProgressHUDMode mode = MBProgressHUDModeDeterminate;
        if (style == MBPHUDProgressStyleBar) mode = MBProgressHUDModeDeterminateHorizontalBar;
        else if (style == MBPHUDProgressStyleAnnular) mode = MBProgressHUDModeAnnularDeterminate;
        MBProgressHUD *HUD = [weakself instanceHUD];
        HUD.mode = mode;
        HUD.label.text = message;
        [weakself addSubview:HUD];
        [HUD showAnimated:YES];
    })
}

- (void)updateProgress:(CGFloat)progress {
    self.HUD.progress = progress;
}

- (void)hideHUD {
    [self hideHUDCompletion:nil];
}

- (void)hideHUDCompletion:(nullable void(^)(void))completion {
    if (!self.HUD) { if (completion) completion(); return; }
    self.HUD.completionBlock = completion;
    [self.HUD hideAnimated:YES];
}

- (void)setupHUD:(MBProgressHUD *)HUD {
    HUD.removeFromSuperViewOnHide = YES;
    HUD.userInteractionEnabled = NO;
    HUD.square = NO;
    HUD.margin = 12;
    HUD.offset = CGPointMake(0, -20);
    HUD.bezelView.color = [UIColor blackColor];
    HUD.bezelView.layer.cornerRadius = 4;
    HUD.contentColor = [UIColor whiteColor];
    HUD.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    HUD.label.font = [UIFont systemFontOfSize:MBPHUDFontSize];
    HUD.label.numberOfLines = 3;
}

@end