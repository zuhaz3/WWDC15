//
//  ViewController.m
//  Zuhayeer Musa
//
//  Created by Zuhayeer Musa on 4/19/15.
//  Copyright (c) 2015 Zuhayeer Musa. All rights reserved.
//

#import "ViewController.h"
#import "Zuhayeer_Musa-Swift.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Zuhayeer Musa";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor darkGrayColor]}];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    CGRect newFrame = self.tableHeaderView.frame;
    newFrame.size.height = 370;
    self.tableHeaderView.frame = newFrame;
    [self.tableView setTableHeaderView:self.tableHeaderView];
    self.navigationController.navigationBar.hidden = YES;
    
    UIView *addStatusBar = [[UIView alloc] init];
    addStatusBar.frame = CGRectMake(0, 0, 400, 20);
    addStatusBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:addStatusBar];
    self.bgStatus = addStatusBar;
    
    self.data = @[@[@"Background", @"A little bit about me and my interests", @"goldengatefade.jpg", @"505050"],@[@"Projects", @"Elegantly crafted code with crisp functionality", @"snowpeakfade.jpg", @"606060"],@[@"Career", @"Where I have worked and what I do now", @"urbancityfade.jpg", @"707070"],@[@"Contact", @"Like my work? Let's get in touch", @"rotaryphone.jpg", @"808080"]];
}

-(void)viewDidAppear:(BOOL)animated {
    if (firstTime) {
        [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(bounceScrollView) userInfo:nil repeats:NO];
        firstTime = NO;
    }
}

- (void)bounceScrollView {
    [self.tableView setContentOffset:CGPointMake(0, -20) animated:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(unbounceScrollView) userInfo:nil repeats:NO];
}

- (void)unbounceScrollView {
    [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
    [self.tableView setScrollEnabled:YES];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"TableCell";
    CategoryTableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CategoryTableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.numberOfLines = 0;
    }

    // TextLabel
    cell.titleLabel.text = self.data[indexPath.row][0];
    cell.titleLabel.textColor = [UIColor whiteColor];
    UIFont *myFont = [UIFont fontWithName: @"HelveticaNeue-Light" size:24.0];
    cell.titleLabel.font = myFont;
    
    // DetailTextLabel
    cell.detailLabel.text = self.data[indexPath.row][1];
    cell.detailLabel.textColor = [UIColor whiteColor];
    UIFont *myDetailFont = [UIFont fontWithName: @"HelveticaNeue-Thin" size:14.0];
    cell.detailLabel.font = myDetailFont;
    
    NSString *imgName = [NSString stringWithFormat:@"%@", self.data[indexPath.row][2]];
    UIImage *imageView = [UIImage imageNamed:imgName];
    cell.backgroundView = [[UIImageView alloc] initWithImage:imageView];
    cell.backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    cell.backgroundView.clipsToBounds = YES;
    cell.clipsToBounds = YES;
    
    [cell sendSubviewToBack:cell.tintView];
    cell.tintView.hidden = YES;
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [self colorWithHexString:@"FFFFFF" withAlpha:0.3];
    [cell setSelectedBackgroundView:bgColorView];
    
    return cell;
}

- (void)addGradientToView:(UIView *)view
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    gradient.colors = @[(id)[[UIColor clearColor] CGColor],
                        (id)[[self colorWithHexString:@"000000" withAlpha:1.0] CGColor]];
    [view.layer insertSublayer:gradient atIndex:0];
}

-(UIColor*)colorWithHexString:(NSString*)hex withAlpha:(CGFloat)alphaC
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alphaC];
}

-(void)scrollViewDidScroll: (UIScrollView*)scrollView {
    if ([self isAtTopOfCells]) {
        UIView *addStatusBar = [[UIView alloc] init];
        addStatusBar.frame = CGRectMake(0, 0, 400, 20);
        addStatusBar.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:addStatusBar];
        self.bgStatus = addStatusBar;
        [UIView animateWithDuration:0.3 animations:^{
            self.navigationController.navigationBar.alpha = 0;
        } completion: ^(BOOL finished) {
            self.navigationController.navigationBar.hidden = finished;
        }];
    } else {
        [self.bgStatus removeFromSuperview];
        [UIView animateWithDuration:0.3 animations:^{
            self.navigationController.navigationBar.alpha = 1.0;
        } completion: ^(BOOL finished) {
            self.navigationController.navigationBar.hidden = !finished;
        }];
    }
    
    CGFloat y = -scrollView.contentOffset.y;
    if (y > 0) {
        self.profile.frame = CGRectMake(self.profile.frame.origin.x, scrollView.contentOffset.y/2 + 60, self.profile.frame.size.width, self.profile.frame.size.height);
        self.username.frame = CGRectMake(self.username.frame.origin.x, scrollView.contentOffset.y/2 + 60 + 117, self.username.frame.size.width, self.username.frame.size.height);
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"BackgroundSegue" sender:self];
    } else if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"ProjectSegue" sender:self];
    } else if (indexPath.row == 2) {
        [self performSegueWithIdentifier:@"CareerSegue" sender: self];
    } else {
        if ([MFMailComposeViewController canSendMail]) {
            MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
            mail.mailComposeDelegate = (id<MFMailComposeViewControllerDelegate>) self;
            [mail setToRecipients:@[@"zuhayeer@berkeley.edu"]];
            
            [self presentViewController:mail animated:YES completion:NULL];
        }
        else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                            message:@"Unfortunately, this device is not able to send mail."
                                                           delegate:self
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)resumeTapped:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://zmusa.me/zuhayeer-musa-resume-v8.0.pdf"]];
}

- (IBAction)websiteTapped:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://zmusa.me"]];
}

- (BOOL)isAtTop {
    return (self.tableView.contentOffset.y <= [self verticalOffsetForTop] - 350 + 45);
}

- (BOOL)isAtTopOfCells {
    return (self.tableView.contentOffset.y <= [self verticalOffsetForTop]);
}

- (BOOL)isBelowCells {
    return (self.tableView.contentOffset.y > [self verticalOffsetForTop]);
}

- (CGFloat)verticalOffsetForTop {
    CGFloat topInset = self.tableView.contentInset.top;
    return -topInset + 350 - 45;
}

-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
