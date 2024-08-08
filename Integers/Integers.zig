//! Integers are numerical values that do not
//! have a decimal point. They can be either
//! signed (have + or - sign) or unsigned (have
//! only a + sign).
//!
//! Like most languages you can express integers in
//! different notations, some of which we will cover
//! below.
//!
//! For signed integer types, Zig uses a
//! two's complement representation.
//!

/// Defining integers as decimal values
const decimal_int = 98222;

/// Defining integers as hex values
const hex_int = 0xff;
const another_hex_int = 0xFF;

/// Defining integers as octal values
const octal_int = 0o755;

/// Defining integers as binary values
const binary_int = 0b11110000;

/// The one feature about zig that I love is that we
/// can use underscores between two digits as
/// visual separators.
const one_billion = 1_000_000_000;
const binary_mask = 0b1_1111_1111;
const permissions = 0o7_5_5;
const big_address = 0xFF80_0000_0000_0000;

// NOTE: We must note that Integer literals have no
//       size limitation, and if any undefined behavior occurs,
//       the compiler catches it. However, once an integer
//       value is no longer known at compile-time, it must have
//       a known size, and is vulnerable to undefined behavior.
//
// Implications of this mean that the division operation is
// vulnerable to both Integer Overflow and Division by Zero.
// Furthermore, operators such as + and - cause undefined
// behavior on integer overflow. Alternative operators are
// provided for wrapping and saturating arithmetic on all
// targets. `+%` and `-%` perform wrapping arithmetic while
// `+|` and `-|` perform saturating arithmetic.
