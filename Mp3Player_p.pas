unit Mp3Player_p;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.MPlayer;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    MediaPlayer1: TMediaPlayer;
    Timer1: TTimer;
    Edit1: TEdit;
    ProgressBar1: TProgressBar;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    procedure MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
      var DoDefault: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    { Private declarations }
    mp3path: String;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  if (OpenDialog1.Execute) then // Opens file from your Pc.
  begin
    Edit1.Text := OpenDialog1.FileName;
    // Edit baox text will be the file sorce.
    begin
      mp3path := OpenDialog1.FileName;
      with MediaPlayer1 Do
      begin
        Enabled := true; // Enables rhe Media player and its buttons.
        FileName := mp3path;
        Open; // open MCI device to play the file.
        Position := 0; // Starts the positon from 0.

      end;
      ProgressBar1.Max := MediaPlayer1.Length;
      // Arrenge the length of the progress bar.
      ProgressBar1.Min := 0; // Arrenge the length of the progress bar.
    end;
  end;

end;

procedure TForm3.MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
  var DoDefault: Boolean);
begin
  if Button = btPlay then
  begin
    Timer1.Enabled := true;
    // Starts the progress bar to fill. Check the timer1 codes.
  end;
  if Button = btStop then
  begin
    MediaPlayer1.Position := 0; // Stop the file.
    ProgressBar1.Position := 0; // Make the progress bar to start from begining.
  end;
  if Button = btStep then
  begin
    if (MediaPlayer1.Position + 5000) <= MediaPlayer1.Length then
    begin
      MediaPlayer1.Position := MediaPlayer1.Position + 5000;
      // Move forward 5 sec.

    end
    else
    begin
      MediaPlayer1.Position := 0;
      // if the file does not have 5 sec to pass it will start from begining.
      ProgressBar1.Position := 0;
    end;
    MediaPlayer1.Play; // after passing 5 sec it moves on.
  end;
  if Button = btBack then
  Begin
    if (MediaPlayer1.Position - 5000) > 0 then
    begin
      MediaPlayer1.Position := MediaPlayer1.Position - 5000;
      // Move backward 5 sec.
    end
    else
    begin
      MediaPlayer1.Position := 0;
      // if the file does not have 5 sec to go back it will start from begining.
      MediaPlayer1.Play;
    end;

  End;

end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
  if MediaPlayer1.Enabled then
  begin
    ProgressBar1.Position := MediaPlayer1.Position;
    // Arrenge the Progress bar to fil according to media player.
    if ProgressBar1.Position = MediaPlayer1.Length then
    begin
      MediaPlayer1.Stop;
      ProgressBar1.Position := 0;
      MediaPlayer1.Close;
      MediaPlayer1.Enabled := true;
      MediaPlayer1.FileName := mp3path;
      MediaPlayer1.Open;
      MediaPlayer1.Position := 0;
      ProgressBar1.Max := MediaPlayer1.Length;
      ProgressBar1.Min := 0;

    end;

  end;
end;

end.
