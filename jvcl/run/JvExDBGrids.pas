{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvExDBGrids.pas, released on 2004-01-04

The Initial Developer of the Original Code is Andreas Hausladen [Andreas dott Hausladen att gmx dott de]
Portions created by Andreas Hausladen are Copyright (C) 2004 Andreas Hausladen.
All Rights Reserved.

Contributor(s): -

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}
// $Id$

{$I jvcl.inc}
{MACROINCLUDE JvExControls.macros}

{*****************************************************************************
 * WARNING: Do not edit this file.
 * This file is autogenerated from the source in devtools/JvExVCL/src.
 * If you do it despite this warning your changes will be discarded by the next
 * update of this file. Do your changes in the template files.
 ****************************************************************************}

unit JvExDBGrids;
interface
uses
  {$IFDEF VCL}
  Windows, Messages, Graphics, Controls, Forms, DBGrids,
  {$ENDIF VCl}
  {$IFDEF VisualCLX}
  Qt, QGraphics, QControls, QForms, QDBGrids, Types, QWindows,
  {$ENDIF VisualCLX}
  Classes, SysUtils,
  JvTypes, JvThemes, JVCLVer, JvExControls;

{$IFDEF VCL}
 {$DEFINE NeedMouseEnterLeave}
{$ENDIF VCL}
{$IFDEF VisualCLX}
 {$IF not declared(PatchedVCLX)}
  {$DEFINE NeedMouseEnterLeave}
 {$IFEND}
{$ENDIF VisualCLX}
  
type
  TJvExCustomDBGrid = class(TCustomDBGrid,  IJvWinControlEvents, IJvCustomControlEvents, IJvControlEvents, IPerformControl)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
  protected
    procedure BoundsChanged; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    function GetDoubleBuffered: Boolean;
    procedure ColorChanged; override;
  public
    property DoubleBuffered: Boolean read GetDoubleBuffered write FDoubleBuffered;
  {$ENDIF VisualCLX}
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  {$IFDEF NeedMouseEnterLeave}
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private
  {$IFDEF VCL}
    FAboutJVCL: TJVCLAboutInfo;
  published
    property AboutJVCL: TJVCLAboutInfo read FAboutJVCL write FAboutJVCL stored False;
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False;
  {$ENDIF VisuaLCLX}
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  TJvExPubCustomDBGrid = class(TJvExCustomDBGrid)
  {$IFDEF VCL}
  published
    property BiDiMode;
    property DragCursor;
    property DragKind;
    property DragMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
  {$ENDIF VCL}
  end;
  
  TJvExDBGrid = class(TDBGrid,  IJvWinControlEvents, IJvCustomControlEvents, IJvControlEvents, IPerformControl)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
  protected
    procedure BoundsChanged; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    function GetDoubleBuffered: Boolean;
    procedure ColorChanged; override;
  public
    property DoubleBuffered: Boolean read GetDoubleBuffered write FDoubleBuffered;
  {$ENDIF VisualCLX}
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  {$IFDEF NeedMouseEnterLeave}
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private
  {$IFDEF VCL}
    FAboutJVCL: TJVCLAboutInfo;
  published
    property AboutJVCL: TJVCLAboutInfo read FAboutJVCL write FAboutJVCL stored False;
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False;
  {$ENDIF VisuaLCLX}
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  TJvExPubDBGrid = class(TJvExDBGrid)
  {$IFDEF VCL}
  published
    property BiDiMode;
    property DragCursor;
    property DragKind;
    property DragMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
  {$ENDIF VCL}
  end;
  

implementation

{$IFDEF VCL}
procedure TJvExCustomDBGrid.Dispatch(var Msg);
asm
    JMP   DispatchMsg
end;

procedure TJvExCustomDBGrid.VisibleChanged;
asm
    MOV  EDX, CM_VISIBLECHANGED 
    JMP  InheritMsg
end;

procedure TJvExCustomDBGrid.EnabledChanged;
asm
    MOV  EDX, CM_ENABLEDCHANGED 
    JMP  InheritMsg
end;

procedure TJvExCustomDBGrid.TextChanged;
asm
    MOV  EDX, CM_TEXTCHANGED
    JMP  InheritMsg
end;

procedure TJvExCustomDBGrid.FontChanged;
asm
    MOV  EDX, CM_FONTCHANGED
    JMP  InheritMsg
end;

procedure TJvExCustomDBGrid.ColorChanged;
asm
    MOV  EDX, CM_COLORCHANGED
    JMP  InheritMsg
end;

procedure TJvExCustomDBGrid.ParentFontChanged;
asm
    MOV  EDX, CM_PARENTFONTCHANGED
    JMP  InheritMsg
end;

procedure TJvExCustomDBGrid.ParentShowHintChanged;
asm
    MOV  EDX, CM_PARENTSHOWHINTCHANGED
    JMP  InheritMsg
end;

function TJvExCustomDBGrid.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsgEx(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExCustomDBGrid.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsgEx(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExCustomDBGrid.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsgEx(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExCustomDBGrid.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, Control, FMouseOver, FSavedHintColor, FHintColor,
    FOnMouseEnter);
end;

procedure TJvExCustomDBGrid.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(Self, Control, FMouseOver, FSavedHintColor, FOnMouseLeave);
end;

procedure TJvExCustomDBGrid.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExCustomDBGrid.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExCustomDBGrid.CursorChanged;
asm
    MOV  EDX, CM_CURSORCHANGED
    JMP  InheritMsg
end;

procedure TJvExCustomDBGrid.ShowHintChanged;
asm
    MOV  EDX, CM_SHOWHINTCHANGED
    JMP  InheritMsg
end;

procedure TJvExCustomDBGrid.ShowingChanged;
asm
    MOV  EDX, CM_SHOWINGCHANGED
    JMP  InheritMsg
end;

procedure TJvExCustomDBGrid.ControlsListChanging(Control: TControl; Inserting: Boolean);
asm
    JMP   Control_ControlsListChanging
end;

procedure TJvExCustomDBGrid.ControlsListChanged(Control: TControl; Inserting: Boolean);
asm
    JMP   Control_ControlsListChanged
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExCustomDBGrid.GetParentBackground: Boolean;
asm
    JMP   JvThemes.GetParentBackground
end;

procedure TJvExCustomDBGrid.SetParentBackground(Value: Boolean);
asm
    JMP   JvThemes.SetParentBackground
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
procedure TJvExCustomDBGrid.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExCustomDBGrid.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExCustomDBGrid.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExCustomDBGrid.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExCustomDBGrid.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExCustomDBGrid.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExCustomDBGrid.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin
    WidgetControl_PaintBackground(Self, Canvas);
     Paint;
  end;
end;

function TJvExCustomDBGrid.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

function TJvExCustomDBGrid.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExCustomDBGrid.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExCustomDBGrid.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;
{$ENDIF VisualCLX}
procedure TJvExCustomDBGrid.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomDBGrid.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExCustomDBGrid.DoBoundsChanged;
begin
end;

procedure TJvExCustomDBGrid.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCustomDBGrid.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCustomDBGrid.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExCustomDBGrid.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;
constructor TJvExCustomDBGrid.Create(AOwner: TComponent);
begin
  {$IFDEF VisualCLX}
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  {$ENDIF VisualCLX}
  inherited Create(AOwner);
  FHintColor := clInfoBk;
  
end;

destructor TJvExCustomDBGrid.Destroy;
begin
  
  inherited Destroy;
end;
{$IFDEF VCL}
procedure TJvExDBGrid.Dispatch(var Msg);
asm
    JMP   DispatchMsg
end;

procedure TJvExDBGrid.VisibleChanged;
asm
    MOV  EDX, CM_VISIBLECHANGED 
    JMP  InheritMsg
end;

procedure TJvExDBGrid.EnabledChanged;
asm
    MOV  EDX, CM_ENABLEDCHANGED 
    JMP  InheritMsg
end;

procedure TJvExDBGrid.TextChanged;
asm
    MOV  EDX, CM_TEXTCHANGED
    JMP  InheritMsg
end;

procedure TJvExDBGrid.FontChanged;
asm
    MOV  EDX, CM_FONTCHANGED
    JMP  InheritMsg
end;

procedure TJvExDBGrid.ColorChanged;
asm
    MOV  EDX, CM_COLORCHANGED
    JMP  InheritMsg
end;

procedure TJvExDBGrid.ParentFontChanged;
asm
    MOV  EDX, CM_PARENTFONTCHANGED
    JMP  InheritMsg
end;

procedure TJvExDBGrid.ParentShowHintChanged;
asm
    MOV  EDX, CM_PARENTSHOWHINTCHANGED
    JMP  InheritMsg
end;

function TJvExDBGrid.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsgEx(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExDBGrid.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsgEx(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExDBGrid.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsgEx(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExDBGrid.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, Control, FMouseOver, FSavedHintColor, FHintColor,
    FOnMouseEnter);
end;

procedure TJvExDBGrid.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(Self, Control, FMouseOver, FSavedHintColor, FOnMouseLeave);
end;

procedure TJvExDBGrid.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExDBGrid.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExDBGrid.CursorChanged;
asm
    MOV  EDX, CM_CURSORCHANGED
    JMP  InheritMsg
end;

procedure TJvExDBGrid.ShowHintChanged;
asm
    MOV  EDX, CM_SHOWHINTCHANGED
    JMP  InheritMsg
end;

procedure TJvExDBGrid.ShowingChanged;
asm
    MOV  EDX, CM_SHOWINGCHANGED
    JMP  InheritMsg
end;

procedure TJvExDBGrid.ControlsListChanging(Control: TControl; Inserting: Boolean);
asm
    JMP   Control_ControlsListChanging
end;

procedure TJvExDBGrid.ControlsListChanged(Control: TControl; Inserting: Boolean);
asm
    JMP   Control_ControlsListChanged
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExDBGrid.GetParentBackground: Boolean;
asm
    JMP   JvThemes.GetParentBackground
end;

procedure TJvExDBGrid.SetParentBackground(Value: Boolean);
asm
    JMP   JvThemes.SetParentBackground
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
procedure TJvExDBGrid.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExDBGrid.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExDBGrid.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExDBGrid.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExDBGrid.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExDBGrid.IsRightToLeft: Boolean;
begin
  Result := False;
end;
procedure TJvExDBGrid.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin
    WidgetControl_PaintBackground(Self, Canvas);
     Paint;
  end;
end;

function TJvExDBGrid.GetDoubleBuffered: Boolean;
begin
  Result := FDoubleBuffered;
end;

function TJvExDBGrid.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExDBGrid.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExDBGrid.ColorChanged;
begin
  TWidgetControl_ColorChanged(Self);
end;
{$ENDIF VisualCLX}
procedure TJvExDBGrid.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExDBGrid.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExDBGrid.DoBoundsChanged;
begin
end;

procedure TJvExDBGrid.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExDBGrid.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExDBGrid.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExDBGrid.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;
constructor TJvExDBGrid.Create(AOwner: TComponent);
begin
  {$IFDEF VisualCLX}
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  {$ENDIF VisualCLX}
  inherited Create(AOwner);
  FHintColor := clInfoBk;
  
end;

destructor TJvExDBGrid.Destroy;
begin
  
  inherited Destroy;
end;

end.
