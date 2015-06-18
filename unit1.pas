unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
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
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
input, inputr, input_initial: ansistring;
input_length, i, ii, posit: integer;
input_w: array [0..20] of ansistring;
begin
  input_length:=0;
  i:=0;
  input:=UpperCase(Edit1.Text);
  input_length:=length(input);

  //MAKE AN ARRAY WITH WORDS. PARSING STRING.

  repeat
  //showmessage(IntToStr(length(input)));
  posit:=Pos(' ', input);
  //showmessage(IntToStr(posit));
  input_w[i]:=copy(input, 1, posit-1); //ALSO WORKS FINE
  //input_w[i]:=copy(input, 1, posit); WORKS FINE
  //memo1.Text:=memo1.text+#13+#10+input_w[i];
  //showmessage(IntToStr(i)+' "'+input_w[i]+'"');
  input:=copy(input, posit+1, length(input));//WORKS FINE
  //showmessage(input);

  i:=i+1;
  //showmessage(IntToStr(i));
  //showmessage(IntToStr(length(input)));
  //showmessage(input_w[i]);
  until posit=0;
  input_w[i-1]:=copy(input, 1, length(input));
  //memo1.Text:=memo1.text+#13+#10+input_w[i-1];
  //showmessage(IntToStr(i-1)+' "'+input_w[i-1]+'"');

  ii:=0;

  //FOR EACH WORD
  while input_w[ii]<>'' do
  begin
       input_length:=0;
       input:=input_w[ii];
       inputr:='';
       input_initial:=input;
       input_length:=length(input);

       //WHILE A WORD IS NOT EQUAL TO ''
       while  input_length > 0 do
       begin
          //REVERSING THE WORD
          inputr:=inputr+copy(input, input_length, 1);
          input:=copy(input, 1, input_length-1);
          input_length:=input_length-1;
       end;

       //showmessage('the initial is '+input_initial+' and the inputr is '+inputr);
       if inputr=input_initial then
       begin
         showmessage(input_initial+' - yes, this word is a palindrome');
       end;
       {
       if inputr<>input_initial then
       begin
         showmessage('not , this word is not a polindrom');
       end;
       }
       ii:=ii+1;
  end;
end;

end.

