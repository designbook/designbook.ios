//
//  PullDownViewController.h
//  DesignBook
//
//  Created by Ian Grossberg on 2/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PullDownViewController : UIViewController< UITableViewDelegate, UITableViewDataSource >
{
    IBOutlet UIButton*      button;
    IBOutlet UITableView*   selections;
    
    NSMutableArray* options;
}

@property ( readwrite, retain ) UIButton* button;
@property ( readwrite, retain ) UITableView* selections;

-( IBAction )buttonPressed:(id)sender;

@end
