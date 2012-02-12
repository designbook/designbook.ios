//
//  AdditionalInfoViewController.m
//  DesignBook
//
//  Created by Ian Grossberg on 2/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AdditionalInfoViewController.h"

@interface AdditionalInfoViewController(Private)
-( void )show;
-( void )hide;
@end

@implementation AdditionalInfoViewController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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

#pragma mark - View lifecycle

-( void )dealloc 
{
    [ imageAsset release ];
    imageAsset = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [ delegate attachView:self.view ];
    [ self show ];
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

#pragma mark -
-( void )show
{
    [ image setImage:imageAsset ];
    if ( self.view )
    {
        CGRect useStartFrame = [ delegate getMatchFrame ];
        [ self.view setFrame:CGRectMake( 0, 0, useStartFrame.size.width, useStartFrame.size.height ) ];
//        [ self.view setFrame:startFrame ];
        [ description setText:@"" ];
        self.view.transform = CGAffineTransformMakeScale(2,2);
        [ UIView beginAnimations:@"AdditionalInfo_Show" context:NULL ];
        [ UIView setAnimationDuration:0.25 ];
        self.view.transform = CGAffineTransformMakeScale(1,1);
        self.view.alpha = 1.0;
        [ UIView commitAnimations ];
    }
}

-( void )hide
{
    [ UIView beginAnimations:@"AdditionalInfo_Hide" context:self ];
    [ self.view setFrame:startFrame ];
    [ UIView setAnimationDuration:0.5 ];
    [ UIView commitAnimations ];
}

-( void )setImageAndShow:( UIImage* )setImage startFrame:( CGRect )setStartFrame
{
    startFrame = setStartFrame;
    if ( imageAsset )
    {
        [ imageAsset release ];
    }
    imageAsset = [ setImage retain ];
    [ self show ];
}

-( IBAction)post:(id)sender
{
    [ self hide ];
    [ delegate finished ];
}

-( IBAction)postAndShare:(id)sender
{
    [ self hide ];
    [ delegate finished ];
}

-( IBAction )activityPushed:(id)sender
{
    [ requirements setHighlighted:NO ];
    [ affinityWall setHighlighted:NO ];
    [ userFlow setHighlighted:NO ];
    if ( [ sender isKindOfClass:[ UIButton class ] ] )
    {
        UIButton* button = ( UIButton* )sender;
        [ button setHighlighted:YES ];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [ textField resignFirstResponder ];
    return YES;
}


// TODO: http://mobile.tutsplus.com/tutorials/iphone/ios-sdk-keeping-content-from-underneath-the-keyboard/
-( IBAction )startedEditing:(id)sender
{
    if ( sender == description )
    {
        descriptionOriginalFrame = [ description frame ];
        [ UIView beginAnimations:@"DescriptionKeyboard_Show" context:NULL ];
        [ UIView setAnimationDuration:0.2 ];
        [ description setFrame:CGRectMake( 0, 234, [ self.view frame ].size.width, descriptionOriginalFrame.size.height ) ];
        [ UIView commitAnimations ];
    }
}

-( IBAction )finishedEditing:(id)sender
{
    if ( sender == description )
    {
        [ UIView beginAnimations:@"DescriptionKeyboard_Hide" context:NULL ];
        [ UIView setAnimationDuration:0.2 ];
        [ description setFrame:descriptionOriginalFrame ];
        [ UIView commitAnimations ];
    }
}

@end
