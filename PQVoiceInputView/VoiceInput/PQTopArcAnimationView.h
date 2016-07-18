//
//  PGQTopAnimationView.h
//  pgqVoiceInput
//
//  Created by ios on 16/7/15.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PQTopArcAnimationView : UIView
- (instancetype)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth lindeColor:(UIColor *)lineColor;

- (void)startAnimation:(NSInteger)count;
- (void)stopAnimation;
@end
