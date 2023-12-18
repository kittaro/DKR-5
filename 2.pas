type
  comparator = function(a, b: integer): boolean;

procedure tr(var rawr: array of integer; sz, i: integer; comprawr: comparator);
var
  big, l, r, temp: integer;
begin
  big := i;
  l := 2 * i + 1;
  r := 2 * i + 2;

  if (l < sz) and comprawr(rawr[l], rawr[big]) then
    big := l;

  if (r < sz) and comprawr(rawr[r], rawr[big]) then
    big := r;

  if big <> i then
  begin
    temp := rawr[i];
    rawr[i] := rawr[big];
    rawr[big] := temp;

    tr(rawr, sz, big, comprawr);
  end;
end;

procedure trsrt(var rawr: array of integer; sz: integer; comprawr: comparator);
var
  i, temp: integer;
begin
  for i := sz div 2 - 1 downto 0 do
    tr(rawr, sz, i, comprawr);

  for i := sz - 1 downto 0 do
  begin
    temp := rawr[0];
    rawr[0] := rawr[i];
    rawr[i] := temp;

    tr(rawr, i, 0, comprawr);
  end;
end;

function comrawrar(a, b: integer): boolean;
begin
  //Result := a < b; //для сортировки по убыванию
  Result := a > b; // для сортировки по возрастанию
end;

var
  inputFile, outputFile: text;
  data: array of integer;
  num, i: integer;

begin
  Assign(inputFile, 'input1.txt');
  Reset(inputFile);
  Assign(outputFile, 'output1.txt');
  Rewrite(outputFile);

  i := 0;
  while not Eof(inputFile) do
  begin
    read(inputFile, num);
    SetLength(data, i + 1);
    data[i] := num;
    i := i + 1;
  end;

  trsrt(data, Length(data), comrawrar);

  for i := 0 to Length(data) - 1 do
    Write(outputFile, data[i], ' ');

  Close(inputFile);
  Close(outputFile);

  writeln('Сортировка завершена. Результат записан в файл output1.txt');
end.
