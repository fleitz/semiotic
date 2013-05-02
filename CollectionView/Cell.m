/*
     File: Cell.m
 Abstract: Custom collection view cell for image and its label.
 
  Version: 1.0
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2012 Apple Inc. All Rights Reserved.
 
 */

#import "Cell.h"
#import "CustomCellBackground.h"
#import <QuartzCore/QuartzCore.h>
#define ARC4RANDOM_MAX 0x100000000
CGFloat frand(CGFloat min, CGFloat max){
    CGFloat range = max - min;
    CGFloat pct = ((CGFloat)arc4random())/ARC4RANDOM_MAX;
    return (range*pct)+min;
}

CGFloat normalRand(){
    return frand(0.0, 1.0);
}
@implementation Cell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        // change to our custom selected background view
        CustomCellBackground *backgroundView = [[CustomCellBackground alloc] initWithFrame:CGRectZero];
        self.selectedBackgroundView = backgroundView;
        
        arc4random();
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.circle.backgroundColor = [UIColor colorWithRed:normalRand() green:normalRand() blue:normalRand() alpha:1.0];
    self.circle.clipsToBounds= YES;
    self.circleShadow.layer.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.1 alpha:1.0].CGColor;
    self.circleShadow.layer.shadowOffset = CGSizeMake(-3,-3);
    self.circleShadow.layer.shadowOpacity = 0.3;
    self.circleShadow.layer.shadowRadius = 6.0;
    self.circleShadow.layer.borderWidth = 2.5;
    self.circleShadow.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    CGFloat radius = self.circle.frame.size.width/2.0;
    self.circle.layer.cornerRadius = radius;
    self.circleShadow.layer.cornerRadius = radius;
    self.circleShadow.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.circleShadow.bounds cornerRadius:radius].CGPath;

}

@end
