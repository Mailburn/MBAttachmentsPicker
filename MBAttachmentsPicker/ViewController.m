//
//  ViewController.m
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 19/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//

#import "ViewController.h"
#import "MBAttachmentsPickerController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self presentAttachmentsPicker];
}

- (void)presentAttachmentsPicker
{
    MBAttachmentsPickerController *pickerController = [[MBAttachmentsPickerController alloc] init];
    [pickerController addAction:[MBSheetAction actionWithTitle:@"All albums" thumbnail:[UIImage imageNamed:@"icn_albums"] style:MBSheetActionStyleDefault handler:^{
        
    }]];
    [pickerController addAction:[MBSheetAction actionWithTitle:@"Take a picture" thumbnail:[UIImage imageNamed:@"icn_picture"] style:MBSheetActionStyleDefault handler:^{
        
    }]];
    [pickerController addAction:[MBSheetAction actionWithTitle:@"Other apps" thumbnail:[UIImage imageNamed:@"icn_apps"] style:MBSheetActionStyleDefault handler:^{
        
    }]];
    [pickerController addAction:[MBSheetAction actionWithTitle:@"Cancel" thumbnail:nil style:MBSheetActionStyleCancel handler:^{
        
    }]];
    
    [self presentViewController:pickerController animated:YES completion:nil];
}

@end
