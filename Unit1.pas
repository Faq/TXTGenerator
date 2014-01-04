unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IOUtils, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    SaveFile: TButton;
    Generate: TButton;
    Memo1: TMemo;
    procedure LoadFile(Sender: TObject);
    procedure SaveFileClick(Sender: TObject);
    procedure GenerateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.LoadFile(Sender: TObject);
begin
if FileExists('template.txt')then begin
Memo1.Lines.LoadFromFile('template.txt');
  end
  else
    ShowMessage('Failu template.txt neatrodu, iearaksti tekstu un izmanto pogu "SAVE" !!!');
end;

procedure TForm1.SaveFileClick(Sender: TObject);
begin
Memo1.Lines.SaveToFile('template.txt');
end;

procedure TForm1.GenerateClick(Sender: TObject);
var
  dirName, fName : String;
  i, max: integer;
begin
  // Create a new directory
  dirName := 'gen';

  if NOT DirectoryExists(dirName) then
    CreateDir(dirName);

  fName := Edit1.Text;
  max := StrToInt(fName);

  for i := 1 to max do begin
    fName := dirName + '\'+ IntToStr(i) + '.txt';
    Memo1.Lines.SaveToFile( fName );
  end;

end;
end.
