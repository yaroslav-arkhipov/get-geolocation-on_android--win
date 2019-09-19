unit TabbedTemplate;

interface

uses
  System.SysUtils, System.IOUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl,
  FMX.StdCtrls, FMX.Gestures, System.Sensors, FMX.WebBrowser,
  System.Sensors.Components, FMX.ListBox, IdCustomTCPServer, IdTCPServer,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.Memo;

type
  TTabbedForm = class(TForm)
    HeaderToolBar: TToolBar;
    ToolBarLabel: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    GestureManager1: TGestureManager;
    LocationSensor1: TLocationSensor;
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    Button3: TButton;
    IdTCPClient1: TIdTCPClient;
    IdTCPServer1: TIdTCPServer;
    Edit1: TEdit;
    Edit2: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Button4: TButton;
    Memo1: TMemo;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    ComboBox1: TComboBox;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TabbedForm: TTabbedForm;
  lon: string;
  lat: string;
  l:integer;
implementation

{$R *.fmx}

procedure TTabbedForm.Button1Click(Sender: TObject);
begin
 Timer1.Enabled:=true;
end;

procedure TTabbedForm.Button2Click(Sender: TObject);
begin
 Timer1.Enabled:=false;
 LocationSensor1.Active:=false;
end;

procedure TTabbedForm.Button3Click(Sender: TObject);
begin
FormatSettings.DecimalSeparator:= '.';
WebBrowser1.Navigate(
    Format(
      'https://maps.google.com/maps?q=%s %s',
      [lat, lon]
    )
  );
end;

procedure TTabbedForm.Button4Click(Sender: TObject);
begin
IdTCPClient1.Host:=Edit1.Text;
IdTCPClient1.Port:=StrToInt(Edit2.Text);
try
IdTCPclient1.Connect;
  except
  Memo1.Lines.Add('������ �����������!');
end;
end;

procedure TTabbedForm.Button5Click(Sender: TObject);
begin
l:=0;
l:=1;
end;

procedure TTabbedForm.Button6Click(Sender: TObject);
begin
l:=0;
end;

procedure TTabbedForm.Button7Click(Sender: TObject);
begin
IdTCPclient1.Disconnect;
l:=0;
end;

procedure TTabbedForm.ComboBox1Change(Sender: TObject);
begin
case ComboBox1.ItemIndex of
0: Timer1.Interval:=1000;
1: Timer1.Interval:=2000;
2: Timer1.Interval:=3000;
3: Timer1.Interval:=4000;
4: Timer1.Interval:=5000;
5: Timer1.Interval:=10000;
6: Timer1.Interval:=20000;
7: Timer1.Interval:=30000;
8: Timer1.Interval:=60000;
end;
end;

procedure TTabbedForm.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItem1;
end;

procedure TTabbedForm.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
{$IFDEF ANDROID}
  case EventInfo.GestureID of
    sgiLeft:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[TabControl1.TabCount-1] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex+1];
      Handled := True;
    end;

    sgiRight:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[0] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex-1];
      Handled := True;
    end;
  end;
{$ENDIF}
end;

procedure TTabbedForm.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
  var
  str: string;
  k: integer;
begin
  FormatSettings.DecimalSeparator:= '.';
  lon:=NewLocation.Longitude.ToString;
  lat:=NewLocation.Latitude.ToString;
  Label3.Text:=NewLocation.Latitude.ToString;
  Label4.Text:=NewLocation.Longitude.ToString;
LocationSensor1.Active:=false;
end;

procedure TTabbedForm.Timer1Timer(Sender: TObject);
begin
LocationSensor1.Active:=true;
 if l=1 then
  begin
  Memo1.Lines.Add(Timetostr(time));
  Memo1.Lines.Add('�������: '+lat);
  Memo1.Lines.Add('������: '+lon);
  IdTCPClient1.Socket.WriteLn(lat+' '+lon);
  end
  else
  begin
  end;
end;

end.