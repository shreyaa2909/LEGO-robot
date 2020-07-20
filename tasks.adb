with NXT.AVR;		      use NXT.AVR;
package body Tasks is
	
---Pressed (Bumper)
   ----------------------------
   --  Background procedure  --
   ----------------------------
   procedure Background is

   begin
      loop
         null;
      end loop;
   end Background;
	    

	task Motorcontrol is
	pragma   Storage_Size(2000);
	end Motorcontrol;

	task body motorcontrol is
	v : integer := 0;
	error : integer := 0;	
	l_speed : integer := 0;
	r_speed : integer := 0;	
	extra:integer:=0;
	dist : natural := 0;
	next_time : time := clock;
	mul_speed : integer := 0;	
	error_dist : integer := 0;	
	begin
	Sonar.Reset;
	loop
		next_time := next_time + milliseconds(100);
		Sonar.Ping;
		Sonar.Get_Distance(dist);
		error_dist := 22 - dist;
		if error_dist <= 0 then
			mul_speed := 1;
		else 
			mul_speed := (5 - error_dist) / 20;
				
		end if;
		v := light_value(light_sensor_1); 
		error := 44  - v;
		if error < 0 then
			r_speed := (-3)*error;
			l_speed := 0;
		elsif error > 0 then 
			l_speed := 2*error;
			r_speed := 0;		
		end if;
		put("Distance: ");
		put_noupdate(dist);
		put("mul speed: ");
		put_noupdate(mul_speed);
		put_line(";");
		Engine0.Set_Power (PWM_Value(mul_speed * (20 + l_speed)));  -- left wheel
		Engine1.Set_Power (PWM_Value(mul_speed * (20 + r_speed))); -- right wheel
		Engine0.Forward;			
		Engine1.Forward;
		delay until(next_time);		
		
	end loop;
	end motorcontrol;
	
    
end Tasks;

 --- 	white:  > 56
--- 	grey :  > 50
---     black:  = 28 
		--Sonar.Reset; 
         	--Sonar.Ping;
         	--Sonar.Get_Distance(dist);
