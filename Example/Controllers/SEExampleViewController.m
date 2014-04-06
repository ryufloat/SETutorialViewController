//
//  SEExampleViewController.m
//  SETutorialViewController
//
//  Created by ryutamaki on 2014/04/06.
//  Copyright (c) 2014年 鎖国法人EDOMODE. All rights reserved.
//

#import "SEExampleViewController.h"

#import "SEExampleTutorialViewController.h"

@interface SEExampleViewController ()

@end

@implementation SEExampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 40.0f, self.view.frame.size.width, 30.0f)];
    label.backgroundColor = [UIColor lightGrayColor];
    label.text = @"Show Tutorial using ...";
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0f, 150.0f, self.view.frame.size.width, 100.0f);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"-presentViewController:\t\t\nanimated:\t\t\ncompletion" forState:UIControlStateNormal];
    button.titleLabel.numberOfLines = 3;
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(showTutorial) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showTutorial
{
    NSMutableArray *tutorialImages = [NSMutableArray array];
    if ([UIScreen mainScreen].bounds.size.height == 568.0f) {
        for (NSUInteger i = 1; i <= 5; i++) {
            [tutorialImages addObject:[UIImage imageNamed:[NSString stringWithFormat:@"tutorial-%02ld-568h.jpg", i]]];
        }
    } else {
        for (NSUInteger i = 1; i <= 5; i++) {
            [tutorialImages addObject:[UIImage imageNamed:[NSString stringWithFormat:@"tutorial-%02ld.jpg", i]]];
        }
    }
    
    SEExampleTutorialViewController *tutorialViewController = [[SEExampleTutorialViewController alloc] initWithImages:tutorialImages];
    [self presentViewController:tutorialViewController animated:YES completion:nil];
}

@end
