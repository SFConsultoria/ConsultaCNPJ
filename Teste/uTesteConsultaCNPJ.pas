{******************************************************************************}
{ Projeto: Suicide Coder Consulta CNPJ                                         }
{                                                                              }
{ Direitos Autorais Reservados (c) 2018 Suicide Coder                          }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo em:                           }
{               https://github.com/suicidecoder/ConsultaCNPJ                   }
{                                                                              }
{  Alguns trechos de c�digo deste projeto foram extraidas do Projeto ACBr:     }
{               http://www.sourceforge.net/projects/acbr                       }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 3 da Licen�a, ou (a seu crit�rio)   }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENSE)                                 }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }
{                                                                              }
{ Suicide Coder -  codersuicide@gmail.com                                      }
{                                                                              }
{******************************************************************************}

unit uTesteConsultaCNPJ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFTesteConsultaCNPJ = class(TForm)
    btnConsultar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    memo: TMemo;
    edtCNPJ: TEdit;
    Label5: TLabel;
    procedure btnConsultarClick(Sender: TObject);
  private
    procedure EscreverChavesRegistro;
  public
    { Public declarations }
  end;

var
  FTesteConsultaCNPJ: TFTesteConsultaCNPJ;

implementation

{$R *.dfm}

uses uSCConsultaCNPJ, Registry;

procedure TFTesteConsultaCNPJ.btnConsultarClick(Sender: TObject);
var
  lResposta : TFSCConsultaCNPJResposta;
begin
  EscreverChavesRegistro;

  memo.Lines.Clear;
  lResposta := TFSCConsultaCNPJ.ConsultarCNPJ(edtCNPJ.Text);

  memo.Lines.Add('Sucesso           : '+BoolToStr(lResposta.Sucesso,True));
  memo.Lines.Add('Erro              : '+lResposta.Erro);
  memo.Lines.Add('CNPJ              : '+lResposta.CNPJ);
  memo.Lines.Add('Tipo              : '+lResposta.EmpresaTipo);
  memo.Lines.Add('Raz�o Social      : '+lResposta.RazaoSocial);
  memo.Lines.Add('Fantasia          : '+lResposta.Fantasia);
  memo.Lines.Add('CNAE              : '+lResposta.CNAE1);
  memo.Lines.Add('Endere�o          : '+lResposta.Endereco);
  memo.Lines.Add('N�mero            : '+lResposta.Numero);
  memo.Lines.Add('Complemento       : '+lResposta.Complemento);
  memo.Lines.Add('CEP               : '+lResposta.CEP);
  memo.Lines.Add('Bairro            : '+lResposta.Bairro);
  memo.Lines.Add('Cidade            : '+lResposta.Cidade);
  memo.Lines.Add('UF                : '+lResposta.UF);
  memo.Lines.Add('Situa��o          : '+lResposta.Situacao);
  memo.Lines.Add('Motivo Situa��o   : '+lResposta.MotivoSituacaoCad);
  memo.Lines.Add('Data Abertura     : '+FormatDateTime('dd/mm/yyyy',lResposta.Abertura));
  memo.Lines.Add('Data Situa��o     : '+FormatDateTime('dd/mm/yyyy',lResposta.DataSituacao));
  memo.Lines.Add('Natureza Jur�dica : '+lResposta.NaturezaJuridica);
  memo.Lines.Add('Email             : '+lResposta.EndEletronico);
  memo.Lines.Add('Telefone          : '+lResposta.Telefone);
  memo.Lines.Add('EFR               : '+lResposta.EFR);
end;

procedure TFTesteConsultaCNPJ.EscreverChavesRegistro;
var
  lReg : TRegistry;
begin
  try
    lReg := TRegistry.Create(KEY_WRITE OR KEY_WOW64_32KEY);

    lReg.RootKey := HKEY_LOCAL_MACHINE;
    lReg.OpenKey('\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION',True);
    lReg.WriteInteger( ExtractFileName(Application.ExeName), 11000);
  finally
    FreeAndNil(lReg);
  end;
end;

end.
