//
//  TCScrollView.m
//  TCDownloadReturn-1.3_2
//
//  Created by Mattia Leggieri on 08/10/22.
//

#import "TCScrollView.h"

@implementation TCScrollView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    if (self = [super initWithFrame:frameRect]) {
        [self setWantsLayer: YES];
        [self setNeedsDisplay: YES];
    }
    return self;
}

- (void)mouseDown:(NSEvent *)event {
    NSLog(@"left down.");
}

- (void)mouseDragged:(NSEvent *)event {
    NSLog(@"mouse dragged.");
}

- (void)rightMouseDown:(NSEvent *)event {
    NSLog(@"right down.");
}

@end
