// Copyright 2017 Tony Allevato.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Ensure that the imported symbols don't have version number suffixes.
#define U_DISABLE_RENAMING 1

// Only the files defining (non-deprecated) C APIs are included below. C++ APIs
// are excluded, as they would not be imported into Swift.
#import <unicode/icudataver.h>
#import <unicode/icuplug.h>
#import <unicode/parseerr.h>
#import <unicode/platform.h>
#import <unicode/ptypes.h>
#import <unicode/putil.h>
#import <unicode/ubidi.h>
#import <unicode/ubiditransform.h>
#import <unicode/ubrk.h>
#import <unicode/ucasemap.h>
#import <unicode/ucat.h>
#import <unicode/uchar.h>
#import <unicode/uclean.h>
#import <unicode/ucnv.h>
#import <unicode/ucnv_cb.h>
#import <unicode/ucnv_err.h>
#import <unicode/ucnvsel.h>
#import <unicode/uconfig.h>
#import <unicode/ucurr.h>
#import <unicode/udata.h>
#import <unicode/udisplaycontext.h>
#import <unicode/uenum.h>
#import <unicode/uidna.h>
#import <unicode/uiter.h>
#import <unicode/uldnames.h>
#import <unicode/ulistformatter.h>
#import <unicode/uloc.h>
#import <unicode/umachine.h>
#import <unicode/umisc.h>
#import <unicode/unorm.h>
#import <unicode/unorm2.h>
#import <unicode/uregex.h>
#import <unicode/urep.h>
#import <unicode/ures.h>
#import <unicode/uscript.h>
#import <unicode/usearch.h>
#import <unicode/uset.h>
#import <unicode/ushape.h>
#import <unicode/usprep.h>
#import <unicode/ustring.h>
#import <unicode/ustringtrie.h>
#import <unicode/utext.h>
#import <unicode/utf.h>
#import <unicode/utf16.h>
#import <unicode/utf32.h>
#import <unicode/utf8.h>
#import <unicode/utrace.h>
#import <unicode/utypes.h>
#import <unicode/uvernum.h>
#import <unicode/uversion.h>
