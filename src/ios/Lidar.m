#import <ARKit/ARKit.h>
#import <Cordova/CDV.h>

@interface Lidar : CDVPlugin <ARSessionDelegate>
@property (nonatomic, strong) ARSession *session;
@property (nonatomic, strong) ARSCNView *sceneView;
- (void)startLidar:(CDVInvokedUrlCommand*)command;
@end

@implementation Lidar

- (void)startLidar:(CDVInvokedUrlCommand*)command {
    // Create and configure the ARSCNView
    self.sceneView = [[ARSCNView alloc] initWithFrame:self.webView.bounds];
    [self.viewController.view addSubview:self.sceneView];
    self.sceneView.delegate = self;

    self.session = [ARSession new];
    self.sceneView.session = self.session;
    self.session.delegate = self;

    ARWorldTrackingConfiguration *config = [ARWorldTrackingConfiguration new];
    config.planeDetection = ARPlaneDetectionHorizontal | ARPlaneDetectionVertical;

    [self.session runWithConfiguration:config];
}

- (void)session:(ARSession *)session didUpdateFrame:(ARFrame *)frame {
    // Handle LiDAR data here
    // For example, log the frame data
    NSLog(@"%@", frame);
}

@end
