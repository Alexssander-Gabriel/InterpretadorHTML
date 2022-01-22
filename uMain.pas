unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, System.Win.Registry, ActiveX;

type
  TFrm_Interpretador = class(TForm)
    MainMenu1: TMainMenu;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    WebBrowser: TWebBrowser;
    Mm_Html: TMemo;
    Panel3: TPanel;
    Btn_RodarHtml: TBitBtn;
    Arquivo1: TMenuItem;
    Sobre1: TMenuItem;
    Btn_Limpar: TBitBtn;
    Pn_body: TPanel;
    Edt_Versao: TEdit;
    Btn_AlteraVr: TBitBtn;
    Exemplo1: TMenuItem;
    procedure Btn_AlteraVrClick(Sender: TObject);
    procedure Btn_RodarHtmlClick(Sender: TObject);
    procedure Mm_HtmlClick(Sender: TObject);
    procedure Exemplo1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_LimparClick(Sender: TObject);
  private
    { Private declarations }
    procedure EmulatedIE(versao : integer);
    procedure carregaHTML(WebBrowser: TWebBrowser; HTMLCode: string);
    procedure rodaExemplo();
  public
    { Public declarations }
  end;

var
  Frm_Interpretador: TFrm_Interpretador;

implementation

{$R *.dfm}

{ TFrm_Interpretador }

procedure TFrm_Interpretador.Btn_AlteraVrClick(Sender: TObject);
var
 versao : integer;
begin
  if (TryStrToInt(trim(Edt_Versao.Text), versao)) then
    EmulatedIE(versao)
  else
  begin
   Application.MessageBox(Pchar('Somente Números!'), Pchar('Erro'), MB_OK+MB_ICONERROR);
   Edt_Versao.Clear;
   Edt_Versao.SetFocus;
  end;
end;


procedure TFrm_Interpretador.Btn_LimparClick(Sender: TObject);
begin
  Mm_Html.Clear;
end;

procedure TFrm_Interpretador.Btn_RodarHtmlClick(Sender: TObject);
begin
  if (trim(Mm_Html.Text) <> '') then
   carregaHTML(WebBrowser, Mm_Html.Text)
  else
  begin
   Application.MessageBox(Pchar('Código HTML Se encontra vazio.!'), Pchar('Mensagem'), MB_OK+MB_ICONERROR);
   Mm_Html.SetFocus;
  end;
end;

procedure TFrm_Interpretador.carregaHTML(WebBrowser: TWebBrowser;
  HTMLCode: string);
var
   sl: TStringList;
   ms: TMemoryStream;
begin
   WebBrowser.Navigate('about:blank') ;
   while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;

   if Assigned(WebBrowser.Document) then
   begin
     sl := TStringList.Create;
     try
       ms := TMemoryStream.Create;
       try
         sl.Text := HTMLCode;
         sl.SaveToStream(ms) ;
         ms.Seek(0, 0) ;
         (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms)) ;
       finally
         ms.Free;
       end;
     finally
       sl.Free;
     end;
   end;
end;

procedure TFrm_Interpretador.EmulatedIE(versao: integer);
const
 REG_KEY = 'Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION';
var
 Reg: TRegistry;
 AppName : string;
begin
  AppName := ExtractFileName(ExtractFileName(ParamStr(0)));
  Reg := nil;

  try
   Reg := TRegistry.Create();
   Reg.RootKey := HKEY_CURRENT_USER;
   if (Reg.OpenKey(REG_KEY, true)) then
   begin
    if (Versao = 0) then
     Reg.DeleteValue(AppName)
    else
     Reg.WriteInteger(Appname,Versao);
    Reg.CloseKey;
   end;
   Application.MessageBox(Pchar('Versao Alterada Com Sucesso.'),Pchar('Mensagem')+MB_OK,MB_ICONINFORMATION);
  except
   on E: Exception do
   begin
    Application.MessageBox(Pchar('Erro ao Alterar Versão:  ' + e.Message),Pchar('Erro')+MB_OK,MB_ICONINFORMATION);
   end;
  end;

  if Assigned(Reg) then
   FreeAndNil(Reg);
end;

procedure TFrm_Interpretador.Exemplo1Click(Sender: TObject);
begin
  rodaExemplo();
end;

procedure TFrm_Interpretador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Self := nil;
end;

procedure TFrm_Interpretador.Mm_HtmlClick(Sender: TObject);
begin
  if trim(Mm_Html.Text) =  'Cole aqui o seu HTML.' then
   Mm_Html.Clear;

end;

procedure TFrm_Interpretador.rodaExemplo;
begin
  Mm_Html.Text := '<html> ' + #13#10+
                  '<header>  ' +  #13#10+
                  '    <style type="text/css">   ' + #13#10+
                  '        .cab{ ' +  #13#10+
                  '            font-size: 40px; ' + #13#10+
                  '            text-align: center; ' +  #13#10+
                  '            border-bottom: 1px solid red; ' + #13#10+
                  '            color: red;' +  #13#10+
                  '            margin-bottom: 10px; ' + #13#10+
                  '        } ' +   #13#10+
                  '         body{ ' +  #13#10+
                  '             text-align: center; ' +  #13#10+
                  '         }  ' +  #13#10+
                  '    </style> ' + #13#10+
                  ' </header> ' +    #13#10+
                  '<body>' +    #13#10+
                  '  <script> ' +   #13#10+
                  '      function alteraHTML(){ ' +  #13#10+
                  '       document.getElementById("muda").innerHTML = document.getElementById("digitado").value;  ' + #13#10+
                  '      }  ' + #13#10+
                  '  </script> ' +   #13#10+
                  '  <div>  ' + #13#10+
                  '      <div class="cab"> ' + #13#10+
                  '        <h5>Teste javascript</h5> ' + #13#10+
                  '      </div>   ' +   #13#10+
                  '       <input id="digitado" type="text"> '  +  #13#10+
                  '       <button  onclick="alteraHTML()" style="width: 100px; height: 30px;"> Alterar Texto</button> ' +  #13#10+
                  '      <p id="muda" style="font-size: 30px;"> TEXTO EXEMPLO</p> ' + #13#10+
                  '  </div> ' +  #13#10+
                  ' </body> ' + #13#10+
                  '</html>';

 carregaHTML(WebBrowser, Mm_Html.Text);

end;

end.
