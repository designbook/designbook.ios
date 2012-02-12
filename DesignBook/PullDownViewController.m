//
//  PullDownViewController.m
//  DesignBook
//
//  Created by Ian Grossberg on 2/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PullDownViewController.h"
#import "PullDownViewCell.h"

@implementation PullDownViewController

@synthesize button;
@synthesize selections;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-( void )dealloc
{
    [ super dealloc ];
    [ options release ];
    options = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    options = [ [ NSMutableArray alloc ] init ];
    [ selections setHidden:YES ];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-( IBAction )buttonPressed:(id)sender
{
    [ selections setHidden:![ selections isHidden ] ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ options count ];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* CellIdentifier = @"PullDown";
    PullDownViewCell* cell = [ tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    if ( cell == nil ) 
    {
        cell = [ [ PullDownViewCell alloc ] init ];
    }
    [ [ cell textLabel ] setText:[ options objectAtIndex:[ indexPath row ] ] ];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [ selections setHidden:YES ];
}

@end
