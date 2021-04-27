---
layout: post
title:  "LL(1)"
date: 2021-04-21 19:10:10 +0800
categories: [LL(1) Parser]
tags: [LLVM compiler]
---
# Introduction.
This project is to build a recursive descent(LL(1)) compiler with `c++` language.  
`scanner` -> `parser` -> `type checking` -> `code generation` -> `runtime system`.

# Scanner. 
structure:  
```
struct token_t {
 int type; // one of the token codes from above
 std::string StringValue;
 int tm;
 int intValue; // holds lexeme value if integer
 float doubleValue; // holds lexeme value if double
 int numCount;
 bool isGlobal; // initialized to false;
 token_t(){
     this->numCount = 0;
     this->isGlobal = false;
 }
}; 
```
A files contains tons of characters. What Scanner does is to break input stream into characters and group characters into words, like in c++ file. `int main()`. In this start-up function, What Scanner does is to generate 4 tokens: `int`, `main`, `(` and `)`.  

public API open to parser: `token scanner->getToken()`. You can get the word token by token.  


# Parser.
In class `Parser`. one private member is `scanner`, since we should get tokens from scanner for the preparation of parsing. A parsing process is, take `int main()` as example again. we know that this `main` function has a `int` type and program expects a variable with same `int` type to be returned. I think parser does link tokens into different blocks. Here is some examples: 

```
<S> -> program <vars> <block>
<block> -> start <vars> <stats> end
<ifstat> -> if ( <expr> <O> <expr> ) <stat>
```

For example: `if` statement should contain `<expr>` statement block.  

# type checking.
I combine `type checking` into parser because I don't want the some errors happen in `code generation` part. Besides, although LLVM has a strong debugging tool, it is really complicated and my time is really limited. I choose to do `type checking` in `parser` part.  

type checking, as the word said, it is to check types. For example, `a = 1`. This assign statement shoud guarantee variable `a` is a integer.  `int main()` should has an integer variable returned.  

# code generation.
After Parser and type checking, we can see a parser tree, it contains many blocks and many variables. What I did is to generate the code block by block with `LLVM` tool. After this process, a `.ll` file is generated and we can use `clang` tool to generate executable file.  

# runtime system.
Although it successfully is executed on my computer, it cannot be used in other computer. `Makefile` is brought up to solve this problem. Make a `Makefile` and make it simpler to scale to other computer.

`./main <file>` can generate a assembly file with suffix `.s`. `clang output.s runtime.o` could generate executable file.  
Or `./sbc.sh <file>` generates an executable file directly.



