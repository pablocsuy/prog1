(*
	En este código se presenta la implementación del algoritmo de ordenación por selección en sus variantes creciente y decreciente.
*)

program ordenacionSeleccion;

const
	N = 10;

Type
	rango = 2 .. N;
	arreglo = array [1..N] of integer;
var
	i : integer;
	a : arreglo;


Function maximo(ultimo: rango; A: arreglo): rango;
var
	j, max : 1..n;
begin
	max := 1;
	for j := 2 to ultimo do
	if A[j] > A[max] then
		max := j;
	maximo := max
end;


Function minimo(ultimo: rango; A: arreglo): rango;
var
	j, min : 1..n;
begin
	min := 1;
	for j := 2 to ultimo do
	if A[j] < A[min] then
		min := j;
	minimo := min
end;


Procedure OrdSelCrec(var A: arreglo);
var
	i, mayor: 1..n;
	temp : integer;
begin
	for i := n downto 2 do begin
		mayor := maximo(i,A);
		temp := A[mayor];
		A[mayor] := A[i];
		A[i] := temp
	end;
end;


Procedure OrdSelDecre(var A: arreglo);
var
	i, menor: 1..n;
	temp : integer;
begin
	for i := n downto 2 do begin
		menor := minimo(i,A);
		temp := A[menor];
		A[menor] := A[i];
		A[i] := temp
	end;
end;



begin { programa principal }
	randomize;

	{ creo un arreglo aleatorio }
	for i := 1 to N do
		a[i] := random(100);

	writeln('Arreglo sin ordenar:');
	write('[');
	for i := 1 to (N-1) do
		write(a[i], ', ');
	write(a[N]);
	writeln(']');
	writeln;
	
	{ lo ordeno crecientemente }
	OrdSelCrec(a);
	writeln('Arreglo ordenado crecientemente:');
	write('[');
	for i := 1 to (N-1) do
		write(a[i], ', ');
	write(a[N]);
	writeln(']');
	writeln;

	{ lo ordeno decrecientemente }
	OrdSelDecre(a);
	writeln('Arreglo ordenado decrecientemente:');
	write('[');
	for i := 1 to (N-1) do
		write(a[i], ', ');
	write(a[N]);
	writeln(']');
	
end.