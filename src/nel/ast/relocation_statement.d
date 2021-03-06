module nel.ast.relocation_statement;

// Copyright (C) 2011 by Andrew G. Crowell
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//  
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

static import std.stdio;
static import std.string;

import nel.report;
import nel.ast.bank;
import nel.ast.node;
import nel.ast.program;
import nel.ast.statement;
import nel.ast.expression;

class RelocationStatement : Statement
{
    private:
        string bank;
        Expression location;
        
    public:
        this(string bank, Expression location, SourcePosition position)
        {
            super(StatementType.RELOCATION, position);
            this.bank = bank;
            this.location = location;
        }
        
        void aggregate()
        {
            program.switchBank(bank, getPosition());
            if(location !is null)
            {
                Bank bank = program.getActiveBank();

                if(location.fold(true, false))
                {
                    bank.setAbsolutePosition(location.getFoldedValue(), getPosition());
                }
                else
                {
                    error("could not resolve the destination address provided to 'in' statement.", getPosition(), true);
                }
            }
        }
        
        void validate()
        {
            program.switchBank(bank, getPosition());
            if(location !is null)
            {
                program.getActiveBank().setAbsolutePosition(location.getFoldedValue(), getPosition());
            }
        }
        
        void generate()
        {
            program.switchBank(bank, getPosition());
            if(location !is null)
            {
                program.getActiveBank().setAbsolutePosition(location.getFoldedValue(), getPosition());
            }
        }
}