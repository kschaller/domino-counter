//
//  DieButton.m
//  Domino Counter
//
//  Created by Kai Schaller on 1/4/15.
//  Copyright (c) 2015 Kai Schaller. All rights reserved.
//

#import "DieButton.h"
#import <RHAdditions/UIColor+RHInterpolationAdditions.h>

@implementation DieButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self drawButtonWithPips:self.tag];
    }
    
    return self;
}

- (void)drawButtonWithPips:(NSUInteger)pipCount {
    UIGraphicsBeginImageContext(self.frame.size);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *backgroundGradientColor1 = [UIColor colorWithRed: 0.992 green: 0.992 blue: 0.992 alpha: 1];
    UIColor *backgroundGradientColor2 = [UIColor colorWithRed: 0.949 green: 0.941 blue: 0.914 alpha: 1];
    UIColor *borderColor = [UIColor colorWithRed: 0.667 green: 0.667 blue: 0.667 alpha: 0.5];
    
    CGFloat gradientLocations[] = {0, 0.89, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)backgroundGradientColor1.CGColor, (id)[backgroundGradientColor1 blendedColorWithFraction: 0.5 ofColor: backgroundGradientColor2].CGColor, (id)backgroundGradientColor2.CGColor], gradientLocations);
    
    UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:14];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(self.bounds.size.width / 2, 0), CGPointMake(self.bounds.size.width / 2, self.frame.size.height), 0);
    CGContextRestoreGState(context);
    [borderColor setStroke];
    rectanglePath.lineWidth = 0.5;
    [rectanglePath stroke];
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
}

@end
