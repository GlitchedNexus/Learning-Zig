//! Sometimes we need to defined types with
//! unknown (but non-zero) size and alignment like
//! when we are interacting with C code that
//! does not expose struct details.
//!
//! In such case we can use an `opaque {}` to
//! enforce type safety. Furthermore, these can
//! can contain declarations the same as structs,
//! unions, and enums.
//!

/// Define a const Derp and assign it an opaque object.
const Derp = opaque {};
/// Define a const Wat and assign it an opaque object.
const Wat = opaque {};

/// Extern : This keyword indicates that the function
///          is defined outside of the Zig code.
///
/// *Derp : A single-item pointer to exactly one
///         Derp item.
///
/// fn : Keyword indicating this is a function.
///
/// void : return type specifying these is no value
///        returned on executing the function.
///
/// The function declaration tells Zig about the
/// existence and signature of the function so
/// it can be called from Zig code.
///
extern fn bar(d: *Derp) void;

/// callconv(.C) : This specifies the calling convention
///                for the function and `.C` indicates
///                that the function uses the C calling
///                convention.
///
/// The function declaration tells Zig about the
/// existence and signature of the function so
/// it can be called from Zig code.
///
fn foo(w: *Wat) callconv(.C) void {
    bar(w);
}

// Sample test calling foo which no pointer.
test "call foo" {
    foo(undefined);
}
