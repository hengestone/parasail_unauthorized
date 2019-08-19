pragma Style_Checks (Off);
-- A lexical scanner generated by aflex
with text_io; use text_io;
with parython_lex_dfa; use parython_lex_dfa; 
with parython_lex_io; use parython_lex_io; 
--# line 1 "parython_lex.l"
------------------------------------------------------------------------------
--                              P A R Y T H O N                             --
--                                                                          --
--                     Copyright (C) 2012-2014, AdaCore                     --
--                                                                          --
-- This is free software;  you can redistribute it  and/or modify it  under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  This software is distributed in the hope  that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License for  more details.  You should have  received  a copy of the GNU --
-- General  Public  License  distributed  with  this  software;   see  file --
-- COPYING3.  If not, go to http://www.gnu.org/licenses for a complete copy --
-- of the license.                                                          --
------------------------------------------------------------------------------
--  These start states determine whether an apostrophe is interpreted
--  as a "tick" (aka "prime") or as a character literal.
  -- The following are used to match all numeric literals.
  -- Note that double underscores are rejected.
--# line 39 "parython_lex.l"

pragma Style_Checks (Off);
with Parython_Tokens; 
use  Parython_Tokens;
with Parython_Parser;
use Parython_Parser;
with PSC.Source_Positions;
use  PSC.Source_Positions;
with PSC.Strings;
use  PSC.Strings;
with PSC.Syntax;
use  PSC.Syntax;
use text_io;

package Parython_Lex is
  
  Debug_Indent   : Boolean := False;
  Bracketing_Token : Token := Error;

  Expecting_Indent : Boolean := False;  
  --  Whether expecting indent on next line

  Expecting_Indent_At_Label   : Boolean := False;  
  --  Whether expecting indent when encountering a label

  Top : Natural := 0;
  --  Top of indent stack

  procedure ECHO_L(YYT : String := yytext);  --  Instead of "ECHO" builtin

  function yylex return token;

  function Create_Token(Text : String := yytext) return YYSType;

end Parython_Lex;
