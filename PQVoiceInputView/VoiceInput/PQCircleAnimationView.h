//
//  PGQCirecleAnimationView.h
//  pgqVoiceInput
//
//  Created by ios on 16/7/15.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PQCircleAnimationView : UIView
- (instancetype)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth lindeColor:(UIColor *)lineColor;

- (void)startAnimation;
- (void)stopAnimation;
@end
