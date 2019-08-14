{
En los datos de entrada se proporcionan dos tiempos como enteros de la forma hhmm donde hh representa las horas (menos de 24) y mm los minutos (menos de 60).
Determine la suma de estos dos tiempos, y exhiba el resultado en la forma d hhmm, donde d es dias, ya sea cero o uno.

Ejemplo de entrada : 1345 2153. 
Ejemplo de salida : 1 1138.
}

program pr2ej17;
var
	num1, num2, hh1, hh2, mm1, mm2, suma, res : integer;
begin
	readln(num1, num2);
	
	(* hallo las horas y minutos asociadas a num1 *)
	hh1 := num1 div 100;
	mm1 := num1 mod 100;

	(* hallo las horas y minutos asociadas a num2 *)
	hh2 := num2 div 100;
	mm2 := num2 mod 100;
	
	(* llevo num1 de base 60 a base 10 *)
	num1 := 60*hh1 + mm1;

	(* llevo num2 de base 60 a base 10 *)
	num2 := 60*hh2 + mm2;
	
	(* los sumo en base 10 *)
	suma := num1 + num2;
	
	(* expreso la suma en base 24 (días) / 60 (minutos) *)
	res := suma mod 60; {pongo los dos ultimos digitos}
	res := ((suma div 60) mod 24)*100 + res; {pongo las horas del dia}
	
	write(((suma div 60) div 24), ' ', res);
end.