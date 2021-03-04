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
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TParallel=class
  private
    procedure Init(a, b, c: word);
    public
    Fa:word;
    Fb:word;
    Fc:word;
    {procedure Init(a,b,c:word);}
    constructor Create(a,b,c:word);
    function Volume:word;
    procedure Show;
  end;
  TBar = class(TParallel)
    public
    FRo:real;
    constructor Create(a,b,c:word; Ro: real);
    function massa:real;
    procedure Show;
  end;

var
  Form1: TForm1;
  Par1:TParallel;
  Bar1:TBar;
  Par:array [1..5] of TParallel;
  x:word=0;
  y:word=0;
  z:word=0;

implementation


{$R *.dfm}

constructor TParallel.Create(a, b, c: word);
  begin
    Fa:=a;
    Fb:=b;
    Fc:=c;
  end;

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
    Par1:=TParallel.Create(x,y,z);
    Par[x]:=Par1;
    Par1.Show;
    Memo1.Lines.Add('����� � ������ �������, ������������ � Par1, ����� '+IntToStr(integer(Par1)) );
  end;

procedure TForm1.Button2Click(Sender: TObject);
  begin
    if Par1=nil then
    form1.Caption:='������� � ������ ���'
    else form1.Caption:='������ ���������� � ������'
  end;


procedure TForm1.Button3Click(Sender: TObject);
  var i:integer;
  begin
    for i:=1 to 5 do
    Memo1.Lines.Add('����� ������� � ������� '+IntToStr(i)+' ����� '+IntToStr( integer(Par[i]))+' ���� Fa = '+IntToStr(Par[i].Fa) );
    Par[i].Show;
  end;

procedure TForm1.Button4Click(Sender: TObject);
begin
Bar1:=TBar.Create(1,2,3,10.5);
Bar1.Show;
end;

{ TBar }

constructor TBar.Create(a, b, c: word; Ro: real);
begin
inherited Create(a,b,c);
FRo:=Ro;
end;

function TBar.massa: real;
begin
result:=FRo*Volume;
end;

procedure TBar.Show;
begin
ShowMessage('����� ��������������� ����� ' + IntToStr(Volume)+#10#13+
'������ � ���� Fa= '+IntToStr(Fa)+#10#13+
'����� � ���� Fb= '+IntToStr(Fb) +#10#13+
'������ � ���� Fc= '+IntToStr(Fc)+#10#13+
'��������� � ���� FRo= '+FloatToStr(FRo)+#10#13+
'����� = '+FloatToStr(massa) );
end;

end.

