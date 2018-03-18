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

program TesteConsultaCNPJ;

uses
  Vcl.Forms,
  uSCConsultaCNPJ in '../Fontes/uSCConsultaCNPJ.pas' {FSCConsultaCNPJ},
  ACBrUtil in '../Fontes/ACBrUtil.pas',
  ACBrConsts in '../Fontes/ACBrConsts.pas',
  uTesteConsultaCNPJ in 'uTesteConsultaCNPJ.pas' {FTesteConsultaCNPJ};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFTesteConsultaCNPJ, FTesteConsultaCNPJ);
  Application.Run;
end.
