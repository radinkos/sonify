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
    
    UIActionSheet *actionSheet = [self createActionSheet];
    actionSheet.tag = 100;
    [actionSheet showFromRect:[(UIButton *)sender frame] inView:self.view animated:YES];
}


- (IBAction)canadaButtonPressed:(id)sender

{
    UIActionSheet *actionSheet = [self createActionSheet];
    actionSheet.tag = 200;
    [actionSheet showFromRect:[(UIButton *)sender frame] inView:self.view animated:YES];
}

- (IBAction)japanButtonPressed:(id)sender

{
    
    UIActionSheet *actionSheet = [self createActionSheet];
    [actionSheet showFromRect:[(UIButton *)sender frame] inView:self.view animated:YES];
    actionSheet.tag = 300;
}


- (UIActionSheet *)createActionSheet;

{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select"
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"CO2",@"Rainfall", @"Temperature ", nil];
    
   
    
    //[actionSheet showInView:self.view];
    
    return actionSheet;
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    DetailedViewController *detailedVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailedViewController"];
    BOOL buttonIsPressed = NO;
    if (buttonIndex == 0) {
        buttonIsPressed = YES;
        
        detailedVC.dataType=@"CO2";
    }
    
    else if (buttonIndex == 1){
        buttonIsPressed = YES;
        detailedVC.dataType=@"Rainfall";
    }
    
    else if (buttonIndex == 2) {
        buttonIsPressed = YES;
        detailedVC.dataType=@"Temperature";
    }
    
    
    
    
    if (actionSheet.tag == 100) {
        detailedVC.countryName = @"UK";
    }else if(actionSheet.tag == 200){
        detailedVC.countryName = @"Canada";
    }else if(actionSheet.tag == 300){
        detailedVC.countryName = @"Japan";
    }
    
    
    if (buttonIsPressed) {
        [self.navigationController pushViewController:detailedVC animated:YES];
    }
    
    
    
    
    
}


@end
