//! This file will introduce you to the different types of comments!
//! You already saw all of these in the HelloWorld.zig file though
//! we did not explicitly define them :D
//!
//! Zig supports 3 types of comments. Normal comments are ignored,
//! but doc comments and top-level doc comments are used by the
//! compiler to generate the package documentation.
//!
//! There are no multiline comments in Zig (e.g. like /* */ comments in C).
//! This allows Zig to have the property that each line
//! of code can be tokenized out of context.
//!
//! These are top level doc comments are they document the
//! current module. It is a compile error if a top-level
//! doc comment is not placed at the start of a container,
//! before any expressions.

const std = @import("std");

/// These are doc comments, these are useful for documentation.
/// The doc comment documents whatever immediately follows it.
/// Doc comments are only allowed in certain places; it is a
/// compile error to have a doc comment in an unexpected place,
/// such as in the middle of an expression, or just before a
/// non-doc comment.
pub fn main() void {
    // These are normal comments.
    // You can put these anywhere and they are ignored by the
    // compiler :D
    const stdout = std.io.getStdOut().writer();
    stdout.print("Hello!");
}

// I mixed and matched alot of the comments to show you the different
// types of comments you have access to two but going forward
// I'll be more systematized.
