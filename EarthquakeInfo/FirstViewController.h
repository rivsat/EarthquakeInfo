//
//  FirstViewController.h
//  EarthquakeInfo
//
//  Created by Tasvir H Rohila on 14/10/2015.
//  Copyright © 2015 Tasvir H Rohila. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EarthquakeViewModel.h"

@interface FirstViewController : UIViewController <EarthquakeViewModelDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UIRefreshControl *refreshControl;

@end

