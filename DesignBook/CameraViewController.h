//
//  CameraViewController.h
//  DesignBook
//
//  Created by Ian Grossberg on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ProjectsPullDownViewController.h"
#import "DesignStagesPullDownViewController.h"

#import "AdditionalInfoViewController.h"

@interface CameraViewController : UIViewController< AdditionalInfoViewDelegate >
{
    IBOutlet UIView*    background;
    
    IBOutlet UIButton*  projectButton;
    IBOutlet UILabel*   projectLabel;
    IBOutlet UILabel*   projectName;
    IBOutlet ProjectsPullDownViewController* projectController;
    
    IBOutlet UIButton*  stageButton;
    IBOutlet UILabel*   stageLabel;
    IBOutlet UILabel*   stageName;    
    IBOutlet DesignStagesPullDownViewController* stageController;
    
    IBOutlet UIButton*  cameraButton;
    
    AVCaptureSession*   captureSession;
    AVCaptureDeviceInput*     captureInput;
    AVCaptureVideoDataOutput* captureVideoDataOutput;
    AVCaptureStillImageOutput* captureStillImageOutput;
    AVCaptureDevice*    captureDevice;
    AVCaptureVideoPreviewLayer* captureLayer;
    
    UIImage* snappedImage;
    
    AdditionalInfoViewController* additionalInfoController;
}

@property ( readwrite, retain ) UIView*     background;

@property ( readwrite, retain ) ProjectsPullDownViewController* projectController;
@property ( readwrite, retain ) UIButton*   projectButton;
@property ( readwrite, retain ) UILabel*    projectLabel;
@property ( readwrite, retain ) UILabel*    projectName;

@property ( readwrite, retain ) DesignStagesPullDownViewController* stageController;
@property ( readwrite, retain ) UIButton*   stageButton;
@property ( readwrite, retain ) UILabel*    stageLabel;
@property ( readwrite, retain ) UILabel*    stageName;

@property ( readwrite, retain ) UIButton*   cameraButton;

-( IBAction )takePicture:( id )sender;

@end
