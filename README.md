to compile:

```shell
cd src/main/antlr 
antlr4 dokuwikiLexer.g4 dokuwikiParser.g4 ; javac *.java
```
make sure antlr4 is set up.

to run (one possibility uring dev):

```shell
grun dokuwiki document -gui ../../../syntax.dokuwiki 2> errors.txt
```

make sure to download the raw dokuwiki syntax to the project root.
