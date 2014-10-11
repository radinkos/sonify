//
//  DetailedViewController.m
//  SonifyMe
//
//  Created by Kalpakova, Radina on 11/10/2014.
//  Copyright (c) 2014 Sonify. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *graphImageView;
@property (strong, nonatomic) IBOutlet UISlider *slider;

@end

@implementation DetailedViewController 

- (IBAction)playSound:(id)sender {
    [self playSound];
}

- (void)playSound
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[self generateFileName] ofType:@"mp3"]];
    
    audioPlayerPointer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error: nil];
    audioPlayerPointer.delegate = self;
    [audioPlayerPointer setVolume:0.7];
    [audioPlayerPointer play];
    [self animateSlider];
}

- (IBAction)displaMoreInfo:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:[self generateFileName] ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"What am I hearing?"
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
    [self.slider setValue:0];
    
    UIImage *image = [UIImage imageNamed:[self generateFileName]];
    [self.graphImageView setImage:image];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self playSound];
}

- (void)animateSlider
{
    [self.slider setValue:0];
    [UIView animateWithDuration:audioPlayerPointer.duration animations:^{
        [self.slider setValue:1 animated:YES];
    } completion:^(BOOL finished) {
    }];
}

@end
