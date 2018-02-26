## Pull Requests

All changes, no matter how trivial, must be done via pull request. Commits
should never be made directly on the `develop` branch. Prefer rebasing over
merging `develop` into your PR branch to update it and resolve conflicts.
`master` branches are for releases only.

In addition, you must follow these rules

1. Create an issue before creating a PR where you describe the problem. Your issue should
be limited to only one problem.

2. All PR commits must reference an issue and provide a brief commit message about the commit.
Here is an example
```
#123456 - Fixed an issue with unhanded client errors.

```

## Tests

When writing a unit test, please be sure to follow these rules.

1. You test has this structure

    ```
    expect{
          ClassYouAreTesting().value()
    }.To(
          expectedValue,
         "Description of the test failure."
      )
    ```
    
    However, test failure description is not necessary,
    if the class you are testing implements the `Error` protocol.

2. If you are creating fake classes/decorators for a test, make sure
    that these classes are named as `FakeXXXX`.
    
3. Constant values that are used in the test follow this structure
    ```
    private let filePath: SomeType = "Some test value for test purposes."
    ```
    In other words, do not hardcode the constants in the test methods or constructors.
    
4. The usage of the setUp() and tearDown() methods is prohibited.

5. The tests must not share any test values, such as sample input values.
   The only exception is the test resources, like directory path or test API URL.
   (These must be structured according to test rule #3)
   
   See [this](http://www.yegor256.com/2016/05/03/test-methods-must-share-nothing.html) for more information.
    
5.  Your test has proper documentation, which explains what class it is testing
    in the format specified below
   
    ```
    //
    // This source file is part of the Web3Swift.io open source project
    // Copyright 2018 The Web3Swift Authors
    // Licensed under Apache License v2.0
    //
    // ClassNameTest.swift
    //
    // Created by FirstName LastName on DD/MM/YYY
    //
    ```

6.  The name of the unit test source file has to follow this structure

    ```
    ClassNameTest.swift
    ```
    
7.  The name of the integration test source file has to follow this structure

    ```
    ClassNameIT.swift
    ```


