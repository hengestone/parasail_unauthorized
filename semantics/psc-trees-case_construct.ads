------------------------------------------------------------------------------
--                              P A R A S A I L                             --
--                                                                          --
--                     Copyright (C) 2012-2013, AdaCore                     --
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
--                                                                          --
-- The ParaSail language and implementation were originally developed by    --
-- S. Tucker Taft.                                                          --
------------------------------------------------------------------------------

with PSC.Trees.Lists;
with PSC.Trees.Compound_Stmt;
package PSC.Trees.Case_Construct is
   --  Used both for "case" statements and expressions

   type Tree is new Compound_Stmt.Tree with record
      Case_Selector : Optional_Tree;
      Case_Alt_List : Lists.List;
      Is_Case_Expr : Boolean := False;
   end record;

   function Make
     (Source_Pos : Source_Positions.Source_Position;
      Case_Selector : Optional_Tree;
      Case_Alt_List : Lists.List;
      Is_Case_Expr : Boolean := False;
      End_With_Values : Optional_Tree := Null_Optional_Tree;
      Label : Optional_Tree := Null_Optional_Tree;
      Check_Label : Boolean := True)
      return Optional_Tree;
   --  Build up a Case_Construct

   function Num_Operands (T : Tree) return Natural;
   --  Return number of operands of given Tree

   function Nth_Operand (T : Tree; N : Positive) return Optional_Tree;
   --  Return Nth operand of given Tree

   procedure Set_Nth_Operand
     (T : in out Tree;
      N : Positive;
      New_Operand : Optional_Tree);
   --  Set Nth operand of given Tree

   function Substitute_Operands
     (T : Tree;
      New_Operands : Tree_Array)
      return Optional_Tree;
   --  Create a new tree given new operands and an existing tree.
   --  The default implementation dispatches to Set_Nth_Operand but
   --  it may be overridden for efficiency.
   --  Requires: New_Operands'Length = Num_Operands(T)

   procedure Display_Subtree
     (T : Tree;
      On : access Ada.Streams.Root_Stream_Type'Class;
      Indent : Natural := 0;
      Use_Short_Form : Boolean := False);
   --  Produce a human readable display of a subtree, at the given indent
   --  If Use_Short_Form is True, then elide some of the output for
   --  a module or an operation.

   procedure Visit (T : Tree; Visitor : in out Root_RO_Tree_Visitor'Class);
   --  Call appropriate RO *_Action procedure on Visitor

   procedure Visit
     (T : in out Tree;
      Visitor : in out Root_RW_Tree_Visitor'Class);
   --  Call appropriate RW *_Action procedure on Visitor

   function Find_Source_Pos
     (T : Tree)
      return Source_Positions.Source_Position;
   --  Walk into tree to try to find a meaningful source position

end PSC.Trees.Case_Construct;
