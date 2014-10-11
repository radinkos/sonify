//
//  DetailedViewController.h
//  SonifyMe
//
//  Created by Kalpakova, Radina on 11/10/2014.
//  Copyright (c) 2014 Sonify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface DetailedViewController : UIViewController <AVAudioPlayerDelegate, UIAlertViewDelegate>
{
    AVAudioPlayer* audioPlayerPointer;
}

@property (strong, nonatomic)NSString* dataType;
@property (strong, nonatomic)NSString* countryName;

@end
