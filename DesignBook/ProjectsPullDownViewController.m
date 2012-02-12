//
//  ProjectsPullDownViewController.m
//  DesignBook
//
//  Created by Ian Grossberg on 2/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProjectsPullDownViewController.h"

@implementation ProjectsPullDownViewController

@synthesize currentProject;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [ super viewDidLoad ];
    [ options addObject:@"Best Stuff Around" ];
    [ options addObject:@"Apple Cressant" ];
    [ options addObject:@"Automatic Caution Door" ];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [ super tableView:tableView didSelectRowAtIndexPath:indexPath ];
    [ currentProject setText:[ options objectAtIndex:[ indexPath row ] ] ];
}

@end
