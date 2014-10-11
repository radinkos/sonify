//
//  Country.m
//  SonifyMe
//
//  Created by Kalpakova, Radina on 11/10/2014.
//  Copyright (c) 2014 Sonify. All rights reserved.
//

#import "Country.h"

@implementation Country

- (id)initWithCountryName:(NSString *)countryName
{
    self = [super init];
    if (self) {
        _countryName = countryName;
        [self loadArraysData];
    }
    
    return self;
}

- (void)loadArraysData
{
    self.tempratureArray = [self loadDataFromFile:[self generateFileNameForPropertyType:@"temp"]];
    self.co2Array = [self loadDataFromFile:[self generateFileNameForPropertyType:@"CO2"]];
    self.rainArray = [self loadDataFromFile:[self generateFileNameForPropertyType:@"rain"]];
}

- (NSString *)generateFileNameForPropertyType:(NSString *)propertyType
{
    return [NSString stringWithFormat:@"%@%@", propertyType, self.countryName];
}


- (NSArray *)loadDataFromFile:(NSString *)fileName
{
    NSMutableArray *actualData = [[NSMutableArray alloc] init];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
    if (filePath) {
        NSString *myText = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        NSArray *dataArray = [myText componentsSeparatedByString:@"\n"];
        
        for (NSString *string in dataArray){
            if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] != 0) {
                [actualData addObject:[NSNumber numberWithDouble:[string doubleValue]]];
            }
            
        }
    }
    return actualData;
}

@end
