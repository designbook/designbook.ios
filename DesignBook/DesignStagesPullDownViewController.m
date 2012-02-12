//
//  DesignStagesPullDownViewController.m
//  DesignBook
//
//  Created by Ian Grossberg on 2/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DesignStagesPullDownViewController.h"

@implementation DesignStagesPullDownViewController

@synthesize currentDesignStage;

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
    [ options addObject:@"Empathize" ];
    [ options addObject:@"Define" ];
    [ options addObject:@"Ideate" ];
    [ options addObject:@"Prototype" ];
    [ options addObject:@"Test" ];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [ super tableView:tableView didSelectRowAtIndexPath:indexPath ];
    [ currentDesignStage setText:[ options objectAtIndex:[ indexPath row ] ] ];
}

@end
