//
//  ETVerticalProgress.m
//  DirectionalProgress
//
//  Created by Ethan on 2018/3/16.
//  Copyright © 2018年 Ethan. All rights reserved.
//

#import "ETVerticalProgress.h"

@interface ETVerticalProgress()

@property (nonatomic, strong) CAShapeLayer *animLayer;

@end

@implementation ETVerticalProgress

- (void)drawRect:(CGRect)rect{
	//// Color Declarations

	CGFloat space = 6;
	CGFloat smallRectangleWidth = rect.size.width - space *2;
	CGFloat smallRectangleHeight = rect.size.height - space *2;
	
	//// Rectangle Drawing
	UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, rect.size.width, rect.size.height) cornerRadius: rect.size.width/2];
	[UIColor.orangeColor setFill];
	[rectanglePath fill];
	
	UIBezierPath* bezierPath = [UIBezierPath bezierPath];
	[bezierPath moveToPoint: CGPointMake(rect.size.width/2, rect.size.height - space - smallRectangleWidth/2)];
	[bezierPath addLineToPoint: CGPointMake(rect.size.width/2, space + smallRectangleWidth/2)];
	[UIColor.clearColor setStroke];
	bezierPath.lineWidth = 1.f;
	[bezierPath stroke];
	
	_animLayer = [CAShapeLayer layer];
	// 填充颜色
	_animLayer.fillColor = [UIColor greenColor].CGColor;
	// 绘制颜色
	_animLayer.strokeColor = [UIColor yellowColor].CGColor;
	_animLayer.lineWidth = smallRectangleWidth;
	_animLayer.lineCap = @"round";
	_animLayer.lineJoin = @"round";
	_animLayer.frame = CGRectMake(0, 0, smallRectangleWidth, smallRectangleHeight);
	_animLayer.path = bezierPath.CGPath;
	_animLayer.strokeStart = 0;
	_animLayer.strokeEnd = 0;
	[self.layer addSublayer:_animLayer];
	
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
	self = [super initWithCoder:decoder];
	if (self) {
		[self initVerticalProgress];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self initVerticalProgress];
	}
	return self;
}

- (void)initVerticalProgress
{
	self.backgroundColor = [UIColor clearColor];
}

- (void)setProgress:(CGFloat)progress{
	if (progress > 1) {
		return;
	}
	_animLayer.strokeEnd = progress;
	CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
	pathAnimation.duration = 1.0;
	pathAnimation.fromValue = [NSNumber numberWithFloat:_progress];
	pathAnimation.toValue = [NSNumber numberWithFloat:_animLayer.strokeEnd];
	[pathAnimation setRemovedOnCompletion:YES];
	[_animLayer addAnimation:pathAnimation forKey:nil];
	_progress = progress;
}

@end
