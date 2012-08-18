//
//  NCLButton.h
//  NotificationCenterClearLikeButton
//
//  Created by xiaohaibo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


@interface NCLButton : UIButton
{
    //button state flag;
    BOOL isExpaned;
    
    //frame for button is expanded;
    CGRect frameExpanded;
    
    //frame for button is shrunk;
    CGRect frameShrunk;
    
    //image for button is shrunk
    UIImageView *iconImage;
}

@end
