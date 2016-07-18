//
//  pgqVoiceTopView.h
//  pgqVoiceInput
//
//  Created by ios on 16/7/14.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PQVoiceView : UIView



+ (__kindof PQVoiceView * _Nonnull)pgq_reateVoiceTopViewWithRect:(CGRect)frame voiceColor:(UIColor* _Nullable)fColor volumeColor:(UIColor* _Nullable)vColor isColid:(BOOL)isColid lineWidth:(CGFloat)lineWidth;


- (void)updateVoiceViewWithVolume:(float)volume;
@end
