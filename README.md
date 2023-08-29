# AssertValueDebugger
Pharo Debugger extension to automatically generate tests.

When you are writing unit tests you write something like:
```smalltalk
test1
    self assert: some complex expression equals: 'some complex string'
```
But you often don't need to write the exact details of the expected result because it would be immediately obviously correct or wrong, so instead, with this package you would write:
```smalltalk
test1
    self try: some complex expression
```

When you run the test, an exception will be raised, a debugger window will be raised with the first example, and the `'some complex string'` will be highlighted. If you are happy with that, click on the `Save & Go` button and it will be compiled and it will proceed with the test(s). If you're not happy, you can edit or abandon as you usually would in the debugger.

To install the code into a Pharo 12 image:
```smalltalk
EpMonitor disableDuring: [ 
    Metacello new
      baseline: 'DataFrame';
      repository: 'github://dvmason/AssertValueDebugger/src';
      load ].
```

The idea came from [My Kind of REPL](https://ianthehenry.com/posts/my-kind-of-repl/) and I got tons of help from Steven Costiou and Valentin Bourcier. Thanks!
