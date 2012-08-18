//
//  NCLButton.m
//  NotificationCenterClearLikeButton
//
//  Created by xiaohaibo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "NCLButton.h"
#define kButtonWidth 25
#define kButtonHeight 25
#define offset 35

@interface NCLButton ()

@property (nonatomic,assign) BOOL expanded;
@property (nonatomic,assign) CGRect frameExpanded;
@property (nonatomic,assign) CGRect frameShrunk;
@property (nonatomic,retain) UIImageView *iconImage;
 
  

@end

@implementation NCLButton
@synthesize expanded; 
@synthesize frameExpanded; 
@synthesize frameShrunk; 
@synthesize iconImage;

 
 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        isExpaned = NO;
        frameShrunk = CGRectMake(frame.origin.x,frame.origin.y,kButtonWidth, kButtonHeight);
        frameExpanded = CGRectMake(frame.origin.x-offset,frame.origin.y, offset + kButtonWidth, kButtonHeight);
        NSString *title = @"clear";
        [self setTitle:title forState:0];
        [self setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        
        
        [self addTarget:self action:@selector(stateChanged:forControlEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self setBackgroundColor:[UIColor clearColor]];
        //draw rounded border
        CALayer *layer = [self layer];
        [layer setBackgroundColor:[[UIColor blackColor] CGColor]];
        [layer setBorderWidth:2];
        [layer setBorderColor:[[UIColor blackColor] CGColor]];
        [layer setCornerRadius:(float)(kButtonHeight)/2];
        
         //draw inner shadow 
        [[self layer] setShadowOffset:CGSizeMake(0, 0.6)];
        [[self layer] setShadowColor:[[UIColor whiteColor] CGColor]];
        [[self layer] setShadowOpacity:0.5];
        [[self layer] setShadowRadius:0.5];
        
        //add image
        iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1, self.frameShrunk.size.width-4, self.frameShrunk.size.height-4)];
        iconImage.image = [UIImage imageNamed:@"error.png"];
        iconImage.contentMode = UIViewContentModeScaleAspectFill;
        iconImage.backgroundColor = [UIColor clearColor];
        iconImage.center = CGPointMake((self.frameShrunk.size.width)/2, (self.frameShrunk.size.height)/2);
        iconImage.alpha = 1;
        [self addSubview:iconImage];
        
        
          }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//    [self drawInnerShadowInRect:rect fillColor:[UIColor colorWithHex:0x252525]];
//}


- (void)stateChanged:(id)sender forControlEvent:(UIEvent *)event
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(stateDidChanged)];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    if (isExpaned == NO) {
        isExpaned = YES;
        iconImage.transform = CGAffineTransformMakeRotation(-M_PI/2);
        [self setFrame:self.frameExpanded];
        [self setTitleColor:[UIColor colorWithWhite:1 alpha:0.8] forState:UIControlStateNormal];
        iconImage.alpha = 0;
        
    } else {
        isExpaned = NO;        
        iconImage.transform = CGAffineTransformIdentity;
        iconImage.alpha = 1;
        [self setFrame:self.frameShrunk];
        [self setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [UIView commitAnimations];
        
    }
}
-(void)stateDidChanged
{
    NSLog(@"do whatever you want");
}

@end
