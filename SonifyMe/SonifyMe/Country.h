//
//  Country.h
//  SonifyMe
//
//  Created by Kalpakova, Radina on 11/10/2014.
//  Copyright (c) 2014 Sonify. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property (strong, nonatomic) NSString *countryName;
@property (strong, nonatomic) NSArray *co2Array;
@property (strong, nonatomic) NSArray *rainArray;
@property (strong, nonatomic) NSArray *tempratureArray;

@end
