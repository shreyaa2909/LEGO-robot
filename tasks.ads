with Ada.Real_Time;       use Ada.Real_Time;
with NXT;                 use NXT;
with System;
with NXT.Motors.Simple.Ctors;
use NXT.Motors.Simple;
use NXT.Motors.Simple.Ctors;
with NXT.Light_Sensors;		use NXT.Light_Sensors;
with NXT.Light_Sensors.Ctors; 	use NXT.Light_Sensors.Ctors;
with NXT.Ultrasonic_Sensors;        use NXT.Ultrasonic_Sensors;
with NXT.Ultrasonic_Sensors.Ctors;  use NXT.Ultrasonic_Sensors.Ctors;
with Nxt.Display;             use Nxt.Display;
use NXT;

package Tasks is
   
   procedure Background;
	
   private

   --  Define periods and times  --
	light_sensor_1:   Light_Sensor :=  make(Sensor_1 ,True); 
   	--  Define used sensor ports  --
	Sonar : Ultrasonic_Sensor := Make(Sensor_2);
	Engine1 : Simple_Motor := Make(Motor_B);
	Engine0 : Simple_Motor := Make(Motor_C);
   --  Init sensors --

end Tasks;
