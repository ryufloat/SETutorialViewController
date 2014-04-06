//
//  TutorialViewController.m
//  LazyBoy
//
//  Created by ryutamaki on 2013/05/12.
//  Copyright (c) 2013年 鎖国法人EDOMODE. All rights reserved.
//

#import "SETutorialViewController.h"

#import <QuartzCore/QuartzCore.h>

static const CGFloat kPageControlHeight = 40.0f;

@implementation SETutorialViewController

- (id)initWithImages:(NSArray *)images
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        NSAssert(images != nil, @"images must not be nil");
        NSAssert([images count] != 0, @"images should have at least on image");
        
        _tutorialImages = [NSArray arrayWithArray:images];
    }
    return self;
}

- (void)loadView
{
    [super loadView];

    // load scrollView
    _scrollView = [[UIScrollView alloc]init];
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.userInteractionEnabled = YES;
    [self.view addSubview:_scrollView];

    // load pageControl
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.numberOfPages = _tutorialImages.count;
    _pageControl.currentPage = 0;
    [self.view addSubview:_pageControl];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_tutorialImages enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIImage *image = (UIImage*)[_tutorialImages objectAtIndex:idx];
        UIImageView *tutorialImageView = [[UIImageView alloc]initWithImage:image];
        tutorialImageView.layer.cornerRadius = 5.0f;
        tutorialImageView.clipsToBounds = YES;
        
        if(image == (UIImage*)[_tutorialImages lastObject])
        {
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(endTutorial:)];
            [tutorialImageView addGestureRecognizer:singleTap];
            tutorialImageView.userInteractionEnabled = YES;
        }
        [_scrollView addSubview:tutorialImageView];
    }];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _scrollView.contentOffset = CGPointZero;
    _pageControl.currentPage = 0;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGSize screenSize = self.view.frame.size;

    _scrollView.frame = self.view.bounds;
    _scrollView.contentSize = CGSizeMake(screenSize.width * _tutorialImages.count, screenSize.height);
    
    [_scrollView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIImageView *tutorialImageView = (UIImageView *)obj;
        CGSize tutorialImageSize = tutorialImageView.image.size;
        tutorialImageView.frame = CGRectMake((screenSize.width - tutorialImageSize.width) * 0.5f + screenSize.width * idx,
                                             screenSize.height - tutorialImageSize.height - kPageControlHeight,
                                             tutorialImageSize.width, tutorialImageSize.height);
    }];
    
    _pageControl.frame = CGRectMake(0.0f, screenSize.height - kPageControlHeight, screenSize.width, kPageControlHeight);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.scrollView == scrollView) {
        CGFloat pageWidth = self.scrollView.frame.size.width;
        if ((NSInteger)fmod(self.scrollView.contentOffset.x , pageWidth) == 0) {
            // set current page to pageControl
            _pageControl.currentPage = self.scrollView.contentOffset.x / pageWidth;
        }
    }
}

#pragma mark - 
#pragma mark gesture
-(void)endTutorial:(UITapGestureRecognizer*)gestureRecognizer;
{
    // override point
}

@end
