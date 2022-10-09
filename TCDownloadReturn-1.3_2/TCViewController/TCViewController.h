//
//  TCWindowController.h
//  TCDownloadReturn-1.3_1
//
//  Created by Mattia Leggieri on 06/10/22.
//

#import "TCWindow/TCWindow.h"
#import "TCView/TCView.h"
#import "TCTextView/TCTextView.h"
#import "TCButton/TCButton.h"
#import "TCTask/TCTask.h"
#import "TCThread/TCThread.h"
#import "TCScrollView/TCScrollView.h"

/// QUI ANDRANNO TUTTE LE MODIFICHE DELLA VISTA COMPRESO IL THREAD
@interface TCViewController : NSObject <NSWindowDelegate, NSTextViewDelegate, NSComboBoxDelegate, NSMenuDelegate, NSApplicationDelegate>
@property (nonatomic, strong) TCWindow *window;
@property (nonatomic, strong) TCView *mainView, *maskL, *maskR;
@property (nonatomic, strong) TCTextView *labelL, *textViewL, *labelR, *textViewR;
@property (nonatomic, strong) TCButton *ok, *cancel;
@property (nonatomic, strong) TCScrollView *scrollView;
@property (nonatomic, strong) TCTask *task;
@property (nonatomic, strong) TCThread *thread;
@property (nonatomic, strong) TCScrollView *scrollR;
- (NSSize)displayPixelSize;
@end

