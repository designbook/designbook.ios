//
//  DesignStagesPullDownViewController.h
//  DesignBook
//
//  Created by Ian Grossberg on 2/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PullDownViewController.h"

@interface DesignStagesPullDownViewController : PullDownViewController
{
    IBOutlet UILabel* currentDesignStage;
}

@property ( readonly, retain ) UILabel* currentDesignStage;

@end
