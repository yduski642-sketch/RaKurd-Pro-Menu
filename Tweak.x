#import <UIKit/UIKit.h>

%hook UnityAppController
- (void)applicationDidBecomeActive:(id)application {
    %orig;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"RA KURD PRO" 
                                message:@"ب خێرهاتی بۆ مێنۆیا نوو\nCreated by Yousif Duski" 
                                preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *telegram = [UIAlertAction actionWithTitle:@"Join Telegram" 
                                style:UIAlertActionStyleDefault 
                                handler:^(UIAlertAction * action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://t.me/YOUR_CHANNEL"] options:@{} completionHandler:nil];
    }];

    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"START" style:UIAlertActionStyleDestructive handler:nil];

    [alert addAction:telegram];
    [alert addAction:ok];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}
%end
