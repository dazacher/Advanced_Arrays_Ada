with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Penalized is
   package TIO renames Ada.Text_IO;
   package IIO renames Ada.Integer_Text_IO;

   type Vulnerability is (Not_Vulnerable, Vulnerable);
   type Insult is (Undoubled, Doubled, Redoubled);
   type Tricks is (First, TwoAndThree, FourPlus);
   type Penalty_Matrix is array (Vulnerability, Insult, Tricks) of Integer;
   Penalty_Points : Penalty_Matrix :=
     (Not_Vulnerable =>
        (Undoubled => (50, 50, 50),
         Doubled   => (100, 200, 300),
         Redoubled => (200, 400, 600)),
      Vulnerable =>
        (Undoubled => (100, 100, 100),
         Doubled   => (200, 300, 300),
         Redoubled => (400, 600, 600)));
   Pad : String (1 .. 8) := "        ";

begin
   for Points of Penalty_Points loop
      IIO.Put (Points);
   end loop;

   for V in Vulnerability loop
      TIO.Put_Line (Vulnerability'Image (V));
      for I in Insult loop
         TIO.Put_Line (" " & Insult'Image (I));
         for T in Tricks loop
            TIO.Put
              (case T is
                 when First       => Pad,
                 when TwoAndThree => Pad (1 .. 2),
                 when FourPlus    => Pad (1 .. 5));
            TIO.Put (Tricks'Image (T));
            IIO.Put (Penalty_Points (V, I, T));
            TIO.New_Line;
         end loop;
         TIO.New_Line;
      end loop;
   end loop;
end Penalized;
