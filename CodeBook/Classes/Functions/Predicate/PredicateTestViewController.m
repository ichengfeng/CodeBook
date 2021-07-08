//
//  PredicateTestViewController.m
//  CodeBook
//
//  Created by mac on 2021/7/8.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import "PredicateTestViewController.h"
#import "GirlFriendModel.h"

@interface PredicateTestViewController ()

@end

@implementation PredicateTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     >=，=>：判断左边表达式的值是否大于或等于右边表达式的值
     <=，=<：判断左边表达式的值是否小于或等于右边表达式的值
     >：判断左边表达式的值是否大于右边表达式的值
     <：判断左边表达式的值是否小于右边表达式的值
     !=、<>：判断两个表达式是否不相等
     BETWEEN：BETWEEN表达式必须满足表达式 BETWEEN {下限，上限}的格式，要求该表达式必须大于或等于下限，并小于或等于上限
     CONTAINS:  获取数组中包含某个字符串的元素
     BEGINSWITH：获取数组中以某个字符串开头的
     ENDSWITH：获取数组中以某个字符串结尾的
     LIKE：检查某个字符串是否匹配指定的字符串模板。其之后可以跟?代表一个字符和*代表任意多个字符两个通配符。比如"name LIKE '*ac*'"，这表示name的值中包含ac则返回YES；"name LIKE '?ac*'"，表示name的第2、3个字符为ac时返回YES。
     MATCHES：检查某个字符串是否匹配指定的正则表达式。虽然正则表达式的执行效率是最低的，但其功能是最强大的，也是我们最常用的。
     */
    

//    [self testForCompareOperate];
//    [self testForLogicOperate];
//    [self testForStrCompareOperate];
    [self testForSetOperate];
    
}

///基本比较运算
- (void)testForCompareOperate {
    
    /**
     >=，=>：判断左边表达式的值是否大于或等于右边表达式的值
     <=，=<：判断左边表达式的值是否小于或等于右边表达式的值
     >：判断左边表达式的值是否大于右边表达式的值
     <：判断左边表达式的值是否小于右边表达式的值
     !=、<>：判断两个表达式是否不相等
     BETWEEN：BETWEEN表达式必须满足表达式 BETWEEN {下限，上限}的格式，要求该表达式必须大于或等于下限，并小于或等于上限
     */
    NSArray *numbers = @[@19,@66,@54,@83,@7,@32,@41,@15,@21,@8,@6,@9,@30,@70];
    
    ///筛选出大于30且不等于66也不等于41的部分
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"SELF>30"];
    NSArray *arr1 = [numbers filteredArrayUsingPredicate:predicate1];
    NSLog(@"\n符合条件的数字 === %@",[arr1 componentsJoinedByString:@","]);
    
    ///获取30到70之间的
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"SELF BETWEEN{30,70}"];
    NSArray *arr2 = [numbers filteredArrayUsingPredicate:predicate2];
    NSLog(@"\n符合条件的数字 === %@",[arr2 componentsJoinedByString:@","]);
    
    BOOL isContain = [predicate2 evaluateWithObject:@67];
    NSLog(@"===%d",isContain);
}

/// 逻辑运算符
- (void)testForLogicOperate {
    /**
     AND、&&：逻辑与，要求两个表达式的值都为YES时，结果才为YES。
     OR、||：逻辑或，要求其中一个表达式为YES时，结果就是YES
     NOT、 !：逻辑非，对原有的表达式取反
     */
    NSArray *numbers = @[@19,@66,@54,@83,@7,@32,@41,@15,@21,@8,@6,@9];
    
    ///筛选出大于30且不等于66也不等于41的部分
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"SELF>30 && (SELF<>66 || self!=41)"];
    NSArray *arr1 = [numbers filteredArrayUsingPredicate:predicate1];
    NSLog(@"\n符合条件的数字 === %@",[arr1 componentsJoinedByString:@","]);
}

/// 字符串比较
- (void)testForStrCompareOperate {
    
    /**
     CONTAINS:  获取数组中包含某个字符串的元素
     BEGINSWITH：获取数组中以某个字符串开头的
     ENDSWITH：获取数组中以某个字符串结尾的
     LIKE：检查某个字符串是否匹配指定的字符串模板。其之后可以跟?代表一个字符和*代表任意多个字符两个通配符。比如"name LIKE '*ac*'"，这表示name的值中包含ac则返回YES；"name LIKE '?ac*'"，表示name的第2、3个字符为ac时返回YES。
     MATCHES：检查某个字符串是否匹配指定的正则表达式。虽然正则表达式的执行效率是最低的，但其功能是最强大的，也是我们最常用的。
     */
    
    
    NSMutableArray *singers = [NSMutableArray arrayWithObjects:@"Talor•Swift",@"LadyGaGa",@"Michael•Jackson",@"FoolsGarden",@"ColbieCaillat",@"FloRida",@"Kim",@"JustinBieber",@"Beyonce",@"Kelly",@"Delacey",@"13673468369", nil];
    
    ///获取数组中包含某个字符串的元素 CONTAINS
    ///c表示不区分大小写 d表示不区分发音符号
    ///cd就可以表示即不区分大小写 也不区分发音符号
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] '•'"];
    NSArray *arr1 = [singers filteredArrayUsingPredicate:predicate1];
    NSLog(@"\n包含•的歌手名 === %@",[arr1 componentsJoinedByString:@","]);
    
    ///获取数组中以某个字符串开头的 BEGINSWITH
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH[cd] 'F'"];
    NSArray *arr2 = [singers filteredArrayUsingPredicate:predicate2];
    NSLog(@"\n开头是F的歌手名 === %@",[arr2 componentsJoinedByString:@","]);
    
    ///获取数组中以某个字符串结尾的 ENDSWITH
    NSPredicate *predicate3 = [NSPredicate predicateWithFormat:@"SELF ENDSWITH[cd] 'T'"];
    NSArray *arr3 = [singers filteredArrayUsingPredicate:predicate3];
    NSLog(@"\n结尾是T的歌手名 === %@",[arr3 componentsJoinedByString:@","]);
    
    ///检查某个字符串是否匹配指定的字符串模板 LINK
    NSPredicate *predicate4 = [NSPredicate predicateWithFormat:@"SELF LIKE[cd] '*ll*'"];
    NSArray *arr4 = [singers filteredArrayUsingPredicate:predicate4];
    NSLog(@"\n匹配到ll的歌手名 === %@",[arr4 componentsJoinedByString:@","]);
    
    ///检查某个字符串是否匹配指定的正则表达式 MATCHES
    NSPredicate *predicate5 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^(13|15|18|14|17|16|19){1}[0-9]{9}$"];
    NSArray *arr5 = [singers filteredArrayUsingPredicate:predicate5];
    NSLog(@"\n符合正则表达式的歌手名 === %@",[arr5 componentsJoinedByString:@","]);
}

/// 集合运算符
- (void)testForSetOperate {
    /**
     ANY、SOME：集合中任意一个元素满足条件，就返回YES。
     ALL：集合中所有元素都满足条件，才返回YES。
     NONE：集合中没有任何元素满足条件就返回YES。如:NONE person.age < 18，表示person集合中所有元素的age>=18时，才返回YES。
     IN：等价于SQL语句中的IN运算符，只有当左边表达式或值出现在右边的集合中才会返回YES。我们通过一个例子来看一下
     */
//    NSArray * arr = @[@"a",@"ba",@"AB",@"ABB"];
////@[@[@"a",@"b",@"AB",@"ABB"],@[@"a",@"ba",@"AB",@"ABB"],@[@"ab",@"ba",@"ABc",@"123"],@[@"a",@"b",@"345",@"ABB"],@[@"a",@"b",@"AB",@"ABB"]];
//    NSArray *mArr = @[@"a",@"b"];
//    NSPredicate*predicate = [NSPredicate predicateWithFormat:@"SELF IN %@",mArr];
//    NSArray *result = [arr filteredArrayUsingPredicate:predicate];
//    NSLog(@"===\n%@",result);
    
    
    NSMutableArray *girls = [NSMutableArray new];
    [girls addObject:[self addModel:@"xiaowei" age:18 height:163 weight:48]];
    [girls addObject:[self addModel:@"xiaofang" age:20 height:169 weight:55]];
    [girls addObject:[self addModel:@"jiumei" age:22 height:155 weight:42]];
    
    NSPredicate*predicate = [NSPredicate predicateWithFormat:@"name = 'xiaofang' || height = 155"];
    NSArray *result = [girls filteredArrayUsingPredicate:predicate];
    for (GirlFriendModel *model in result) {
        NSLog(@"===\nname=%@,age=%ld,height=%.f,weight=%.f",model.name,model.age,model.height,model.weight);
    }
    
}

- (GirlFriendModel *)addModel:(NSString *)name age:(NSInteger)age height:(CGFloat)height weight:(CGFloat)weight {
    GirlFriendModel *model = [[GirlFriendModel alloc]init];
    model.name = name;
    model.age = age;
    model.height = height;
    model.weight = weight;
    return model;
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
