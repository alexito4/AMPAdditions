// Copyright (c) 2014 Alejandro Martinez
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AMPImagePickerManager.h"

@interface AMPImagePickerManager () <UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIViewController *controller;
@property (nonatomic, weak) id<AMPImagePickerManagerDelegate> delegate;

@property (nonatomic) NSInteger cameraOptionIndex;
@property (nonatomic) NSInteger libraryOptionIndex;

@end

@implementation AMPImagePickerManager

- (id)initWithPresentingViewController:(UIViewController *)presentingViewController andDelegate:(id<AMPImagePickerManagerDelegate>)delegate {
    self = [super init];
    if (self) {
        _controller = presentingViewController;
        _delegate = delegate;
    }
    return self;
}

- (void)openPicker {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"Upload photo", @"Upload photo")
                                                       delegate:self
                                              cancelButtonTitle:nil
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:nil];
    UIImagePickerControllerSourceType type;
    NSInteger sources = 0;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.cameraOptionIndex = [sheet addButtonWithTitle:NSLocalizedString(@"Take a photo", @"Take a photo")];
        sources++;
        type = UIImagePickerControllerSourceTypeCamera;
    }
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        self.libraryOptionIndex = [sheet addButtonWithTitle:NSLocalizedString(@"Select from album", @"Select from album")];
        sources++;
        type = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [sheet setCancelButtonIndex:[sheet addButtonWithTitle:NSLocalizedString(@"Cancel", @"Cancel")]];
    if (sources > 1) {
        [sheet showInView:self.controller.view];
    } else {
        [self presentImagePickerControllerWithSourceType:type];
    }
}

#pragma mark -

- (UIColor *)pickerNavigationBarTintColor {
    return [UIColor colorWithRed:0.011764706 green:0.580392157 blue:0.8 alpha:1.00];
}

#pragma mark - Private

- (void)presentImagePickerControllerWithSourceType:(UIImagePickerControllerSourceType)type {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setSourceType:type];
    [picker setDelegate:self];
    [picker.navigationBar setTintColor:[self pickerNavigationBarTintColor]];
    [self.controller presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != actionSheet.cancelButtonIndex) {
        if (buttonIndex == self.cameraOptionIndex) {
            [self presentImagePickerControllerWithSourceType:UIImagePickerControllerSourceTypeCamera];
        } else if (buttonIndex == self.libraryOptionIndex) {
            [self presentImagePickerControllerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        }
    }
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    if ([self.delegate respondsToSelector:@selector(imagePickerManager:didFinishPickingMediaWithInfo:)]) {
        [self.delegate imagePickerManager:self didFinishPickingMediaWithInfo:info];
    }
    
    [self.controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self.controller dismissViewControllerAnimated:YES completion:nil];
}

@end
