//
//  DetailedViewController.m
//  SonifyMe
//
//  Created by Kalpakova, Radina on 11/10/2014.
//  Copyright (c) 2014 Sonify. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()

@end

@implementation DetailedViewController 

- (IBAction)playSound:(id)sender {
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[self generateFileName] ofType:@"mp3"]];
    
    audioPlayerPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error: nil];
                          audioPlayerPointer.delegate = self;
                          [audioPlayerPointer setVolume:0.7];
                          [audioPlayerPointer play];
}
- (IBAction)displaMoreInfo:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:[self generateFileName] ofType:@"rtf"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"More Information"
                          message:content
                          delegate:nil
                          cancelButtonTitle:@"Back"
                          otherButtonTitles: nil];
    [alert show];
}


- (NSString *)generateFileName
{
    return [NSString stringWithFormat:@"%@%@", self.dataType, self.countryName];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
