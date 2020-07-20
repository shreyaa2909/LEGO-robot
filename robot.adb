with Tasks;
with System;

procedure robot is
   pragma Priority (System.Priority'First);
begin
  
   Tasks.Background;

end robot;
