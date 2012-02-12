//
//  ProjectsPullDownViewController.h
//  DesignBook
//
//  Created by Ian Grossberg on 2/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PullDownViewController.h"

@interface ProjectsPullDownViewController : PullDownViewController
{
    IBOutlet UILabel* currentProject;
}

@property ( readonly, retain ) UILabel* currentProject;

@end
