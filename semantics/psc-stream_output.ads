------------------------------------------------------------------------------
--                              P A R A S A I L                             --
--                                                                          --
--                     Copyright (C) 2012-2019, AdaCore                     --
--                                                                          --
-- This is free software;  you can redistribute it  and/or modify it  under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  This software is distributed in the hope  that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE.                            --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation. See           --
-- documentation/COPYING3 and documentation/GCC_RUNTIME3_1 for details.     --
--                                                                          --
-- In particular,  you can freely  distribute your programs  built with     --
-- the ParaSail, Sparkel, Javallel, or Parython compiler, including any     --
-- required library run-time units written in Ada or in any of the above    --
-- languages, using any licensing terms  of your choosing.                  --
--                                                                          --
-- The ParaSail language and implementation were originally developed by    --
-- S. Tucker Taft.                                                          --
------------------------------------------------------------------------------

with Ada.Streams;
package PSC.Stream_Output is
   --  Character output routines
   procedure Put_Indent
     (S : access Ada.Streams.Root_Stream_Type'Class;
      Indent : Integer);
   procedure Put
     (S : access Ada.Streams.Root_Stream_Type'Class;
      Str : String);
   procedure Put
     (S : access Ada.Streams.Root_Stream_Type'Class;
      C : Character);
   procedure Put
     (S : access Ada.Streams.Root_Stream_Type'Class;
      I : Integer);
   procedure Put_Line
     (S : access Ada.Streams.Root_Stream_Type'Class;
      Str : String;
      Indent : Integer := 0);
   procedure New_Line
     (S : access Ada.Streams.Root_Stream_Type'Class;
      Indent : Integer := 0);
end PSC.Stream_Output;
