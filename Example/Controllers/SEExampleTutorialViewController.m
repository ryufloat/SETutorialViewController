//
//  SEExampleTutorialViewController.m
//  SETutorialViewController
//
//  Created by ryutamaki on 2014/04/06.
//  Copyright (c) 2014年 鎖国法人EDOMODE. All rights reserved.
//

#import "SEExampleTutorialViewController.h"

@interface SEExampleTutorialViewController ()

@end

@implementation SEExampleTutorialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)endTutorial:(UITapGestureRecognizer *)gestureRecognizer
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
