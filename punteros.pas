program Punteros;
type
	lista = ^celda;
	
	celda = record
		elem : integer;
		sig  : lista
	end;

var l : lista;

{ subprogramas }
function listaVacia() : lista;
begin
	listaVacia := NIL
end;

procedure agregarAlPrincipio(dato : integer; var l : lista);
var p : lista;
begin
	new(p);
	
	p^.elem := dato;
	
	if (l = NIL) then
	begin
		l := p;
		l^.sig := NIL
	end
	else
	begin
		p^.sig := l;
		l := p
	end
end;

procedure agregarAlFinal(dato : integer; var l : lista);
var aux, p : lista;
begin
	new(p);
	p^.elem := dato;
	p^.sig := NIL;
	
	if (l = NIL) then
		l := p
	else
	begin
		aux := l;
		while (aux^.sig <> NIL) do
			aux := aux^.sig;
			
		aux^.sig := p
	end
end;

procedure imprimir(l : lista);
begin
	if (l = NIL) then
		write('La lista es vacia.')
	else
	begin
		while (l <> NIL) do
		begin
			write(l^.elem, ' ');
			l := l^.sig
		end
	end;
	writeln
end;

procedure liberar(var l : lista);
var aux : lista;
begin
	while( l <> NIL ) do
	begin
		aux := l;
		l := l^.sig;
		dispose(aux)
	end
end;

{ programa principal }
begin
	l := listaVacia();
	
	agregarAlPrincipio(3,l);
	agregarAlPrincipio(5,l);
	agregarAlFinal(-2,l);
	agregarAlFinal(-8,l);
	
	imprimir(l);
	
	liberar(l);
	imprimir(l)
end.