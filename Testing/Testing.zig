//! Testing is parmount for creating reliable software!
//!
//! Here we will look at the inbuilt testing support
//! that Zig offers.
//!
//! NOTE: We can't attach documentation comments to tests!
//! NOTE: We will mainly cover unit testing in this tutorial.
//!
//! Test declarations, like Functions, have
//! a return type and a block of code. The implicit return
//! type of test is the Error Union Type anyerror!void, and
//! it cannot be changed.
//!
//! Tests are omitted from the build unless the zif file
//! is built using the zig test tool.
//!
//! Test declarations are order-independent and can be
//! written before or after the code under test as they
//! are top-level declarations.
//!
//! You can use `@import("builtin").is_test` to detect
//! test builds.

/// Importing the standard library
const std = @import("std");

/// Accessing the `testing` namespace for easier access
/// All useful functions can be found at
/// https://ziglang.org/documentation/master/std/#std.testing
const tester = std.testing;

// Test declarations contain the keyword test, followed
// by an optional name written as a string literal or an
// identifier, followed by a block containing any valid
// Zig code that is allowed in a function.

// Exampe of test defined with a specific name
test "test adding 1 to 0" {
    try tester.expect(addOne(0) == 1);
}

// Exampe of test defined with a specific name
test "test adding 1 to 41" {
    try tester.expect(addOne(41) == 42);
}

// Exampe of test defined with an identifier
//
// NOTE: This is a doctest, and serves as documentation for `addOne`.
//
// Test declarations named using an identifier are doctests.
//
// The identifier must refer to another declaration in scope.
// A doctest, like a doc comment, serves as documentation for
// the associated declaration, and will appear in the generated
// documentation for the declaration.
//
// An effective doctest should be self-contained and focused on the
// declaration being tested, answering questions a new user might
// have about its interface or intended usage, while avoiding unnecessary
// or confusing details. A doctest is not a substitute for a doc comment,
// but rather a supplement and companion providing a testable,
// code-driven example, verified by zig test.
//
test addOne {
    try tester.expect(addOne(0) == 1);
    try tester.expect(addOne(41) == 42);
}

// Test with no name / identifier
// This kind of test cannot be skipped and will always run during test builds.
test {
    tester.expect(true);
}

// A failing test
test "failing test" {
    tester.expect(false);
}

test "skpped test" {
    return error.SkipZigTest;
}

// If you have worked with languages with no garbage collection like C, then
// you are probably familiar with memory leaks and how cumbersome they can
// be to get rid of. But! When code allocates Memory using the Zig Standard
// Library's testing allocator, std.testing.allocator, the default test
// runner will report any leaks that are found from using the testing allocator:

test "detect leak" {
    // allocating a list.
    var list = std.ArrayList(u21).init(std.testing.allocator);
    // missing `defer list.deinit();`
    try list.append('☔');

    try std.testing.expect(list.items.len == 1);
}

fn addOne(num: i32) i32 {
    return num + 1;
}
