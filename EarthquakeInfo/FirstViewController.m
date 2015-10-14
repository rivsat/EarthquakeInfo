//
//  FirstViewController.m
//  EarthquakeInfo
//
//  Created by Tasvir H Rohila on 14/10/2015.
//  Copyright © 2015 Tasvir H Rohila. All rights reserved.
//

#import "FirstViewController.h"
#import "InfoTableViewCell.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSString* kTableCellIdentifier;
@property (retain, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (retain, nonatomic) EarthquakeViewModel *earthQuakeViewModel;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _kTableCellIdentifier = @"infoCell";
    [_tableView setHidden:YES];
    [self initActivityIndicator];
    [self intiViewModel];
    [self searchEarthquakeData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initActivityIndicator {
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityIndicator.frame = CGRectMake(self.view.frame.origin.x,
                                          self.view.frame.origin.y,
                                          self.view.frame.size.width,
                                          self.view.frame.size.height);
    [self.view addSubview:_activityIndicator];
    [_activityIndicator startAnimating];

    // Initialize the refresh control.
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor grayColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                            action:@selector(searchEarthquakeData)
                  forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
}

-  (void) intiViewModel {
    //_earthQuakeViewModel = [[EarthquakeViewModel alloc] init];
    _earthQuakeViewModel = [EarthquakeViewModel sharedInstance];
    _earthQuakeViewModel.delegate = self;
}

- (void) searchEarthquakeData {
    [_earthQuakeViewModel searchEarthquakeData];
}

- (void) didFinishLoadingData:(NSError *)error {
//TODO
    //refresh tableview
    // 4
    [_activityIndicator stopAnimating];
    [_refreshControl endRefreshing];
    
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
    [_tableView setHidden:NO];
    [_tableView reloadData];
}

#pragma mark - TableView data source methods
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"In cellForRowAtIndexPath. Populating data for row: %ld",indexPath.row);
    InfoTableViewCell *cell = (InfoTableViewCell *)[tableView
                                                        dequeueReusableCellWithIdentifier:_kTableCellIdentifier];
    
    if(cell == nil) {
        cell = [[InfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_kTableCellIdentifier];
    }
    
    cell.locationLabel.text = [_earthQuakeViewModel getLocation:indexPath.row];
    cell.dateLabel.text = [_earthQuakeViewModel getDateTime:indexPath.row];

    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_earthQuakeViewModel getDataCount];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


@end
