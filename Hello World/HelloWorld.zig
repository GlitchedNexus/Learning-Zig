//! Welcome to a simple guide to Zig!
//!
//! Just like an introduction to any programming language
//! we will begin by building a simple Hello World program.
//!
//! All content here refers to the official zig documentation
//! you can find at:
//! https://ziglang.org/documentation/0.13.0/
//!
//! I hope you enjoy :D

// This line  here gives us access to the standard namespace.
// If you are familiar with C or related languages you will
// be familiar with this namespace.
//
// If you want to learn more about namespaces go to:
// https://en.wikipedia.org/wiki/Namespace
//
// But in this case, we are importing the standard
// library in zig "abstract container or environment" which
// gives us modules that are groupings of useful functions.
const std = @import("std");

pub fn main() !void {
    // Here the `stdout` is the writer object from the
    // I/O module (represented here with 'io') in the
    // standard library that will let us write output
    // to the terminal.
    const stdout = std.io.getStdOut().writer();

    // To give you a glimpse of what is to come this code snippet
    // includes a more roundabout way of printing hello world.

    // try : a special keyword that helps evaluate error union expressions.
    //       Simply put, it lets you return an error if you got one,
    //       otherwise continue with the function logic.

    // format : Simply a keyword that lets us define a formatted string.
    //          Here `{s}` is the placeholder that will replaced with
    //          the corresponding argument.

    // args :  Holds the values to the passed to the different values
    //         that need to be filled in the formatted string.
    //         The dot (.) syntax creates an anonymous struct
    //         containing the argument.
    //
    //         In case you were wondering, an anonymous struct is
    //         a structure without an explicitly defined named type.
    try stdout.print("Hello, {s}!\n", .{"world"});

    // Compile your code with
    // `zig build-exe HelloWorld.zig`
    // and run it with
    // ./HelloWorld

    // Have Fun :D
}
