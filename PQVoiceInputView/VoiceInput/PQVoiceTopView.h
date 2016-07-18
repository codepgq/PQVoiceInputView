//
//  PGQVoiceTopView.h
//  pgqVoiceInput
//
//  Created by ios on 16/7/14.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PQVoiceTopView : UIView

- (instancetype)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth linceColor:(UIColor*)lColor colidColor:(UIColor*)cColor;

/**
 *  设置音量的大小 输入 0.0 ~ 1.0
 *
 *  @param volume 输入 0 ~ 1
 */
- (void)updateVoiceViewWithVolume:(float)volume;
@end
