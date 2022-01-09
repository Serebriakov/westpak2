{
$Id: AboutBoxUnit.pas,v 1.2 2006/02/13 14:09:46 dk2it Exp $
 ***
 ** About Box Form
 ***
}

unit AboutBoxUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TAboutBoxForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBoxForm: TAboutBoxForm;

implementation

{$R *.dfm}

Uses ShellAPI;

procedure TAboutBoxForm.Label2Click(Sender: TObject);
var address: String;
begin
  address := TLabel(Sender).Caption;
  if TLabel(Sender).Tag = 1 then address := 'mailto:'+address;
  ShellExecute(Self.Handle, 'open', pChar(address), '', '', SW_SHOWDEFAULT);
end;

end.
