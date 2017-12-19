//
//  HomeViewController.m
//  demo
//
//  Created by  Forfarming on 2017/12/15.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTwoViewController.h"

#import "MBProgressHUD.h"
#import <Photos/Photos.h>

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backView.backgroundColor = [UIColor yellowColor];
    
    self.rootViewNavgationBar.rightItem = [[XYYBarButtonItem alloc] initWithTitle:@"Choose" target:self action:@selector(rightItemAction)];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,GlobalNavHeight, SCREEN_WIDTH, SCREEN_HEIGHT - GlobalNavHeight - (SafeAreaBottomHeight + 49)) style:UITableViewStylePlain];
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.backView addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cell_id = @"homeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTwoViewController *vc = [[HomeTwoViewController alloc] init];
    vc.title = @"HOME_TWO";
    [self.ctrl.navigationController pushViewController:vc animated:YES];
}

- (void)rightItemAction {
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle: nil message: nil preferredStyle:UIAlertControllerStyleActionSheet];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertAction *cameraAction =  [UIAlertAction actionWithTitle: @"拍摄照片" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self openImageViewController:UIImagePickerControllerSourceTypeCamera];
        }];
        [alertController addAction:cameraAction];
    }
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"从相册选取" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        [self openImageViewController:UIImagePickerControllerSourceTypePhotoLibrary];
    }];
    [alertController addAction:photoAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    
    [self presentViewController: alertController animated: YES completion: nil];
}

//打开相册或相机
- (void)openImageViewController:(NSUInteger)sourceType {
    if (sourceType == UIImagePickerControllerSourceTypeCamera) {
        if ([self FZJhaveCameraAuthority]) {
            UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                UIImagePickerController * picker = [[UIImagePickerController alloc]init];
                picker.delegate = self;
                picker.sourceType = sourceType;
                [self presentViewController:picker animated:YES completion:nil];
            }else{
                
            }
        }else{
            [self MBProgressWithText:@"请在\"设置-隐私-相机\"中允许访问相机" margin:2.0];
        }
    }else{
        if ([self FZJhaveAlbumAuthority]) {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (status == PHAuthorizationStatusAuthorized) {
                    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
                    imagePickerController.delegate = self;
                    [imagePickerController.navigationBar setTintColor:[UIColor blackColor]];
                    imagePickerController.sourceType = sourceType;
                    [self presentViewController:imagePickerController animated:YES completion:^{
                        
                    }];
                }else{
                    
                }
            }];
        }else{
            [self MBProgressWithText:@"请在\"设置-隐私-相册\"中允许访问相册" margin:2.0];
        }
    }
}

#pragma mark - 相册、相机回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];

    [picker dismissViewControllerAnimated:YES completion:^{
        HomeTwoViewController *vc = [[HomeTwoViewController alloc] init];
        vc.image = image;
        vc.title = @"HOME_TWO";
        [self.ctrl.navigationController pushViewController:vc animated:YES];
    }];
}

#pragma mark --  判断对相册和相机的使用权限
/**
 *  相册的使用权限
 *
 *  @return 是否
 */
-(BOOL)FZJhaveAlbumAuthority {
    
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied) {
        return NO;
    }
    return YES;
}
/**
 *  相机的使用权限
 *
 *  @return 是否
 */
-(BOOL)FZJhaveCameraAuthority {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusRestricted || status == AVAuthorizationStatusDenied) {
        return NO;
    }
    return YES;
}

#pragma mark - 菊花显示
- (void)MBProgressWithText:(NSString *)text margin:(float)margin {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.backView animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:margin];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
