type
  comparator = function(a, b: integer): boolean;

procedure cntsrt(var rawr: array of integer; sz: integer; comparer: comparator);
var
  minv, maxv, i, j, ii, temp: integer;
  cnt: array of integer;
begin
  minv := rawr[0];
  maxv := rawr[0];

  //минимальное и максимальное значения в массиве
  for i := 1 to sz - 1 do
  begin
    if rawr[i] < minv then
      minv := rawr[i];
    if rawr[i] > maxv then
      maxv := rawr[i];
  end;

  SetLength(cnt, maxv - minv + 1);
  for i := 0 to maxv - minv do
    cnt[i] := 0;



  ii := 0;
  for i := 0 to maxv - minv do  //отсортированный массив
    for j := 1 to cnt[i] do
    begin
      rawr[ii] := i + minv;
      Inc(ii);
    end;


  if not comparer(1, 2) then //по убыванию при выборе
  begin
    for i := 0 to sz div 2 - 1 do
    begin
      j := sz - 1 - i;
      temp := rawr[i];
      rawr[i] := rawr[j];
      rawr[j] := temp;
    end;
  end;
end;

function comrawrar(a, b: integer): boolean;
begin
  //Result := a > b; //для сортировки по убыванию
  Result := a < b; //для сортировки по возрастанию
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

  cntsrt(data, Length(data), comrawrar);

  for i := 0 to Length(data) - 1 do
    Write(outputFile, data[i], ' ');

  Close(inputFile);
  Close(outputFile);

  writeln('Сортировка завершена. Результат записан в файл output1.txt');
end.
