{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvExButtons.pas, released on 2004-01-04

The Initial Developer of the Original Code is Andreas Hausladen [Andreas dott Hausladen att gmx dott de]
Portions created by Andreas Hausladen are Copyright (C) 2004 Andreas Hausladen.
All Rights Reserved.

Contributor(s): -

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}
// $Id$

unit JvExButtons;

{$I jvcl.inc}
{MACROINCLUDE JvExControls.macros}

{*****************************************************************************
 * WARNING: Do not edit this file.
 * This file is autogenerated from the source in devtools/JvExVCL/src.
 * If you do it despite this warning your changes will be discarded by the next
 * update of this file. Do your changes in the template files.
 ****************************************************************************}

interface

uses
  {$IFDEF VCL}
  Windows, Messages,
  {$ENDIF VCL}
  Graphics, Controls, Forms, Buttons, StdCtrls,
  {$IFDEF VisualCLX}
  Qt, QWindows,
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
  TJvExSpeedButton = class(TSpeedButton, IJvControlEvents, IPerformControl)
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
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  // IJvControlEvents
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
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
  {$ENDIF VisualCLX}
  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TJvExPubSpeedButton = class(TJvExSpeedButton)
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
  
  TJvExBitBtn = class(TBitBtn, IJvWinControlEvents, IJvControlEvents, IPerformControl)
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
  // IJvControlEvents
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
    InternalFontChanged: TNotifyEvent;
    procedure OnFontChanged(Sender: TObject);
  protected
    procedure BoundsChanged; override;
    procedure DoFontChanged(Sender: TObject); dynamic;
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    procedure PaintWindow(PaintDevice: QPaintDeviceH);
    function WidgetFlags: integer; override;
    procedure CreateWnd; dynamic;
    procedure CreateWidget; override;
    procedure RecreateWnd;
  public
    procedure PaintTo(PaintDevice: QPaintDeviceH; X, Y: integer);
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
  {$ENDIF VisualCLX}
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TJvExPubBitBtn = class(TJvExBitBtn)
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
procedure TJvExSpeedButton.Dispatch(var Msg);
asm
    JMP   DispatchMsg
end;

procedure TJvExSpeedButton.VisibleChanged;
asm
    MOV  EDX, CM_VISIBLECHANGED
    JMP  InheritMsg
end;

procedure TJvExSpeedButton.EnabledChanged;
asm
    MOV  EDX, CM_ENABLEDCHANGED
    JMP  InheritMsg
end;

procedure TJvExSpeedButton.TextChanged;
asm
    MOV  EDX, CM_TEXTCHANGED
    JMP  InheritMsg
end;

procedure TJvExSpeedButton.FontChanged;
asm
    MOV  EDX, CM_FONTCHANGED
    JMP  InheritMsg
end;

procedure TJvExSpeedButton.ColorChanged;
asm
    MOV  EDX, CM_COLORCHANGED
    JMP  InheritMsg
end;

procedure TJvExSpeedButton.ParentFontChanged;
asm
    MOV  EDX, CM_PARENTFONTCHANGED
    JMP  InheritMsg
end;

procedure TJvExSpeedButton.ParentShowHintChanged;
asm
    MOV  EDX, CM_PARENTSHOWHINTCHANGED
    JMP  InheritMsg
end;

function TJvExSpeedButton.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsgEx(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExSpeedButton.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsgEx(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExSpeedButton.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsgEx(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExSpeedButton.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, Control, FMouseOver, FSavedHintColor, FHintColor,
    FOnMouseEnter);
end;

procedure TJvExSpeedButton.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(Self, Control, FMouseOver, FSavedHintColor, FOnMouseLeave);
end;

procedure TJvExSpeedButton.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExSpeedButton.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
{$ENDIF VCL}
{$IFDEF VisualCLX}
procedure TJvExSpeedButton.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, Control, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExSpeedButton.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(Self, Control, FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExSpeedButton.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExSpeedButton.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
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

procedure TJvExSpeedButton.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExSpeedButton.IsRightToLeft: Boolean;
begin
  Result := False;
end;
  
{$ENDIF VisualCLX}
procedure TJvExSpeedButton.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExSpeedButton.DoFocusChanged(Control: TWinControl);
begin
end;
  
constructor TJvExSpeedButton.Create(AOwner: TComponent);
begin
  {$IFDEF VisualCLX}
  WindowProc := WndProc;
  {$ENDIF VisualCLX}
  inherited Create(AOwner);
  FHintColor := Application.HintColor;
  
end;

destructor TJvExSpeedButton.Destroy;
begin
  
  inherited Destroy;
end;
 
{$IFDEF VCL}
procedure TJvExBitBtn.Dispatch(var Msg);
asm
    JMP   DispatchMsg
end;

procedure TJvExBitBtn.VisibleChanged;
asm
    MOV  EDX, CM_VISIBLECHANGED
    JMP  InheritMsg
end;

procedure TJvExBitBtn.EnabledChanged;
asm
    MOV  EDX, CM_ENABLEDCHANGED
    JMP  InheritMsg
end;

procedure TJvExBitBtn.TextChanged;
asm
    MOV  EDX, CM_TEXTCHANGED
    JMP  InheritMsg
end;

procedure TJvExBitBtn.FontChanged;
asm
    MOV  EDX, CM_FONTCHANGED
    JMP  InheritMsg
end;

procedure TJvExBitBtn.ColorChanged;
asm
    MOV  EDX, CM_COLORCHANGED
    JMP  InheritMsg
end;

procedure TJvExBitBtn.ParentFontChanged;
asm
    MOV  EDX, CM_PARENTFONTCHANGED
    JMP  InheritMsg
end;

procedure TJvExBitBtn.ParentShowHintChanged;
asm
    MOV  EDX, CM_PARENTSHOWHINTCHANGED
    JMP  InheritMsg
end;

function TJvExBitBtn.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsgEx(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExBitBtn.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsgEx(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExBitBtn.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsgEx(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExBitBtn.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, Control, FMouseOver, FSavedHintColor, FHintColor,
    FOnMouseEnter);
end;

procedure TJvExBitBtn.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(Self, Control, FMouseOver, FSavedHintColor, FOnMouseLeave);
end;

procedure TJvExBitBtn.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExBitBtn.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExBitBtn.CursorChanged;
asm
    MOV  EDX, CM_CURSORCHANGED
    JMP  InheritMsg
end;

procedure TJvExBitBtn.ShowHintChanged;
asm
    MOV  EDX, CM_SHOWHINTCHANGED
    JMP  InheritMsg
end;

procedure TJvExBitBtn.ShowingChanged;
asm
    MOV  EDX, CM_SHOWINGCHANGED
    JMP  InheritMsg
end;

procedure TJvExBitBtn.ControlsListChanging(Control: TControl; Inserting: Boolean);
asm
    JMP   Control_ControlsListChanging
end;

procedure TJvExBitBtn.ControlsListChanged(Control: TControl; Inserting: Boolean);
asm
    JMP   Control_ControlsListChanged
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExBitBtn.GetParentBackground: Boolean;
asm
    JMP   JvThemes.GetParentBackground
end;

procedure TJvExBitBtn.SetParentBackground(Value: Boolean);
asm
    JMP   JvThemes.SetParentBackground
end;
{$ENDIF JVCLThemesEnabledD56}
  
{$ENDIF VCL}
{$IFDEF VisualCLX}
procedure TJvExBitBtn.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, Control, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExBitBtn.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(Self, Control, FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExBitBtn.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExBitBtn.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
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

procedure TJvExBitBtn.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExBitBtn.IsRightToLeft: Boolean;
begin
  Result := False;
end;
  
function TJvExBitBtn.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := WidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExBitBtn.OnFontChanged(Sender: TObject);
var
  FontChangedEvent: QEventH;
begin
  FontChangedEvent := QEvent_create(QEventType_FontChanged);
  if FontChangedEvent <> nil then
    QApplication_postEvent(Handle, FontChangedEvent);
end;

procedure TJvExBitBtn.DoFontChanged(Sender: TObject);
begin
  if Assigned(InternalFontChanged) then
    InternalFontChanged(self);
end;

procedure TJvExBitBtn.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExBitBtn.RecreateWnd;
begin
  RecreateWidget;
end;

procedure TJvExBitBtn.CreateWidget;
begin
  CreateWnd;
end;

procedure TJvExBitBtn.CreateWnd;
begin
  inherited CreateWidget;
end;

function TJvExBitBtn.WidgetFlags: integer;
begin
  Result := inherited WidgetFlags or
    integer(WidgetFlags_WRepaintNoErase) or
    integer(WidgetFlags_WMouseNoMask);
end;

function TJvExBitBtn.EventFilter(Sender: QObjectH; Event: QEventH): boolean;
begin
  Result := inherited EventFilter(Sender, Event);
  Result := Result or WidgetControl_EventFilter(Self, Sender, Event);
end;

procedure TJvExBitBtn.PaintWindow(PaintDevice: QPaintDeviceH);
begin
  WidgetControl_PaintTo(self, PaintDevice, 0, 0);
end;

procedure TJvExBitBtn.PaintTo(PaintDevice: QPaintDeviceH; X, Y: integer);
begin
  WidgetControl_PaintTo(self, PaintDevice, X, Y);
end;
  
{$ENDIF VisualCLX}
procedure TJvExBitBtn.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExBitBtn.DoFocusChanged(Control: TWinControl);
begin
end;
  
procedure TJvExBitBtn.DoBoundsChanged;
begin
end;

procedure TJvExBitBtn.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExBitBtn.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExBitBtn.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExBitBtn.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   DefaultDoPaintBackground
end;
  
constructor TJvExBitBtn.Create(AOwner: TComponent);
begin
  {$IFDEF VisualCLX}
  WindowProc := WndProc;
  {$ENDIF VisualCLX}
  inherited Create(AOwner);
  {$IFDEF VisualCLX}
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  InternalFontChanged := Font.OnChange;
  Font.OnChange := OnFontChanged;
  {$ENDIF VisualCLX}
  FHintColor := Application.HintColor;
end;

{$IFDEF VisualCLX}
procedure TJvExBitBtn.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  WidgetControl_Painting(Self, Canvas, EventRegion);
end;

procedure TJvExBitBtn.Paint;
begin
  WidgetControl_DefaultPaint(self, Canvas);
end;
{$ENDIF VisualCLX}

destructor TJvExBitBtn.Destroy;
begin
  inherited Destroy;
end;
  

end.
