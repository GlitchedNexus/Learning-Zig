# Announcements / Notes
This file has content directly taken from the [documentation](https://ziglang.org/documentation/0.13.0/#Style-Guide).


# Style Guide 

These coding conventions are described by the Zig documentation.

1. Avoid Redundancy in Names 
    - Avoid these words in type names:

        - Value
        - Data
        - Context
        - Manager
        - utils, misc, or somebody's initials
    - Everything is a value, all types are data, everything is context,
     all logic manages state. Nothing is communicated by using a word
      that applies to all types.
    - Temptation to use "utilities", "miscellaneous", or somebody's
     initials is a failure to categorize, or more commonly, overcategorization.
      Such declarations can live at the root of a module that needs them with
       no namespace needed.

2. Avoid Redundant Names in Fully-Qualified Namespaces 

    - Every declaration is assigned a fully qualified namespace by the
     compiler, creating a tree structure. Choose names based on the fully-qualified 
     namespace, and avoid redundant name segments.

3. Whitespace 

- Indents must be 4 spaces.
- Open braces on same line, unless you need to wrap.
- If a list of things is longer than 2, put each item on its own
 line and exercise the ability to put an extra comma at the end.
- Line length: aim for 100; **use common sense**.

4. Names 

- Roughly speaking: camelCaseFunctionName, TitleCaseTypeName, 
snake_case_variable_name. More precisely:
    - If x is a type then x should be TitleCase, unless it is a struct with 0 fields
     and is never meant to be instantiated, in which case it is considered to
      be a "namespace" and uses snake_case.
    - If x is callable, and x's return type is type, then x should be TitleCase.
    - If x is otherwise callable, then x should be camelCase.
    - Otherwise, x should be snake_case.
    - Acronyms, initialisms, proper nouns, or any other word that has capitalization
     rules in written English are subject to naming conventions just like any other
      word. Even acronyms that are only 2 letters long are subject to these conventions.

- File names fall into two categories: types and namespaces. If the file
 (implicitly a struct) has top level fields, it should be named like any other
  struct with fields using TitleCase. Otherwise, it should use snake_case. 
  Directory names should be snake_case.

- These are general rules of thumb; if it makes sense to do something different,
 do what makes sense. For example, if there is an established convention
  such as ENOENT, follow the established convention.