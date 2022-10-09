//
//  TCView.m
//  TCDownloadReturn-1.3_1
//
//  Created by Mattia Leggieri on 06/10/22.
//

#import "TCView.h"

@implementation TCView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)mouseDown:(NSEvent *)theEvent {
    [self.layer setBackgroundColor: [[NSColor redColor] CGColor]];
    [self setNeedsDisplay:YES];
}

@end
