{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvAppInfo.PAS, released on 2002-05-26.

The Initial Developer of the Original Code is Peter Th�rnqvist [peter3@peter3.com]
Portions created by Peter Th�rnqvist are Copyright (C) 2002 Peter Th�rnqvist.
All Rights Reserved.

Contributor(s):

Last Modified: 2003-10-24

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}

{$I JVCL.INC}

{ A class that functions as a base class for saving / loading arbitrary application
  data to the registry or an inifile. }

unit JvAppInfo;

interface

uses
{$IFDEF COMPLIB_VCL}
  Windows, Registry,
{$ENDIF}
  Classes, SysUtils;

type
  TJvAppInfo = class(TPersistent)
  private
    {$IFDEF COMPLIB_VCL}
    FUseRegistry: Boolean;
    FRegKey: DWORD;
    {$ENDIF}
    FSavePath: string;
    FSection: string;
    FUnAssigned: string;
    procedure CheckPath;
    function LoadIni: Boolean;
    function SaveIni: Boolean;
    {$IFDEF COMPLIB_VCL}
    function LoadRegistry: Boolean;
    function SaveRegistry: Boolean;
    {$ENDIF}
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    function Save: Boolean; virtual;
    function Load: Boolean; virtual;
    property SavePath: string read FSavePath write FSavePath;
    //  If set to True, SavePath is interpreted as a registry path
    {$IFDEF COMPLIB_VCL}
    property UseRegistry: Boolean read FUseRegistry write FUseRegistry;
    property RegRootKey: DWORD read FRegKey write FRegKey;
    {$ENDIF}
    property Section: string read FSection write FSection;
    property UnAssignedValue: string read FUnAssigned write FUnAssigned;
  end;

implementation

uses
  IniFiles, TypInfo,
  JvTypes;

resourcestring
  cInvalidPropertyFmt = 'Invalid property: %s';
  SNoPathSpecified = 'No path specified';

function TJvAppInfo.LoadIni: Boolean;
var
  I: Integer;
  PropList: TPropList;
  Ini: TIniFile;
  Value: string;
begin
  CheckPath;
  Ini := TIniFile.Create(SavePath);
  try
    I := 0;
    if GetPropList(ClassInfo, tkProperties, @PropList) > 0 then
      while Assigned(PropList[I]) and (I < High(PropList)) do
      begin
        Value := Ini.ReadString(Section, PropList[i].Name, FUnAssigned);
        if Value <> FUnAssigned then
          case PropList[I].PropType^.Kind of
            tkInteger, tkEnumeration:
              SetOrdProp(Self, PropList[I], StrToInt(Value));
            tkFloat:
              SetFloatProp(Self, PropList[I], StrToFloat(Value));
            tkString,tkLString:
              SetStrProp(Self, PropList[I], Value);
          else
            raise EJVCLException.CreateFmt(cInvalidPropertyFmt, [PropList[I].Name]);
          end;
        Inc(I);
      end;
  finally
    Ini.Free;
  end;
  Result := True;
end;

function TJvAppInfo.SaveIni: Boolean;
var
  I: Integer;
  PropList: TPropList;
  Ini: TIniFile;
  Value: string;
begin
  CheckPath;
  Ini := TIniFile.Create(SavePath);
  I := 0;
  try
    if GetPropList(ClassInfo, tkProperties, @PropList) > 0 then
      while Assigned(PropList[I]) and (I < High(PropList)) and (PropList[I].Name <> '') do
      begin
        case PropList[I].PropType^.Kind of
          tkInteger, tkEnumeration:
            Value := IntToStr(GetOrdProp(Self, PropList[I]));
          tkFloat:
            Value := FloatToStr(GetFloatProp(Self, PropList[I]));
          tkString, tkLString:
            Value := GetStrProp(Self, PropList[I]);
          else
            raise EJVCLException.CreateFmt(cInvalidPropertyFmt, [PropList[I].Name]);
          end;
          Ini.WriteString(Section, PropList[I].Name, Value);
          Inc(I);
      end;
  finally
    Ini.Free;
  end;
  Result := True;
end;

{$IFDEF COMPLIB_VCL}
function TJvAppInfo.LoadRegistry: Boolean;
var
  I: Integer;
  PropList: TPropList;
  Reg: TRegIniFile;
  Value: string;
begin
  Result := False;
  CheckPath;
  Reg := TRegIniFile.Create('');
  I := 0;
  try
    Reg.RootKey := RegRootKey;
    if not Reg.OpenKey(SavePath, False) then
      Exit;
    if GetPropList(ClassInfo, tkProperties, @PropList) > 0 then
      while Assigned(PropList[I]) and (I < High(PropList)) do
      begin
        Value := Reg.ReadString(Section, PropList[I].Name, FUnAssigned);
        if Value <> FUnAssigned then
          case PropList[I].PropType^.Kind of
            tkInteger, tkEnumeration:
              SetOrdProp(Self, PropList[I], StrToInt(Value));
            tkFloat:
              SetFloatProp(Self, PropList[I], StrToFloat(Value));
            tkString, tkLString:
              SetStrProp(Self, PropList[I], Value);
          else
            raise EJVCLException.CreateFmt(cInvalidPropertyFmt, [PropList[I].Name]);
          end;
        Inc(I);
      end;
  finally
    Reg.Free;
  end;
  Result := True;
end;

function TJvAppInfo.SaveRegistry: Boolean;
var
  I: Integer;
  PropList: TPropList;
  Reg: TRegIniFile;
  Value: string;
begin
  Reg := TRegIniFile.Create('');
  try
    Reg.RootKey := RegRootKey;
    Reg.OpenKey(SavePath, True);
    I := 0;
    if GetPropList(ClassInfo, tkProperties, @PropList) > 0 then
      while Assigned(PropList[I]) and (I < High(PropList)) and (PropList[I].Name <> '') do
      begin
        case PropList[I].PropType^.Kind of
          tkInteger, tkEnumeration:
            Value := IntToStr(GetOrdProp(Self, PropList[I]));
          tkFloat:
            Value := FloatToStr(GetFloatProp(Self, PropList[I]));
          tkString, tkLString:
            Value := GetStrProp(Self, PropList[I]);
        else
          raise EJVCLException.CreateFmt(cInvalidPropertyFmt, [PropList[I].Name]);
        end;
        Reg.WriteString(Section, PropList[i].Name, Value);
        Inc(I);
      end;
  finally
    Reg.Free;
  end;
  Result := True;
end;
{$ENDIF COMPLIB_VCL}

function TJvAppInfo.Load: Boolean;
begin
  CheckPath;
{$IFDEF COMPLIB_VCL}
  if UseRegistry then
    Result := LoadRegistry
  else
{$ENDIF}
    Result := LoadIni;
end;

function TJvAppInfo.Save: Boolean;
begin
  CheckPath;
{$IFDEF COMPLIB_VCL}
  if UseRegistry then
    Result := SaveRegistry
  else
{$ENDIF}
    Result := SaveIni;
end;

procedure TJvAppInfo.CheckPath;
begin
  if SavePath = '' then
    raise EJVCLException.Create(SNoPathSpecified);
end;

constructor TJvAppInfo.Create;
begin
  inherited Create;
{$IFDEF COMPLIB_VCL}
  FRegKey := HKEY_CURRENT_USER;
{$ENDIF}  
  FUnAssigned := '';
end;

procedure TJvAppInfo.Assign(Source: TPersistent);
begin
  if Source is TJvAppInfo then
  begin
    SavePath := TJvAppInfo(Source).SavePath;
  {$IFDEF COMPLIB_VCL}
    UseRegistry := TJvAppInfo(Source).UseRegistry;
    RegRootKey := TJvAppInfo(Source).RegRootKey;
  {$ENDIF}
    Section := TJvAppInfo(Source).Section;
    UnAssignedValue := TJvAppInfo(Source).UnAssignedValue;
    Exit;
  end;
  inherited Assign(Source);
end;

end.

