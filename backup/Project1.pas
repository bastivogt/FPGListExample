program Project1;
{$modeswitch advancedrecords} {<======= wichtig wegen operator übeladen im record}
uses sysutils, fgl;

type
  TPerson = record
    Firstname: string;
    Name: string;
    Age: Integer;

    class operator = (aLeft, aRight: TPerson): Boolean;
    function ToString(): string;

  end;

  TStrList = specialize TFPGList<string>; // TypeFreePascalGenericList
  TPersonList = specialize TFPGList<TPerson>;


class operator TPerson. = (aLeft, aRight: TPerson): Boolean;
begin
  Result := aLeft.Age < aRight.Age;
end;


function TPerson.ToString(): string;
begin
 Result := Firstname + ' ' + Name + ' (' + IntToStr(Age) + ')';
end;







  procedure WritePerson(VPerson: TPerson);
  begin
    WriteLn(VPerson.Firstname, ' ', VPerson.Name, ' (', VPerson.Age, ')');
  end;

var
  names: TStrList;
  i: Integer;
  item: string;

  person: TPerson;
  people: TPersonList;

begin

  names := TStrList.Create;
  names.Add('Sebastian');
  names.Add('Joel');
  names.Add('Noah');
  names.Add('Ute');
  names.Add('Buddy');

  for i := 0 to names.Count -1  do begin
    WriteLn(names.Items[i]);
  end;

  WriteLn('=======================================');



  for item in names do begin
    WriteLn(item);
  end;

  WriteLn('=======================================');



  people := TPersonList.Create;



  person.Firstname := 'Sebastian';
  person.Name := 'Vogt';
  person.Age := 38;
  people.Add(person);

  person.Firstname := 'Joel';
  person.Name := 'Vogt';
  person.Age := 12;
  people.Add(person);

  person.Firstname := 'Noah';
  person.Name := 'Vogt';
  person.Age := 10;
  people.Add(person);

  person.Firstname := 'Ute';
  person.Name := 'Meusel';
  person.Age := 38;
  people.Add(person);

  person.Firstname := 'Buddy';
  person.Name := 'Vogt';
  person.Age := 2;
  people.Add(person);


  for person in people do begin
    //WritePerson(person);
    WriteLn(person.ToString);
  end;



  WriteLn('=======================================');









  WriteLn('Press any key to quit ...');
  ReadLn();
end.

