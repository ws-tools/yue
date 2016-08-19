// Copyright 2016 Cheng Zhao. All rights reserved.
// Use of this source code is governed by the license that can be found in the
// LICENSE file.

#include "nativeui/label.h"

#import <Cocoa/Cocoa.h>

#include "base/strings/sys_string_conversions.h"

namespace nu {

Label::Label(const std::string& text) {
  NSTextField* label = [[NSTextField alloc] initWithFrame:NSZeroRect];
  label.drawsBackground = NO;
  label.bordered = NO;
  label.editable = NO;
  label.selectable = NO;
  label.stringValue = base::SysUTF8ToNSString(text);
  set_view(label);
}

Label::~Label() {
}

void Label::SetText(const std::string& text) {
  static_cast<NSTextField*>(view()).stringValue = base::SysUTF8ToNSString(text);
}

std::string Label::GetText() {
  return base::SysNSStringToUTF8(static_cast<NSTextField*>(view()).stringValue);
}

}  // namespace nu
