program matrices;
const orden = 5;

type matriz = array [1..orden, 1..orden] of integer;

var a, b : matriz;

{ devuelve la matriz nula }
function matrizNula() : matriz;
var i,j : integer;
	m : matriz;
begin
	for i:=1 to orden do
	begin
		for j:=1 to orden do
			m[i,j] := 0;
	end;
	
	matrizNula := m;
end;

{ devuelve la matriz identidad }
function matrizIdentidad() : matriz;
var i,j : integer;
	m : matriz;
begin
	for i:=1 to orden do
	begin
		for j:=1 to orden do
			if (i = j) then
				m[i,j] := 1
			else
				m[i,j] := 0;
	end;
	
	matrizIdentidad := m;
end;

{ devuelve una matriz cuyas entradas son aleatorias }
function matrizAleatoria() : matriz;
var i,j : integer;
	m : matriz;
begin
	Randomize; { habilito aleatoriedad }
	for i:=1 to orden do
	begin
		for j:=1 to orden do
			m[i,j] := Random(100);
	end;
	
	matrizAleatoria := m;
end;

{ imprime la matriz en pantalla }
procedure imprimirMatriz(a : matriz);
var i,j : integer;
begin
	for i:=1 to orden do
	begin
		for j:=1 to orden do
			write(a[i,j]:4);
		writeln;
	end;
end;

{ suma de matrices }
function sumarMatrices(m1, m2 : matriz) : matriz;
var i,j : integer;
	m : matriz;
begin
	for i:=1 to orden do
	begin
		for j:=1 to orden do
			m[i,j] := m1[i,j] + m2[i,j];
	end;
	
	sumarMatrices := m;
end;

{ dada una matriz, devuelve su transpuesta }
{ implementacion ineficiente }
function transponer(m : matriz) : matriz;
var i,j : integer;
	aux : matriz;
begin
	for i:=1 to orden do
	begin
		for j:=1 to orden do
			aux[i,j] := m[j,i];
	end;

	transponer := aux;
end;

procedure transponerEficiente(var m : matriz);
var i,j : integer;
	aux : integer;
begin
	for i:=1 to orden do
	begin
		for j:=1 to i do
		begin
			aux := m[i,j];
			m[i,j] := m[j,i];
			m[j,i] := aux;
		end;
	end;
end;


function matricesIguales(a, b : matriz) : boolean;
var i,j : integer;
	iguales : boolean;
begin
	iguales := true;
	
	i := 1;
	while (i <= orden) and (iguales) do
	begin
		j := 1;
		while (j <= orden) and (iguales) do
		begin
			iguales := (a[i,j] = b[i,j]);
			j := j+1;
		end;
		i := i+1;
	end;
	
	matricesIguales := iguales;
end;


{ programa principal }
begin	
	(*
	imprimirMatriz(matrizNula());
	writeln;
	imprimirMatriz(matrizIdentidad());
	writeln;
	imprimirMatriz(matrizAleatoria());
	*)
	
	(*
	a := matrizAleatoria();
	imprimirMatriz(a);
	writeln;
	
	b := matrizAleatoria();
	imprimirMatriz(b);
	writeln;
	
	imprimirMatriz(sumarMatrices(a,b));
	*)
	
	writeln('mi matriz aleatoria');
	a := matrizAleatoria();
	b := a;
	imprimirMatriz(a);
	writeln;
	
	writeln('transpuesta ineficiente');
	imprimirMatriz(transponer(a));
	writeln;

	writeln('transpuesta eficiente');
	transponerEficiente(a);
	imprimirMatriz(a);
	writeln;
	
	writeln('ambas transpuestas dan lo mismo?');
	writeln(matricesIguales(a,transponer(b)));
end.