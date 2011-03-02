-----------------------------------------------

nel (D version)

by Andrew Crowell / Overkill

-----------------------------------------------

A low-level language for making NES games.  

-----------------------------------------------


Table of Contents
-----------------
    * Introduction
    * Compiling the Compiler
    * The Language
    * The License
    * Acknowledgements


Introduction
------------

nel is a project I started to make development for the NES "easier", by diverting my time from making a game to working on a compiler for the 6502. It aims to remove a lot of unnecessary formatting requirements on your source code, and to unify certain mnemonics in the "official" 6502 assembly, with a simplified syntax. It is a 3-pass compiler that generates machine code in .nes/iNES format at the end.

The language is not meant to provide many truly high-level concepts. It aims to only to aid in the development of low-level coding, and to that effect, has no standard library, only built-in commands and language constructs that map closely (often exactly) to single machine code instructions (with the exception of add/sub/neg/not commands, which become multiple instructions).


Compiling the Compiler
----------------------

To compile nel, you need to have Digital Mars D2 (dmd version 2) installed. D1 will not work, and likely gdc won't either. Then just run the following command:

    dmd src/nel/*.d src/nel/ast/*.d src/nel/parse/*.d -Isrc -ofnel

To clean up binaries before compiling if you really need to, you can go:

    rm -f nel nel.obj nel.exe nel.map


The Language
------------

The language description can be read at the wiki where this project is kept on GitHub: https://github.com/Bananattack/nel-d/wiki

The License
-----------

This code is released under an MIT license.

    Copyright (C) 2011 by Andrew G. Crowell

    Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

Acknowledgements
----------------

In no particular order:

    * [6502 Introduction by Andrew Jacobs](http://www.obelisk.demon.co.uk/6502/) for extremely handy instruction charts and breakdown of how the addressing modes and other stuff works.
    * [6502.org](http://www.6502.org/) for various ideas, and some nice articles.
    * [MagicKit](http://www.magicengine.com/mkit/) for NESASM, and eventually inspiration to not use NESASM and make my own language instead.
    * [NESdev](http://nesdev.parodius.com/) for many useful reads, ranging from old documents, to wiki pages, to interesting forum posts. This helped with NES development ideas, with learning the iNES format, and learning various 6502 assembly.
    * [NintendoAge](http://www.nintendoage.com/) for their [excellent tutorials](http://nintendoage.com/faq/NA/nerdy_nights_out.html) on learning to program for the NES.
    * Possibly more.