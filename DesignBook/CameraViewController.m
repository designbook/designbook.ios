//
//  CameraViewController.m
//  DesignBook
//
//  Created by Ian Grossberg on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"

@implementation CameraViewController

@synthesize background;
@synthesize projectButton, projectLabel, projectName, projectController;
@synthesize stageButton, stageLabel, stageName, stageController;
@synthesize cameraButton;

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
    [ captureSession release ];
    captureSession = nil;
    [ captureStillImageOutput release ];
    captureStillImageOutput = nil;
    [ additionalInfoController release ];
    additionalInfoController = nil;
}

- (void)viewDidLoad
{
    [ super viewDidLoad ];
    // Do any additional setup after loading the view from its nib.

    if ( background )
    {
        captureSession = [ [ AVCaptureSession alloc ] init ];
        if ( captureSession )
        {
            captureDevice = [ AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo ];
            
            if ( captureDevice )
            {
                NSError* error = nil;
                captureInput = [ AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error ];
                if ( !captureInput ) 
                {
                    // Handle the error appropriately.
                }
                captureStillImageOutput = [ [ AVCaptureStillImageOutput alloc ] init ];
                captureVideoDataOutput = [ [ AVCaptureVideoDataOutput alloc ] init ];
                                
                if ( [ captureSession canAddInput:captureInput ] && [ captureSession canAddOutput:captureStillImageOutput ] && [ captureSession canAddOutput:captureVideoDataOutput ] )
                {
                    [ captureSession beginConfiguration ];
                    [ captureSession addInput:captureInput ];
                    [ captureSession addOutput:captureStillImageOutput ];
                    [ captureSession addOutput:captureVideoDataOutput ];
                    [ captureSession setSessionPreset:AVCaptureSessionPresetMedium ];
                    [ captureSession commitConfiguration ];
                    
                    captureLayer = [ AVCaptureVideoPreviewLayer layerWithSession:captureSession ];
                    captureLayer.bounds = background.layer.bounds;
                    captureLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
                    captureLayer.position = CGPointMake( CGRectGetMidX( background.layer.bounds ), CGRectGetMidY( background.layer.bounds ) );

                    [ background.layer addSublayer:captureLayer ];
                    
                    [ captureSession startRunning ];
                }
            }
        }
    }
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
    return NO;//(interfaceOrientation == UIInterfaceOrientationPortrait);
}


-( void )pictureTaken:( UIImage* )image
{
    if ( !additionalInfoController )
    {
        additionalInfoController = [ [ AdditionalInfoViewController alloc ] initWithNibName:@"AdditionalInfoViewController" bundle:[ NSBundle mainBundle ] ];
    }
    [ additionalInfoController setDelegate:self ];
    [ additionalInfoController setImageAndShow:image startFrame:
     CGRectMake( 0, [ self.view frame ].size.height, [ self.view frame ].size.width, 50 ) ];
}

-( IBAction )takePicture:( id )sender
{
    AVCaptureConnection* videoConnection = nil;
    for ( AVCaptureConnection* connection in captureStillImageOutput.connections ) 
    {
        for (AVCaptureInputPort *port in [ connection inputPorts ] ) 
        {
            if ( [ [ port mediaType ] isEqual:AVMediaTypeVideo ] ) 
            {
                videoConnection = connection;
                break;
            }
        }
        if ( videoConnection ) 
            { break; }
    }
    
    if ( videoConnection )
    {
        [ captureStillImageOutput
    captureStillImageAsynchronouslyFromConnection:videoConnection 
                                completionHandler:^( CMSampleBufferRef imageDataSampleBuffer, NSError *error )
                        {
                            if (imageDataSampleBuffer != NULL)
                            {
                                NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
                                UIImage *image = [ [ UIImage alloc ] initWithData:imageData ];
                                
                                [ self pictureTaken:image ];
                            }
                        }
        ];
    }
}

-( CGRect )getMatchFrame
{
    return [ self.view frame ];
}

-( void )attachView:( UIView* )view
{
    if ( [ view superview ] != self.view ) 
    {
        [ self.view addSubview:view ];
    }
}

-( void )finished
{
}

@end
