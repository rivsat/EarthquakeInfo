//
//  EarthquakeDataModel.m
//  EarthquakeInfo
//
//  Created by Alex Louey on 14/10/2015.
//  Copyright© @2015 Tasvir H Rohila All rights reserved.
//

#import "EarthquakeDataModel.h"

@implementation EarthquakeDataModel

- (instancetype) init {
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void) initData {
    _locationDataArray = [[NSMutableArray alloc] init];
}

-(void) populateData: (NSArray *) dataArray {
    _locationDataArray = [dataArray mutableCopy];
}

- (NSUInteger) getDataCount {
    return [_locationDataArray count];
}

- (NSString *) getDateTime: (NSInteger) index {
    NSDictionary *dic = [_locationDataArray objectAtIndex:index];
    return [dic objectForKey:@"timedate"];
}
- (NSString *) getLocation: (NSInteger) index {
    NSDictionary *dic = [_locationDataArray objectAtIndex:index];
    return [dic objectForKey:@"region"];
}
- (NSString *) getLat: (NSInteger) index {
    NSDictionary *dic = [_locationDataArray objectAtIndex:index];
    return [dic objectForKey:@"lat"];
    
}
- (NSString *) getLon: (NSInteger) index {
    NSDictionary *dic = [_locationDataArray objectAtIndex:index];
    return [dic objectForKey:@"lon"];
}

- (NSArray*) getallLocations {
    return _locationDataArray;
}

@end
