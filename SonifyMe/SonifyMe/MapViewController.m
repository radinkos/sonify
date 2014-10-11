//
//  ViewController.m
//  SonifyMe
//
//  Created by Kalpakova, Radina on 11/10/2014.
//  Copyright (c) 2014 Sonify. All rights reserved.
//

#import "MapViewController.h"
#import "DetailedViewController.h"

@interface MapViewController ()

@property (strong, nonatomic) NSArray *countries;

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ukButtonPressed:(id)sender
{
    DetailedViewController *detailedVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailedViewController"];
    [self.navigationController pushViewController:detailedVC animated:YES];
}

@end
