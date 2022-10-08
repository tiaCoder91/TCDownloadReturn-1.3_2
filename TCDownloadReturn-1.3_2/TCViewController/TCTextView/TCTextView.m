//
//  TCTextView.m
//  TCDownloadReturn-1.3_1
//
//  Created by Mattia Leggieri on 06/10/22.
//

#import "TCTextView.h"

@implementation TCTextView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    if (self = [super initWithFrame:frameRect]) {
        self.font = [NSFont systemFontOfSize:12.0];
        //[self setBackgroundColor: [NSColor yellowColor]];
    }
    return self;
}

@end
