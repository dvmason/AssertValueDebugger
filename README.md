# AssertValueDebugger
Pharo Debugger extension to automatically generate tests.

When you are writing unit tests you write something like:
```smalltalk
test1
    self assert: some complex expression equals: some other expression
```
But you often don't need to write the exact details of the expected result because it would be immediately obviously correct or wrong - in fact, even if the expected result is complicated, you'd probably prefer to verify the result than make it up. So instead, with this package, you would write:
```smalltalk
test1
    self try: some complex expression
```

When you run the test, an exception will be raised, a debugger window will be raised with the first example - where the `some other expression` is the result of the first expression, and the `some other expression` will be highlighted. If you are happy with that, click on the `Save & Go` button and it will be compiled and it will proceed with the test(s). If you're not happy, you can edit or abandon as you usually would in the debugger.

The result value isn't always a legitimate expression that creates the value, but it tries, using an Extension to Object called `valuePrintOn:`, so if it doesn't create a proper value for your class, you can simply implement that.

This is only a small idea, but it reduces the friction of writing tests, and every little bit of friction saved increases the likelyhood of you writing tests. If you write 5 more tests a day, that will make your life better!

To install the code into a Pharo 12 image:
```smalltalk
EpMonitor disableDuring: [ 
    Metacello new
      baseline: 'AssertValueDebugger';
      repository: 'github://dvmason/AssertValueDebugger:main/src';
      load ].
```

The idea came from [My Kind of REPL](https://ianthehenry.com/posts/my-kind-of-repl/) and I got tons of help from Steven Costiou and Valentin Bourcier. Thanks!
