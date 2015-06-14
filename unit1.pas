unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  input, inputr, input_initial: string;
  input_length, i, posit: integer;
  input_w: array [0..20] of string;

begin
  input_length:=0;
  input:=lowercase(Edit1.Text);
  input_initial:=input;
  inputr:='';
  i:=0;
  input_length:=length(input);

  //string to words

  while length(input) > 0 do
  begin
  //showmessage(IntToStr(length(input)));
  posit:=Pos(' ', input);
  if posit=0 then
  begin
    break;
  end;
  //showmessage(IntToStr(posit));
  input_w[i]:=copy(input, 1, posit);
  //showmessage(input_w[i]);
  input:=copy(input, posit+1, input_length);
  showmessage(input);
  showmessage(IntToStr(length(input)));
  i:=i+1;
  end;

  {
  while  input_length > 0 do
  begin
  inputr:=inputr+copy(input, input_length, 1);
  input:=copy(input, 1, input_length-1);
  input_length:=input_length-1;
  end;

  //label2.caption:=inputr;
  //label3.caption:=input;
  //Label1.Caption:=IntToStr(input_length);
  //Label4.Caption:=input_initial;
  if inputr=input_initial then
  begin
  showmessage('yes, this word is a polindrom');
  end;

  if inputr<>input_initial then
  begin
    showmessage('not , this word is not a polindrom');
  end;
  }
end;

end.

