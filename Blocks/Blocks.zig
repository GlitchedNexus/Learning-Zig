//! This file will introduce you to Blocks, their uses
//! and their types.
//!
//! Blocks are used to limit the scope of
//! variable declarations.
//!
//! Internally, blocks are considered to be
//! expressions and we can use the `break` keyword
//! to return values from inside a block
//! (example shown later).
//!
//! This file purposefully contains errors for explainations.

const std = @import("std");
const expect = std.testing.expect;

// A variable defined inside a block cannot be
// accessed outside the scope of the block itself
// as shown in the example below.
//
// This test will result in an error because the
// block, the scope which the varaible `x` existed
// has been evaluated and no loger persists, hence
// we will get an error when trying to access it.
test "access variable after block scope" {
    // We define a block using curcly braces and writing
    // the desired code within it.
    {
        var x: i32 = 1;
        _ = &x;
    }
    x += 1;
}

// Here we explore the concept of obtaining values
// from within a block.
//
// NOTE: blockName can be whatever you like.
test "labeled break from labeled block expression" {
    var y: i32 = 123;

    const x = blockName: {
        y += 1;
        break :blockName y;
    };
    try expect(x == 124);
    try expect(y == 124);
}

// NOTE: Identifiers are never allowed to "hide" other
//       identifiers by using the same name and because
//       of this, when you read Zig code you can always
//       rely on an identifier to consistently mean the
//       same thing within the scope it is defined.
//       You can, however, use the same name if the scopes
//       are separate.

// Test to show you can't hide identifiers by using
// their names.
const pi = 3.14;

test "inside test block" {
    // Let's even go inside another block
    {
        var pi: i32 = 1234;
    }
}

// Test to show you can have identifiers with the same name
// in different scopes.
test "separate scopes" {
    {
        const b = 3.14;
        _ = b;
    }
    {
        var b: bool = true;
        _ = &b;
    }
}

// Empty Blocks: An empty block is equivalent to `void{}`
// Test giving an example of an empty block.
test {
    const a = {};
    const b = void{};
    try expect(@TypeOf(a) == void);
    try expect(@TypeOf(b) == void);
    try expect(a == b);
}
