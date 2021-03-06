// Copyright (c) 2016-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "FBNCardHeroConfiguration.h"

#import "FBNAssetContentCache.h"
#import "FBNAssetsController.h"
#import "FBNCardViewUtilities.h"

const CGFloat FBNCardHeroHeightUnspecified = CGFLOAT_MAX;

@implementation FBNCardHeroConfiguration

///--------------------------------------
#pragma mark - Init
///--------------------------------------

- (instancetype)initFromDictionary:(NSDictionary<NSString *, id> *)dictionary
                  assetsController:(FBNAssetsController *)assetsController {
    self = [super init];
    if (!self) return self;

    NSNumber *height = dictionary[@"height"] ?: @(FBNCardHeroHeightUnspecified);
    _height = FBNCGFloatFromNumber(height);
    _background = [assetsController assetFromDictionary:dictionary[@"background"]];

    _content = [FBNCardTextContent contentFromDictionary:dictionary[@"content"]];
    _contentVerticalAlignment = FBNCardContentVerticalAlignmentFromString(dictionary[@"contentAlign"]);

    return self;
}

+ (nullable instancetype)configurationFromDictionary:(nullable NSDictionary<NSString *, id> *)dictionary
                                    assetsController:(FBNAssetsController *)assetsController {
    if (!dictionary) {
        return nil;
    }
    return [[self alloc] initFromDictionary:dictionary assetsController:assetsController];
}

@end
