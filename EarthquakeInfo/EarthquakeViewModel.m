//
//  EarthquakeViewModel.m
//  EarthquakeInfo
//
//  Created by Tasvir H Rohila on 14/10/2015.
//  Copyright © 2015 Tasvir H Rohila. All rights reserved.
//

#import "EarthquakeViewModel.h"
#import "Constants.h"
#import "AFNetworking.h"

@implementation EarthquakeViewModel

+ (EarthquakeViewModel*)sharedInstance
{
    // 1
    static EarthquakeViewModel *_sharedInstance = nil;
    
    // 2
    static dispatch_once_t oncePredicate;
    
    // 3
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[EarthquakeViewModel alloc] init];
        [_sharedInstance initEarthQuakeDataModel];
    });
    return _sharedInstance;
}

/*
- (instancetype) init {
    self = [[EarthquakeViewModel alloc] init];
    if (self) {
        [self initEarthQuakeDataModel];
    }
    return self;
}
*/
- (void) initEarthQuakeDataModel {
    _earthquakeDataModel = [[EarthquakeDataModel alloc] init];
}

- (void) searchEarthquakeData {
    NSURL *url = [NSURL URLWithString:kUrlSearch];
     NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes =
    [NSSet setWithObjects:@"application/octet-stream", @"text/plain", nil];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self populateDataModel:responseObject withError:nil];
        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self populateDataModel:nil withError:error];
        });
    }];
    
    // 5
    [operation start];
}


- (void) populateDataModel: (NSDictionary *) responseData withError:(NSError *)error {
    //NSError *error;
    /*NSDictionary *quakeData = [NSJSONSerialization
                               JSONObjectWithData:responseData
                               options:kNilOptions
                               error:&error];*/
    if (responseData) {
        NSLog(@"Quake Data %@",responseData);
        NSArray *fetchedArr = [responseData objectForKey:@"earthquakes"];
        [_earthquakeDataModel populateData:fetchedArr];
    }
    [self.delegate didFinishLoadingData:error];
    
}

- (NSUInteger) getDataCount {
    return [_earthquakeDataModel getDataCount];
}

- (NSString *) getDateTime: (NSInteger) index {
    return [_earthquakeDataModel getDateTime:index];
}
- (NSString *) getLocation: (NSInteger) index {
    return [_earthquakeDataModel getLocation:index];
}
- (NSString *) getLat: (NSInteger) index {
    return [_earthquakeDataModel getLat:index];
}
- (NSString *) getLon: (NSInteger) index {
    return [_earthquakeDataModel getLon:index];
}

- (NSArray *) getallLocations {
    return [_earthquakeDataModel getallLocations];
}
@end
