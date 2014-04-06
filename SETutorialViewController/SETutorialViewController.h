//
//  TutorialViewController.h
//  LazyBoy
//
//  Created by ryutamaki on 2013/05/12.
//  Copyright (c) 2013年 鎖国法人EDOMODE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SETutorialViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic) NSArray *tutorialImages;

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) UIPageControl *pageControl;

-(id)initWithImages:(NSArray*)images;

// You should over ride this.
// It exist for adjust how to display this viewController.
-(void)endTutorial:(UITapGestureRecognizer*)gestureRecognizer;

@end
