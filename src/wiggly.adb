-----------------------------------------------------------------
--                                                             --
-- WIGGLY                                                      --
--                                                             --
-- COPYRIGHT (C) 2017  JOHN LEIMON                             --
--                                                             --
-- PERMISSION TO USE, COPY, MODIFY, AND/OR DISTRIBUTE          --
-- THIS SOFTWARE FOR ANY PURPOSE WITH OR WITHOUT FEE           --
-- IS HEREBY GRANTED, PROVIDED THAT THE ABOVE COPYRIGHT        --
-- NOTICE AND THIS PERMISSION NOTICE APPEAR IN ALL COPIES.     --
--                                                             --
-- THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR             --
-- DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE       --
-- INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY         --
-- AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE         --
-- FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL         --
-- DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS       --
-- OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF            --
-- CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING      --
-- OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF      --
-- THIS SOFTWARE.                                              --
--                                                             --
-- MOVE MOUSE CURSOR RANDOMLY ON A WINDOWS PLATFORM.           --
--                                                             --
-----------------------------------------------------------------
WITH ADA.NUMERICS.DISCRETE_RANDOM;
WITH ADA.TEXT_IO;                  USE  ADA.TEXT_IO;
WITH INTERFACES.C;                 USE  INTERFACES.C;

PROCEDURE WIGGLY IS

   PROCEDURE SETCURSORPOS
     (X : INT;
      Y : INT);
   PRAGMA IMPORT (STDCALL, SETCURSORPOS, "SETCURSORPOS");
   
   TYPE SPAN IS RANGE 200 .. 205;
   
   PACKAGE RANDOM IS NEW ADA.NUMERICS.DISCRETE_RANDOM (SPAN);
   
   X    : SPAN;
   Y    : SPAN;
   SEED : RANDOM.GENERATOR;

BEGIN

   RANDOM.RESET (SEED);
   
   LOOP
      X := RANDOM.RANDOM (SEED);
      Y := RANDOM.RANDOM (SEED);
      SETCURSORPOS ( INT (X), INT (Y));
      DELAY 0.1;
   END LOOP;

END WIGGLY;
