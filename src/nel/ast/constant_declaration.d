module nel.ast.constant_declaration;

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

import nel.report;
import nel.ast.statement;
import nel.ast.definition;
import nel.ast.expression;
import nel.ast.storage_type;
import nel.ast.symbol_table;

class ConstantDeclaration : Statement
{
    private:
        string name;
        Expression expression;
        StorageType size;
        uint expressionOffset;
        
    public:
        this(string name, Expression expression, StorageType size, SourcePosition position)
        {
            super(StatementType.CONSTANT, position);
            this.name = name;
            this.size = size;
            this.expression = expression;
            this.expressionOffset = 0;
        }
        
        this(string name, Expression expression, uint expressionOffset, StorageType size, SourcePosition position)
        {
            super(StatementType.CONSTANT, position);
            this.name = name;
            this.size = size;
            this.expression = expression;
            this.expressionOffset = expressionOffset;
        }
        
        StorageType getSize()
        {
            return size;
        }
        
        Expression getExpression()
        {
            return expression;
        }
        
        uint getExpressionOffset()
        {
            return expressionOffset;
        }
        
        void aggregate()
        {
            getActiveTable().put(new ConstantDefinition(name, this, getPosition()));
        }
        
        void validate()
        {
        }
        
        void generate()
        {
        }
}