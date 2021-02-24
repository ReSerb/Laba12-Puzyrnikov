unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TParallel=class
    public
    Fa:word;
    Fb:word;
    Fc:word;
    procedure Init(a,b,c:word);
    function Volume:word;
    procedure Show;
  end;

var
  Form1: TForm1;
  Par1:TParallel;
  Par:array [1..5] of TParallel;
  x:word=0;
  y:word=0;
  z:word=0;

implementation


{$R *.dfm}

procedure TParallel.Init(a, b, c: word);
begin
Fa:=a;
Fb:=b;
Fc:=c;
end;

procedure TParallel.Show;
begin
ShowMessage('����� ��������������� ����� '  + IntToStr(Volume)+#10#13+
'������ � ���� Fa= '+IntToStr(Fa)+#10#13+
'����� � ���� Fb= '+IntToStr(Fb) +#10#13+
'������ � ���� Fc= '+IntToStr(Fc) );
end;

function TParallel.Volume:word;
begin
result:=Fa*Fb*Fc;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
x:=x+1; y:=y+1; z:=z+1;
Par1:=TParallel.Create;
Par1.Init(x,y,z);
Par1.Show;
Memo1.Lines.Add('����� � ������ �������, ������������ � Par1, ����� '+IntToStr(integer(Par1)) );
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if Par1=nil then
form1.Caption:='������� � ������ ���'
else form1.Caption:='������ ���������� � ������'
end;


procedure TForm1.Button3Click(Sender: TObject);IntToStr(Par[i].Fa) );
end;

end.

