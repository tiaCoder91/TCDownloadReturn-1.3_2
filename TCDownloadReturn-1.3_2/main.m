//
//  main.m
//  TCDownloadReturn-1.3_2
//
//  Created by Mattia Leggieri on 06/10/22.
//

#import "TCViewController/TCViewController.h"

/// QUI ANDRANNO TUTTI I SETTAGGI LE INIZIALIZZAZIONI
int main(int argc, const char *argv[]) {
    @autoreleasepool
    {

#pragma mark - NSApplication
        
        NSApplication *app = [NSApplication sharedApplication];
        [app setActivationPolicy: NSApplicationActivationPolicyRegular];
        //[NSApp setActivationPolicy: NSApplicationActivationPolicyRegular];
        
        
#pragma mark - TCViewController
        
        TCViewController *controller = [[TCViewController alloc] init];
        
#pragma mark - TCWindow
        
        NSSize displayPixelSize = [controller displayPixelSize];
        NSSize winSize = NSMakeSize(700, 500);
        
        NSRect frame = NSMakeRect(displayPixelSize.width/2-winSize.width/2, displayPixelSize.height/2-winSize.height/2, winSize.width, winSize.height);
        
        controller.window = [[TCWindow alloc] initWithFrame:frame];
        
        [controller.window setTitle:@"TCDownloadReturn"];
        [controller.window setMinSize:NSMakeSize(700, 530)];
        [controller.window setDelegate: controller];
        
        [controller.window makeKeyAndOrderFront:NSApp];
        
#pragma mark - TCView
        
        NSRect viewFrame = NSMakeRect(0, 0, winSize.width, winSize.height+30);
        controller.mainView = [[TCView alloc] initWithFrame: viewFrame];
        
#pragma mark - Maschera di sinistra
        
        controller.maskL = [[TCView alloc] initWithFrame: NSMakeRect(
            10,
            controller.window.frame.size.height-30-10-controller.window.frame.size.height/100*25,
            controller.window.frame.size.width/100*50-20,
            controller.window.frame.size.height/100*25)
        ];
        
        [controller.maskL setWantsLayer: YES];
        [controller.maskL.layer setBackgroundColor: [[NSColor greenColor] CGColor]];
        [controller.maskL.layer setCornerRadius: 10.0];
        [controller.maskL.layer setBorderWidth: 2.0];
        [controller.maskL.layer setBorderColor: [[NSColor greenColor] CGColor]];
   
#pragma mark - LabelL
        
        NSRect labelLRect = NSMakeRect(
               0,
               controller.maskL.frame.size.height-controller.window.frame.size.height/100*4-10,
               controller.window.frame.size.width/100*50-20,
               controller.window.frame.size.height/100*4
        );
        
        controller.labelL = [[TCTextView alloc] initWithFrame: labelLRect];
        [controller.labelL setString: [NSString stringWithFormat:@"\nInserimento link:"]];
        [controller.labelL setEditable: NO];
        [controller.labelL setSelectable: NO];
        [controller.labelL setBackgroundColor: [NSColor grayColor]];
        [controller.labelL setTextColor: [NSColor whiteColor]];
        
        [controller.maskL addSubview: controller.labelL];
    
#pragma mark - TCTextView ( textViewL )
        
        NSRect textViewLRect = NSMakeRect(
               0,
               0,//controller.window.frame.size.height-30-10-controller.window.frame.size.height/100*12-labelLRect.size.height,
               controller.window.frame.size.width/100*50-20,
               controller.maskL.frame.size.height-controller.labelL.frame.size.height
        );
        
        controller.textViewL = [[TCTextView alloc] initWithFrame: textViewLRect];
        
        //[controller.textViewL setMaxSize:NSMakeSize(displayPixelSize.width, 200)];
        [controller.textViewL setString:@"Hi Mattia!"];
        [controller.textViewL setMyId:1];
        [controller.textViewL setBackgroundColor: [NSColor grayColor]];
        [controller.textViewL setTextColor: [NSColor whiteColor]];
        [controller.textViewL setDelegate: controller];
        
        //[controller.mainView addSubview: controller.textViewL];
        [controller.textViewL setInsertionPointColor: [NSColor whiteColor]];
        
        [controller.maskL addSubview: controller.textViewL];
        [controller.mainView addSubview: controller.maskL];
        
#pragma mark - MaskR
        
        NSRect textViewRRect = NSMakeRect(
               controller.window.frame.size.width-controller.window.frame.size.width/100*50,
               controller.window.frame.size.height-30-10-controller.window.frame.size.height/100*25,
               controller.window.frame.size.width/100*50-10,
               controller.window.frame.size.height/100*25
        );
        
        controller.maskR = [[TCView alloc] initWithFrame: textViewRRect];
        [controller.maskR.layer setBackgroundColor: [[NSColor redColor] CGColor]];
        
        controller.scrollView = [[TCScrollView alloc] initWithFrame: NSMakeRect(0, 0, textViewRRect.size.width, textViewRRect.size.height)];
        controller.scrollView.translatesAutoresizingMaskIntoConstraints = true;
        controller.scrollView.hasVerticalScroller = true;
    
        [controller.maskR addSubview: controller.scrollView];
        
#pragma mark - TCTextView ( textViewR )
        
        controller.textViewR = [[TCTextView alloc] initWithFrame: NSMakeRect(0, 0, textViewRRect.size.width, textViewRRect.size.height)];
        
        //[controller.textViewR setMaxSize:NSMakeSize(displayPixelSize.width, 200)];
        [controller.textViewR setString:@"Questo sarà il log per ora."];
        [controller.textViewR setMyId:2];
        [controller.textViewR setBackgroundColor: [NSColor whiteColor]];
        [controller.textViewR setDelegate: controller];
        
        controller.scrollView.documentView = controller.textViewR;
        [controller.mainView addSubview: controller.maskR];
        
#pragma mark - TCButton ( ok )
        
        controller.ok = [[TCButton alloc] initWithRect: NSMakeRect(controller.window.frame.size.width-90-10, 10, 90, 40)];
        controller.ok.title = @"Ok";
        
        [controller.mainView addSubview: controller.ok];
        
#pragma mark - TCButton ( cancel )
        
        controller.cancel = [[TCButton alloc] initWithRect: NSMakeRect(10, 10, 90, 40)];
        controller.cancel.title = @"Cancel";
        
        [controller.mainView addSubview: controller.cancel];
        
        [controller.window.contentView addSubview: controller.mainView];
        
        
        NSMenu *mainMenu = [[NSMenu alloc] initWithTitle: @"File"];
        
        NSMenuItem *itemApp  = [NSMenuItem new];
        [mainMenu addItem: itemApp];
        
        NSMenu *menuApp = [[NSMenu alloc] init];
        [itemApp setSubmenu: menuApp];
        
        NSMenuItem *itemQuit = [[NSMenuItem alloc] initWithTitle:@"Esci" action:@selector(windowWillClose:) keyEquivalent:@"q"];
        [menuApp addItem: itemQuit];
        
        [menuApp addItemWithTitle:@"Copia" action:@selector(copy:) keyEquivalent:@"c"];
        [menuApp addItemWithTitle:@"Incolla" action:@selector(paste:) keyEquivalent:@"v"];
        [menuApp addItemWithTitle:@"Seleziona tutto" action:@selector(selectAll:) keyEquivalent:@"a"];
        
        [app setMainMenu: mainMenu];
        [app.mainMenu setDelegate: controller];
        
        NSLog(@"menu = %@", [app mainMenu]);
        
        
        [app run];
    }
    return 0;
}
