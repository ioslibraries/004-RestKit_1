//
//  ILEpisodesViewController.m
//  iOSLibs
//
//  Created by jeremy Templier on 15/03/12.
//  Copyright (c) 2012 particulier. All rights reserved.
//

#import "ILEpisodesViewController.h"
#import <RestKit/JSONKit.h>
#import "Episode.h"

@implementation ILEpisodesViewController
@synthesize episodes;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - RestKit 
- (void) sendRequest {
    [[RKClient sharedClient] get:@"/episodes" delegate:self];  
}


- (void)loadEpisodes{
    RKObjectManager* objectManager = [RKObjectManager sharedManager];
    objectManager.client.baseURL = @"http://ioslibs.heroku.com";
    [objectManager loadObjectsAtResourcePath:@"/episodes.json" delegate:self];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    RKLogInfo(@"Load collection of Episodes: %@", objects);
    self.episodes = objects;
    [self.tableView reloadData];
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    RKLogInfo(@"Load collection of Episodes ERROR : %@", error);
}


#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"iOSLibs.com";
    //[self sendRequest];
    [self loadEpisodes];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (self.episodes) {
        return [self.episodes count];
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
//    NSDictionary* episode = [self.episodes objectAtIndex:indexPath.row];
//    [cell.textLabel setText:[NSString stringWithFormat:@"%@", [episode objectForKey:@"name"]]];
//    
    Episode* _episode = [self.episodes objectAtIndex:indexPath.row];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@", _episode.name]];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

//#pragma mark - RKRequestDelegate 
//- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {  
//    if ([request isGET]) {  
//        if ([response isOK]) {  
//            self.episodes = [[response bodyAsString] objectFromJSONString];
//            NSLog(@"Retrieved JSON: %@", self.episodes);  
//            [self.tableView reloadData];
//        }  
//    } 
//}  
@end
