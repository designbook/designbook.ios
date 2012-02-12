//
//  AdditionalInfoViewController.h
//  DesignBook
//
//  Created by Ian Grossberg on 2/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AdditionalInfoViewDelegate;

@interface AdditionalInfoViewController : UIViewController< UITextFieldDelegate >
{
    IBOutlet UIImageView* image;
    IBOutlet UIButton* requirements;
    IBOutlet UIButton* affinityWall;
    IBOutlet UIButton* userFlow;
    IBOutlet UITextField* description;
    CGRect descriptionOriginalFrame;
    
    IBOutlet UIButton* post;
    IBOutlet UIButton* postAndShare;
    
    CGRect startFrame;
    UIImage* imageAsset;
    id< AdditionalInfoViewDelegate > delegate;
}

@property( nonatomic, assign )   id< AdditionalInfoViewDelegate >   delegate;
-( void )setImageAndShow:( UIImage* )image startFrame:( CGRect )startFrame;
-( IBAction)post:(id)sender;
-( IBAction)postAndShare:(id)sender;

-( IBAction )activityPushed:(id)sender;

-( IBAction )startedEditing:(id)sender;
-( IBAction )finishedEditing:(id)sender;

@end

@protocol AdditionalInfoViewDelegate <NSObject>

-( CGRect )getMatchFrame;
-( void )attachView:( UIView* )view;
-( void )finished;

@end