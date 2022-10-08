//
//  TCWindowController.m
//  TCDownloadReturn-1.3_1
//
//  Created by Mattia Leggieri on 06/10/22.
//

#import "TCViewController.h"

@implementation TCViewController

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"Initializing class %@", [self class]);
    }
    return self;
}

- (NSSize)displayPixelSize {
    NSLog(@"Call to %s", sel_getName(_cmd));
    NSScreen *screen = [NSScreen mainScreen];
    NSDictionary *description = [screen deviceDescription];
    return [[description objectForKey:NSDeviceSize] sizeValue];
}

- (TCView *)mainView {
    NSLog(@"Call to %s", sel_getName(_cmd));
    [_mainView setWantsLayer:YES];
    //[_mainView setNeedsDisplay:YES];
    _mainView.layer.backgroundColor = [[NSColor yellowColor] CGColor];
    return _mainView;
}

#pragma mark - Metodi per modificare la vista

- (void)windowDidResize:(NSNotification *)notification {

    TCWindow *window = notification.object;
    NSLog(@"window size = %f : width - %f : height", window.frame.size.width, window.frame.size.height);
    
// TODO: Modifiche posizione e misure degli oggetti
    
    NSSize viewSize = NSMakeSize(window.frame.size.width+30, window.frame.size.height);
    [_mainView setFrameSize: viewSize];
    
    NSPoint buttonOrigin = NSMakePoint(window.frame.size.width-90-10, 10);
    [_ok setFrameOrigin: buttonOrigin];
    
    
    [_maskL setFrameSize: NSMakeSize(window.frame.size.width/100*50-20, _maskL.frame.size.height)];
    [_maskL setFrameOrigin: NSMakePoint(10, window.frame.size.height-30-10-_maskL.frame.size.height)];
    
    [_labelL setFrameSize: NSMakeSize(_maskL.frame.size.width, _labelL.frame.size.height)];
    [_labelL setFrameOrigin: NSMakePoint(0, _textViewL.frame.size.height)];
    
    [_textViewL setFrameSize: NSMakeSize(_maskL.frame.size.width, _textViewL.frame.size.height)];
    [_textViewL setFrameOrigin: NSMakePoint(0, 0)];
    
    [_textViewR setFrameSize: NSMakeSize(window.frame.size.width/100*50-10, _textViewR.frame.size.height)];
    [_textViewR setFrameOrigin: NSMakePoint(window.frame.size.width-_textViewR.frame.size.width-10, window.frame.size.height-30-10-_textViewR.frame.size.height)];
    
}


- (void)windowWillClose:(NSNotification *)notification {
    NSLog(@"Application closed!");
    exit(0);
}

@end
