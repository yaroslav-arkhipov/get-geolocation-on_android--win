unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdTCPConnection,
  IdTCPClient, IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer,
  IdContext;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    IdTCPServer1: TIdTCPServer;
    IdTCPClient1: TIdTCPClient;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure IdTCPServer1Execute(AContext: TIdContext);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
 IdTCPServer1.Bindings.Add.IP:=Edit1.Text;
 IdTCPServer1.Bindings.Add.Port:=StrToInt(Edit2.Text);
 try
    IdTCPServer1.Active:=true;
     except
    On E: Exception do
      Memo1.Lines.Add(E.Message);
  end;
 end;


procedure TForm1.Button2Click(Sender: TObject);
begin
IdTCPServer1.Active:=false;
end;

procedure TForm1.IdTCPServer1Execute(AContext: TIdContext);
var
s:string;
begin
s:= AContext.Connection.Socket.ReadLn; //���������� � ���������� "s" ���������, ���������� ��������.
Memo1.Lines.add('['+Timetostr(time)+'] '+'['+AContext.Connection.Socket.Binding.PeerIP+'] '+ s);
end;

end.
