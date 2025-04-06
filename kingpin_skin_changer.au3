#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=D:\_code_\icon\star_icon.ico
#AutoIt3Wrapper_Outfile=S:\dev_code\models-\kp_skinChanger\kingpin_skin_changer.exe
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Description=Kingpin Skin Changer v1.0.5
#AutoIt3Wrapper_Res_Fileversion=1.0.5.0
#AutoIt3Wrapper_Res_File_Add=_sprites\0.bmp,rt_bitmap,spr_0
#AutoIt3Wrapper_Res_File_Add=_sprites\1.bmp,rt_bitmap,spr_1
#AutoIt3Wrapper_Res_File_Add=_sprites\2.bmp,rt_bitmap,spr_2
#AutoIt3Wrapper_Res_File_Add=_sprites\3.bmp,rt_bitmap,spr_3
#AutoIt3Wrapper_Res_File_Add=_sprites\4.bmp,rt_bitmap,spr_4
#AutoIt3Wrapper_Res_File_Add=_sprites\5.bmp,rt_bitmap,spr_5
#AutoIt3Wrapper_Res_File_Add=_sprites\6.bmp,rt_bitmap,spr_6
#AutoIt3Wrapper_Res_File_Add=_sprites\7.bmp,rt_bitmap,spr_7
#AutoIt3Wrapper_Res_File_Add=_sprites\8.bmp,rt_bitmap,spr_8
#AutoIt3Wrapper_Res_File_Add=_sprites\9.bmp,rt_bitmap,spr_9
#AutoIt3Wrapper_Res_File_Add=_sprites\10.bmp,rt_bitmap,spr_10
#AutoIt3Wrapper_Res_File_Add=_sprites\11.bmp,rt_bitmap,spr_11
#AutoIt3Wrapper_Res_File_Add=_sprites\12.bmp,rt_bitmap,spr_12
#AutoIt3Wrapper_Res_File_Add=_sprites\13.bmp,rt_bitmap,spr_13
#AutoIt3Wrapper_Res_File_Add=_sprites\14.bmp,rt_bitmap,spr_14
#AutoIt3Wrapper_Res_File_Add=_sprites\15.bmp,rt_bitmap,spr_15
#AutoIt3Wrapper_Res_File_Add=_sprites\16.bmp,rt_bitmap,spr_16
#AutoIt3Wrapper_Res_File_Add=_sprites\17.bmp,rt_bitmap,spr_17
#AutoIt3Wrapper_Res_File_Add=_sprites\18.bmp,rt_bitmap,spr_18
#AutoIt3Wrapper_Res_File_Add=_sprites\19.bmp,rt_bitmap,spr_19
#AutoIt3Wrapper_Res_File_Add=_sprites\20.bmp,rt_bitmap,spr_20
#AutoIt3Wrapper_Res_File_Add=_sprites\21.bmp,rt_bitmap,spr_21
#AutoIt3Wrapper_Res_File_Add=_sprites\22.bmp,rt_bitmap,spr_22
#AutoIt3Wrapper_Res_File_Add=_sprites\23.bmp,rt_bitmap,spr_23
#AutoIt3Wrapper_Res_File_Add=_sprites\24.bmp,rt_bitmap,spr_24
#AutoIt3Wrapper_Res_File_Add=_sprites\25.bmp,rt_bitmap,spr_25
#AutoIt3Wrapper_Res_File_Add=_sprites\26.bmp,rt_bitmap,spr_26
#AutoIt3Wrapper_Res_File_Add=_sprites\27.bmp,rt_bitmap,spr_27
#AutoIt3Wrapper_Res_File_Add=_sprites\28.bmp,rt_bitmap,spr_28
#AutoIt3Wrapper_Res_File_Add=_sprites\29.bmp,rt_bitmap,spr_29
#AutoIt3Wrapper_Res_File_Add=_sprites\30.bmp,rt_bitmap,spr_30
#AutoIt3Wrapper_Res_File_Add=_sprites\31.bmp,rt_bitmap,spr_31
#AutoIt3Wrapper_Res_File_Add=_sprites\32.bmp,rt_bitmap,spr_32
#AutoIt3Wrapper_Res_File_Add=_sprites\33.bmp,rt_bitmap,spr_33
#AutoIt3Wrapper_Res_File_Add=_sprites\34.bmp,rt_bitmap,spr_34
#AutoIt3Wrapper_Res_File_Add=_sprites\35.bmp,rt_bitmap,spr_35
#AutoIt3Wrapper_Res_File_Add=_sprites\36.bmp,rt_bitmap,spr_36
#AutoIt3Wrapper_Res_File_Add=_sprites\37.bmp,rt_bitmap,spr_37
#AutoIt3Wrapper_Res_File_Add=_sprites\38.bmp,rt_bitmap,spr_38
#AutoIt3Wrapper_Res_File_Add=_sprites\39.bmp,rt_bitmap,spr_39
#AutoIt3Wrapper_Res_File_Add=_sprites\40.bmp,rt_bitmap,spr_40
#AutoIt3Wrapper_Res_File_Add=_sprites\41.bmp,rt_bitmap,spr_41
#AutoIt3Wrapper_Res_File_Add=_sprites\42.bmp,rt_bitmap,spr_42
#AutoIt3Wrapper_Res_File_Add=_sprites\43.bmp,rt_bitmap,spr_43
#AutoIt3Wrapper_Res_File_Add=_sprites\44.bmp,rt_bitmap,spr_44
#AutoIt3Wrapper_Res_File_Add=_sprites\45.bmp,rt_bitmap,spr_45
#AutoIt3Wrapper_Res_File_Add=_sprites\46.bmp,rt_bitmap,spr_46
#AutoIt3Wrapper_Res_File_Add=_sprites\47.bmp,rt_bitmap,spr_47
#AutoIt3Wrapper_Res_File_Add=_sprites\48.bmp,rt_bitmap,spr_48
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****


; kingpin skin changer v1.0
;
; update v1.0.1
;    added drag file onto window. support for import, export and textur imput boxes
;    added option to backup file
;    added sprite sfx editor
;    disabled ESC closing the program
;    made reader more rebust by reading header offsets.
;    fixed messagebox not centre to program

; update v1.0.2
;    Fixed bug with reset button not reseting image
;    added check for models with zero skins in use
;    added editing of scale/position using bounding box

; update v1.0.3
;	added scale buttons to center model and drop to floor

; update v1.0.4
; 	fixed bug in sprite frame range (if all frames are set to on)

; update v1.0.5
;   added q3 support
;   cleanup arrays
;   ...



AutoItSetOption("MustDeclareVars", 1)

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <String.au3>
#include <FileConstants.au3>
#include <WinAPIFiles.au3>
#include <TabConstants.au3>
#Include <WinAPIEx.au3>
#include <ComboConstants.au3>
#include <StaticConstants.au3>
#include <UpDownConstants.au3>
#include <GuiComboBox.au3>
#include <Array.au3>
#include <File.au3>
#include <WinAPIHObj.au3>
Opt("GUIOnEventMode", 1)
Opt("GUICloseOnESC", 0)


Global Const $iMAXSKIN = 32
Global $KPModelSkins, $Group1, $Group2, $tabs, $tab0, $tab1, $tab2, $tab3, $tab4, _
	$in_model_import, $btn_import, $in_model_export, $btn_export_file, $btn_scale_centre, _
	$btn_scale_drop, $CheckboxScale, $Checkbox1, $btn_export_GO , $in_size_h, $in_size_w, _
	$btn_clear, $Input1_flags, $Input10_rand_scale, $Updown10_randScale, $Input9_lifetime, $Input8_fade_in, _
	$Updown9_lifetime, $Updown8_fadein, $Input7_end_alpha, $Updown7_endAlpha, $Input6_start_alpha , _
	$Updown6_startAlpha, $Input5_randTime, $Updown5_randTime, $Input4_time, $Updown4_time, _
	$Input3_gravity, $Updown3_gravity, $Input2_speed, $Updown2_speed, _
	$Combo2_direction, $Combo1_SFX_Type, $Input11_start_width, $Updown11_startWidth, $Input12_end_width, _
	$Updown12_endWidth, $Input13_start_height, $Updown13_startHeight, $Input14_end_height, _
	$Updown14_end_height, $Input15_rand_w_h , $Updown15_randWH, $Button_Sprite_Reset, _
	$Button_Sprite_Import, $Button_Sprite_Export, $Input16_vertexID, $Updown16_vertIndex, $Group4, _
	$Icon_spr, $Combo3_vertTri, $Input2_defineIndex, $Button_flags, $Checkbox2, _
	$Label2_msgbox, $Label1_msgbox, $Button1_msgbox, $Form1_msgbox, _
	$Input_f_end[10], $Updown_f_end[10], $Input_f_start[10], $Updown_f_start[10], $UI_in_scale[6]

Global $UI_btn_skins[$iMAXSKIN], $UI_in_skins[$iMAXSKIN]; $in_skin_1

MainUI()
Func MainUI()
	Local $iOff
	#Region ### START Koda GUI section ### Form=c:\programs\codeing\autoit-v3\scite\koda\dave\kp\model_fix.kxf
	$KPModelSkins = GUICreate("Kingpin Model Skin Changer v1.0.5", 494, 510, -1, -1, -1, BitOR($WS_EX_ACCEPTFILES,$WS_EX_WINDOWEDGE))
	GUISetOnEvent($GUI_EVENT_CLOSE, "KPModelSkinsClose")

	;import group
	$Group1 = GUICtrlCreateGroup("#1. Open Model", 4, 4, 381, 57)
		$btn_import = GUICtrlCreateButton("Import..", 12, 24, 77, 29)
		GUICtrlSetTip(-1, "Output File Name will also be updated")
		GUICtrlSetOnEvent(-1, "btn_importClick")
		$in_model_import = GUICtrlCreateInput("", 96, 28, 277, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY))
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	;export group
	$Group2 = GUICtrlCreateGroup("#2. Output Model Path", 4, 64, 381, 57)
		$in_model_export = GUICtrlCreateInput("", 96, 88, 277, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY))
		$btn_export_file = GUICtrlCreateButton("Save name..", 12, 84, 77, 29)
		GUICtrlSetTip(-1, "Set output filename different to import.")
		GUICtrlSetOnEvent(-1, "btn_export_fileClick")
	GUICtrlCreateGroup("", -99, -99, 1, 1)


	GUICtrlCreateGroup("#3. Skins/Sprite/Scale", 4, 124, 485, 381, -1, $WS_EX_TRANSPARENT)
		$tabs = GUICtrlCreateTab(8, 144, 477, 357, $TCS_BUTTONS)

		;tab skins 1-16
		$tab0 = GUICtrlCreateTabItem("Skins 1-16")
			$iOff = 176
			For $i = 0 To 15
				$UI_btn_skins[$i] = GUICtrlCreateButton("Skin " & $i+1, 12, $iOff, 61, 20)
				GUICtrlSetOnEvent($UI_btn_skins[$i], "btn_skin_" &$i+1& "Click")
				$UI_in_skins[$i]= GUICtrlCreateInput("", 80, $iOff, 400, 21)
				$iOff += 20
			Next

		;tab 17-32
		$tab1 = GUICtrlCreateTabItem("Skins 17-32")
			$iOff = 176
			For $i = 16 To $iMAXSKIN - 1
				$UI_btn_skins[$i] = GUICtrlCreateButton("Skin " & $i+1, 12, $iOff, 61, 20)
				GUICtrlSetOnEvent($UI_btn_skins[$i], "btn_skin_" &$i+1& "Click")
				$UI_in_skins[$i]= GUICtrlCreateInput("", 80, $iOff, 400, 21)
				$iOff += 20
			Next

		;tab sprites
		$tab2 = GUICtrlCreateTabItem("Sprite")
			GUICtrlCreateGroup("Sprite Settings", 14, 172, 465, 323)
				 $Input1_flags = GUICtrlCreateInput("0", 90, 224, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY,$ES_NUMBER))
				GUICtrlSetTip(-1, "Flags.")
				$Input10_rand_scale = GUICtrlCreateInput("0", 90, 464, 62, 21)
				$Updown10_randScale = GUICtrlCreateUpdown($Input10_rand_scale)
				GUICtrlSetLimit(-1, 2048, 0)
				GUICtrlSetTip(-1, "Random time scale (fadein and lifetime will be multiplied by (x * 0.5), where x is a random number between -1 and 1. (type=float)")
				$Input9_lifetime = GUICtrlCreateInput("0", 90, 440, 62, 21)
				$Updown9_lifetime = GUICtrlCreateUpdown($Input9_lifetime)
				GUICtrlSetLimit(-1, 2048, 0)
				GUICtrlSetTip(-1, "How long will the sprite will be shown before it is gone. (type=float)")
				$Input8_fade_in = GUICtrlCreateInput("0", 90, 416, 62, 21)
				$Updown8_fadein = GUICtrlCreateUpdown($Input8_fade_in)
				GUICtrlSetLimit(-1, 2048, 0)
				GUICtrlSetTip(-1, "Fade in time. (type=float)")
				$Input7_end_alpha = GUICtrlCreateInput("0", 90, 392, 62, 21)
				$Updown7_endAlpha = GUICtrlCreateUpdown($Input7_end_alpha)
				GUICtrlSetLimit(-1, 2048, 0)
				GUICtrlSetTip(-1, "The end of a sprite with how much alpha the sprite has. (type=float)")
				$Input6_start_alpha = GUICtrlCreateInput("0", 90, 368, 62, 21)
				$Updown6_startAlpha = GUICtrlCreateUpdown($Input6_start_alpha)
				GUICtrlSetLimit(-1, 2048, 0)
				GUICtrlSetTip(-1, "The start of a sprite with how much alpha the sprite has.(Float)")
				$Input5_randTime = GUICtrlCreateInput("0", 90, 344, 62, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
				$Updown5_randTime = GUICtrlCreateUpdown($Input5_randTime)
				GUICtrlSetLimit(-1, 100, 1)
				GUICtrlSetTip(-1, "Random spawn interval (sprite will be spawned 50% of the time) (type=float)")
				$Input4_time = GUICtrlCreateInput("0", 90, 320, 62, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
				$Updown4_time = GUICtrlCreateUpdown($Input4_time)
				GUICtrlSetLimit(-1, 2048, 0)
				GUICtrlSetTip(-1, "Spawn interval. 2=0.2 seconds (type=integer)")
				$Input3_gravity = GUICtrlCreateInput("0", 90, 296, 62, 21)
				$Updown3_gravity = GUICtrlCreateUpdown($Input3_gravity)
				GUICtrlSetLimit(-1, 2048, 0)
				GUICtrlSetTip(-1, "Use gravity for sprite. (type=integer)")
				$Input2_speed = GUICtrlCreateInput("0", 90, 272, 62, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
				$Updown2_speed = GUICtrlCreateUpdown($Input2_speed)
				GUICtrlSetLimit(-1, 2048, 1)
				GUICtrlSetTip(-1, "Velocity/Speed (type=integer)")
				$Combo2_direction = GUICtrlCreateCombo("", 90, 248, 63, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
				GUICtrlSetData(-1, "0: UP|1: Use Face/Vert Direction", "0: UP")
				GUICtrlSetTip(-1, "Direction sprite will face")
				GUICtrlCreateLabel("Gravity/Delay", 18, 298, 67, 17, $SS_RIGHT)
				GUICtrlCreateLabel("Speed", 26, 274, 59, 17, $SS_RIGHT)
				GUICtrlSetTip(-1, "Use gravity for sprite")
				GUICtrlCreateLabel("Direction", 26, 250, 59, 17, $SS_RIGHT)
				$Combo1_SFX_Type = GUICtrlCreateCombo("", 90, 200, 63, 25, BitOR($GUI_SS_DEFAULT_COMBO,$CBS_SIMPLE))
				GUICtrlSetData(-1, "0: Blood (Called SFX_SPRITE_SURF_BLOOD1 in code)|1: Bullet Hole (Called SFX_SPRITE_SURF_BULLET1 in code)|2: Riple (Called SFX_SPRITE_SURF_RIPPLE in code)|5: Blood Pool (Called SFX_SPRITE_SURF_BLOOD_POOL in code)|6: Blood Splat|7: Blood Drop|8: Smoke Small|9: Fire|10: Carona|16: Same as 9:|17: Carona Amber|18: Carona Red|19: Carona Green|20: Carona Blue|21: Rain|22: Smoke Small R (Red? but is not red. unfisched texture)|23: Sniper 1c (Missing texture)|24: Sniper 2 (Missing texture)|25: Same as 2.|71: Blood 1|72: Blood 1b|73: Blood 1c|74: Blood 1d|75: Blood 1e|76: Blood 1f|77: Blood 1g|78: Blood 1h|79: Blood 1i|80: Muzzle flash 3|100: Muzzle flash HMG (Used for HMG)|101: Muzzle flash 1 (Used for Pistol)|102: Muzzle flash 2 (Used for Tommygun)|103: Same as 80 (Used for Shotgun)|104: Muzzle flash 4 (Used for Flamethrower)|106: Muzzle flash 1a|107: Muzzle flash 2a|108: Muzzle flash 2b|110: Explode 1|111: Explode 2|116: Smoke Animated|120: Flame Thrower|121: Return error texture.|122: Flame Thrower Blue|123: Same as 121.|124: Splash 1|125: Splash 2|126: Splash 3|127: Splash 4|128: Firewall")
				GUICtrlSetTip(-1, "Sprite image to use")
				GUICtrlSetOnEvent(-1, "Combo1_SFX_TypeChange")
				GUICtrlCreateLabel("SFX Type", 26, 202, 59, 17, $SS_RIGHT)
				GUICtrlCreateLabel("Time 0.1s *", 26, 321, 59, 17, $SS_RIGHT)
				GUICtrlCreateLabel("Spawn %", 18, 346, 67, 17, $SS_RIGHT)
				GUICtrlSetTip(-1, "Random spawn percent.")
				GUICtrlCreateLabel("Start Alpha", 26, 370, 59, 17, $SS_RIGHT)
				GUICtrlCreateLabel("End Alpha", 26, 394, 59, 17, $SS_RIGHT)
				GUICtrlCreateLabel("Fade In", 26, 418, 59, 17, $SS_RIGHT)
				GUICtrlSetTip(-1, "0.0 >")
				GUICtrlCreateLabel("Lifetime", 26, 442, 59, 17, $SS_RIGHT)
				GUICtrlSetTip(-1, "Time sprite will exist for. 0.1>")
				GUICtrlCreateLabel("Rand Scale", 26, 466, 59, 17, $SS_RIGHT)
				$Input11_start_width = GUICtrlCreateInput("0", 250, 200, 62, 21)
				$Updown11_startWidth = GUICtrlCreateUpdown($Input11_start_width)
				GUICtrlSetLimit(-1, 2048, 0)
				GUICtrlSetTip(-1, "Start size of sprite in width. (type=float)")
				GUICtrlCreateLabel("Start Width", 192, 202, 53, 17, $SS_RIGHT)
				$Input12_end_width = GUICtrlCreateInput("0", 250, 224, 62, 21)
				$Updown12_endWidth = GUICtrlCreateUpdown($Input12_end_width)
				GUICtrlSetLimit(-1, 2048, 0)
				GUICtrlSetTip(-1, "End size of sprite in width. (type=float)")
				$Input13_start_height = GUICtrlCreateInput("0", 250, 248, 62, 21)
				$Updown13_startHeight = GUICtrlCreateUpdown($Input13_start_height)
				GUICtrlSetLimit(-1, 2048, 0)
				GUICtrlSetTip(-1, "Start size of sprite in height. (type=float)")
				$Input14_end_height = GUICtrlCreateInput("0", 250, 272, 62, 21)
				$Updown14_end_height = GUICtrlCreateUpdown($Input14_end_height)
				GUICtrlSetLimit(-1, 2048, 0)
				GUICtrlSetTip(-1, "End size of sprite in height. (type=float)")
				$Input15_rand_w_h = GUICtrlCreateInput("0", 250, 296, 62, 21)
				$Updown15_randWH = GUICtrlCreateUpdown($Input15_rand_w_h)
				GUICtrlSetLimit(-1, 2048, 0)
				GUICtrlSetTip(-1, "Random size scale (same as random time scale, but effects only sizes) (type=float)")
				GUICtrlCreateLabel("End Width", 192, 226, 53, 17, $SS_RIGHT)
				GUICtrlCreateLabel("Start Height", 182, 250, 63, 17, $SS_RIGHT)
				GUICtrlCreateLabel("End Height", 182, 274, 63, 17, $SS_RIGHT)
				GUICtrlCreateLabel("Rand W/H", 182, 298, 63, 17, $SS_RIGHT)
				$Button_Sprite_Reset = GUICtrlCreateButton("Reset", 162, 460, 77, 25)
				GUICtrlSetTip(-1, "Return all input boxes to default pistol sfx")
				GUICtrlSetOnEvent(-1, "Button_Sprite_ResetClick")
				$Button_Sprite_Import = GUICtrlCreateButton("Import .qdt", 162, 404, 77, 25)
				GUICtrlSetOnEvent(-1, "Button_Sprite_ImportClick")
				$Button_Sprite_Export = GUICtrlCreateButton("Export .qdt", 162, 432, 77, 25)
				GUICtrlSetOnEvent(-1, "Button_Sprite_ExportClick")
				GUICtrlCreateLabel("Vert/Tri Index #", 166, 326, 79, 17, $SS_RIGHT)
				$Input16_vertexID = GUICtrlCreateInput("0", 250, 324, 62, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
				$Updown16_vertIndex = GUICtrlCreateUpdown($Input16_vertexID)
				GUICtrlSetLimit(-1, 2047, 0)
				GUICtrlSetTip(-1, "What vertex/face index do you want the sprite to be attached to. (type=integer)")

				GUICtrlCreateGroup("Show on frame/s (0-Based)", 322, 196, 149, 291)
					GUICtrlCreateLabel("Start", 332, 218, 43, 17)
					GUICtrlCreateLabel("End", 404, 218, 35, 17)

					$iOff = 238
					For $i = 0 To 9
						;frame start inputs
						$Input_f_start[$i] = GUICtrlCreateInput("0", 330, $iOff, 62, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
						$Updown_f_start[$i] = GUICtrlCreateUpdown($Input_f_start[$i])
						GUICtrlSetLimit(-1, 511, -1)
						GUICtrlSetTip(-1, "Integer")
						;frame end inputs
						$Input_f_end[$i] = GUICtrlCreateInput("0", 402, $iOff, 62, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
						$Updown_f_end[$i] = GUICtrlCreateUpdown($Input_f_end[$i])
						GUICtrlSetLimit(-1, 511, -1)
						GUICtrlSetTip(-1, "Integer")
						$iOff += 24
					Next
				GUICtrlCreateGroup("", -99, -99, 1, 1)

				$Checkbox2 = GUICtrlCreateCheckbox("Add / Update SFX", 246, 404, 69, 81, BitOR($BS_CHECKBOX,$BS_CENTER,$BS_PUSHLIKE,$BS_MULTILINE))
				GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
				GUICtrlSetTip(-1, "Add an SFX entry into the .mdx."&@crlf&"Once SFX is inside an mdx it wont be removed."&@crlf&"To disable set all start/end to -1.")
				GUICtrlSetOnEvent(-1, "Checkbox2Click")
				$Button_flags = GUICtrlCreateButton("Flags", 44, 222, 41, 25)
				GUICtrlSetOnEvent(-1, "Button_flagsClick")
				$Combo3_vertTri = GUICtrlCreateCombo("", 250, 372, 63, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
				GUICtrlSetData(-1, "0: Spawn at Vertex|1: Spawn centre of Triangle", "0: Spawn at Vertex")
				GUICtrlSetTip(-1, "Select vertex or triangle to spawn sprite at")
				$Input2_defineIndex = GUICtrlCreateInput("0", 250, 348, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY,$ES_NUMBER))
				GUICtrlSetState(-1, $GUI_DISABLE)
				GUICtrlSetTip(-1, "Always use the first defined index.")
				GUICtrlCreateLabel("Define Index", 182, 350, 63, 17, $SS_RIGHT)
				GUICtrlCreateLabel("Vert/Tri ?", 182, 374, 63, 17, $SS_RIGHT)
				$Icon_spr = GUICtrlCreateLabel("", 156, 200, 32, 32, $SS_SUNKEN)
			GUICtrlCreateGroup("", -99, -99, 1, 1)

		$tab3 = GUICtrlCreateTabItem("Scale")
			GUICtrlCreateGroup("Model Scale/Position", 14, 172, 465, 323)
			$CheckboxScale = GUICtrlCreateCheckbox("Enable Rescale", 28, 196, 113, 17)
			GUICtrlSetOnEvent(-1, "CheckboxScaleClick")
			GUICtrlCreateLabel("BBox Max XYZ", 22, 224, 81, 17, $SS_RIGHT)
			$UI_in_scale[0] = GUICtrlCreateInput("0.0", 110, 220, 117, 21)
			GUICtrlSetTip(-1, "X")
			$UI_in_scale[1] = GUICtrlCreateInput("0.0", 230, 220, 117, 21)
			GUICtrlSetTip(-1, "Y")
			$UI_in_scale[2] = GUICtrlCreateInput("0.0", 350, 220, 117, 21)
			GUICtrlSetTip(-1, "Z")
			GUICtrlCreateLabel("BBox Min XYZ", 22, 252, 81, 17, $SS_RIGHT)
			$UI_in_scale[3] = GUICtrlCreateInput("0.0", 110, 248, 117, 21)
			GUICtrlSetTip(-1, "X")
			$UI_in_scale[4] = GUICtrlCreateInput("0.0", 230, 248, 117, 21)
			GUICtrlSetTip(-1, "Y")
			$UI_in_scale[5] = GUICtrlCreateInput("0.0", 350, 248, 117, 21)
			GUICtrlSetTip(-1, "Z")
			GUICtrlCreateEdit("", 26, 284, 441, 201, BitOR($ES_AUTOVSCROLL,$ES_AUTOHSCROLL,$ES_READONLY,$ES_WANTRETURN))
			GUICtrlSetData(-1, StringFormat("Scale/reposition models using its bounding-box(BBox) size/position.\r\nThis is non destructive so vertex precision wont be lost.\r\n\r\nOnly effective on the first frame. So its not recommended for animated models.\r\n\r\nBBox Max is the most maximum XYZ position of any vertex.\r\nBBox Min is the most minimum XYZ position of any vertex.\r\n\r\nA pickup item BBox is usually min(-15, -15, -15) max(+15, +15, +15)\r\nIf you want to scale it taller while keeping item on the floor you set max-Z higher.\r\nEg.. min(-15, -15, -15) max(+15, +15, +30)"))
			$btn_scale_drop = GUICtrlCreateButton("Drop To Floor", 350, 188, 117, 25)
			GUICtrlSetTip(-1, "Drop Z height to -15")
			GUICtrlSetOnEvent(-1, "btn_scale_dropClick")
			$btn_scale_centre = GUICtrlCreateButton("Centre Model", 230, 188, 113, 25)
			GUICtrlSetTip(-1, "Place model at centre origin")
			GUICtrlSetOnEvent(-1, "btn_scale_centreClick")
			GUICtrlCreateGroup("", -99, -99, 1, 1)

		$tab4 = GUICtrlCreateTabItem("About")
			GUICtrlCreateEdit("", 12, 176, 468, 321, BitOR($ES_READONLY,$ES_WANTRETURN,$WS_VSCROLL))
			GUICtrlSetData(-1, StringFormat("Created By David Smyth (Hypov8)\r\n===========================\r\n\r\nUsed for changing skins/sprites in md2/mdx files without needing a modelling program.\r\nMDX and MD2 are lossy file formats. Storing vertex position as a single Byte(256 grid units)\r\nSo every time you open and save, you may loose vertex precision.\r\nThis program stops the data loss by just updating skin/sprite values.\r\n\r\nOutput file name is always set when a new model is loaded.\r\nFile will be overwritten by default unless you change the Save File Name.\r\nDo take caution updating the original file. Always have a backup.\r\n\r\nSkin path"&Chr(39)&"s can be manually edited/deleted if needed.\r\n\r\nSkin names are truncated if models/, players/, textures/, kingpin/, Quake2/ is found.\r\n\r\nAdded Texture size option.\r\nKingpin max size is 480 but value seems irrelevant to render quality.\r\nQuake2 UV now resize for software mode.\r\nFile drag and drop supported for all input boxes.\r\nFile [ Open with ] supported.\r\n\r\nUSAGE: \r\n=======\r\n#1. Click [ Import ]. Select your md2/mdx file\r\n#2. Click [ File Name ]. If you want to save as a new file\r\n#3. Change skins/sprites as desired. Skin names can be typed.\r\n#4. Click [ GO! ]. This will make a new/updated model with your skins.\r\n\r\nDISCLAIMER: \r\n===========\r\nCare taken writing program but I do not take any responsibility for loss or damages."))
		GUICtrlCreateTabItem("")

		;misc
		$btn_clear = GUICtrlCreateButton("Clear Skins", 416, 144, 65, 21)
		GUICtrlSetTip(-1, "Clear all skins.")
		GUICtrlSetOnEvent(-1, "btn_clearClick")
		$in_size_w = GUICtrlCreateInput("", 336, 144, 37, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
		GUICtrlSetLimit(-1, 3)
		GUICtrlSetTip(-1, "Texture Width")
		$in_size_h = GUICtrlCreateInput("", 376, 144, 37, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
		GUICtrlSetLimit(-1, 3)
		GUICtrlSetTip(-1, "Texture Height")
		GUICtrlCreateLabel("W/H", 304, 146, 28, 17, $SS_RIGHT)
		GUICtrlSetTip(-1, "Skin Width/Height")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	GUICtrlCreateGroup("#4. Save", 392, 4, 97, 117)
		$btn_export_GO = GUICtrlCreateButton("GO!", 401, 56, 77, 57)
		GUICtrlSetTip(-1, "Generate model"&@CRLF&"CAUTION: make sure you have a backup.")
		GUICtrlSetOnEvent(-1, "btn_export_GOClick")
		$Checkbox1 = GUICtrlCreateCheckbox("Backup", 404, 28, 69, 17)
		GUICtrlSetState(-1, $GUI_CHECKED)
		GUICtrlSetTip(-1, "Create a backup file (file_name.mdx.backup)"&@CRLF&"File will NOT be backed up if a backup already exists")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	GUISetState(@SW_SHOW, $KPModelSkins)
	ConsoleWrite('-loaded'&@CRLF)
	#EndRegion ### END Koda GUI section ###
EndFunc

;~ popup gui
Global Const $Count_Flags = 25 ;16777216
Global enum $FLAG_NAME, $FLAG_DEF
Global $DMFLAGS, $UI_Cbox_flags[$Count_Flags]
Global Const $g_aFlags_kp1[$Count_Flags][2] = [ _
	["1 = Add Gravity",                        "SFX_FLAG_GRAVITY"], _ ;
	["2 = Fixed Decal",                        "SFX_FLAG_SURFACE_EFFECT"], _ ;
	["4 = No Random Rotation",                 "SFX_FLAG_NO_FLIP"], _ ;
	["8 = Fixed Decal. Sort Near. Blend Blue", "SFX_FLAG_LIGHTFLARE"], _ ;
	["16 = Sort Near. Alpha",                  "SFX_FLAG_DEPTHHACK"], _ ;
	["32 = 2D Sprite (Rotate Z)",              "SFX_FLAG_UPRIGHT"], _ ;
	["64 = Move up. Black",                    "SFX_FLAG_VEL_IS_ANGLES"], _ ;
	["128 = Blend White",                      "SFX_FLAG_ADDITIVE_BLEND"], _ ;
	["256 = Sprite (Alpha)",                   "SFX_FLAG_ALPHA_IS_FRAME"], _ ;
	["512 = Blend Blue",                       "SFX_FLAG_VEL_IS_COLOR_MODULATION"], _ ;
	["1024 = Cull Close",                      "SFX_FLAG_CLOSE_CULL"], _ ;
	["",""] _
]


GUI_Flags_Build()
Func GUI_Flags_Build()
	Local $iOff	= 34

	$DMFLAGS = GUICreate("SFX FLAGS", 486, 506, -1, -1, $WS_POPUP, -1, $KPModelSkins)
	GUISetOnEvent($GUI_EVENT_CLOSE, "DMFLAGSClose")
	GUICtrlCreateGroup("Flags", 12, 10, 457, 479)
		For $i = 0 To $Count_Flags -1
			$UI_Cbox_flags[$i] = GUICtrlCreateCheckbox($g_aFlags_kp1[$i][$FLAG_NAME], 20, $iOff, 205, 14)
			GUICtrlCreateLabel($g_aFlags_kp1[$i][$FLAG_DEF], 236, $iOff, 164, 14)
			$iOff += 16
		Next
		GUICtrlCreateButton("Close", 84, $iOff, 309, 45) ;356
		GUICtrlSetOnEvent(-1, "DMFLAGSClose")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUISetState(@SW_HIDE, $DMFLAGS)
EndFunc

GUI_msgBox_Build()
Func GUI_msgBox_Build()
	#Region ### START Koda GUI section ### Form=C:\Programs\codeing\autoit-v3\SciTe\Koda\Dave\msg_box_form.kxf
		;Global $Form1_msgbox = GUICreate("Info", 139, 96, -1, -1, -1, -1, $KPModelSkins)
		$Form1_msgbox = GUICreate("Info", 145, 118, -1, -1, $WS_SYSMENU, -1, $KPModelSkins)
		GUISetOnEvent($GUI_EVENT_CLOSE, "Form1_msgboxClose", $Form1_msgbox)
		$Button1_msgbox = GUICtrlCreateButton("&OK", 37, 65, 75, 23)
		GUICtrlSetOnEvent(-1, "Form1_msgboxClose")
		GUICtrlCreateLabel("", 0, 0, 138, 57)
		GUICtrlSetBkColor(-1, 0xFFFFFF)
		$Label1_msgbox = GUICtrlCreateLabel("Label1_msgbox", 12, 16, 116, 17)
		GUICtrlSetBkColor(-1, 0xFFFFFF)
		$Label2_msgbox = GUICtrlCreateLabel("Label2_msgbox", 12, 32, 116, 17)
		GUICtrlSetBkColor(-1, 0xFFFFFF)
		GUISetState(@SW_HIDE, $Form1_msgbox)
	#EndRegion ### END Koda GUI section ###
EndFunc


#Region #Global
Global Const $MAXTRIANGLES = 4096
Global Const $MAXVERTEX = 2048
Global Const $iMAXTEXCORDS = $MAXTRIANGLES*3 ;todo: load invalid? or is this ok?
Global $skin[$iMAXSKIN]
Global Enum _
	$MOD_NONE, _
	$MOD_MD2, _
	$MOD_MDX, _
	$MOD_MD3, _
	$COUNT_MOD
Global Const $g_aModelData[$COUNT_MOD][2] = [ _
	['', ''], _ ;keep empty?
	["Quake2 Model",  ".md2"], _
	["Kingpin Model", ".mdx"], _
	["Quake3 Model",  ".md3"] _
]
Global $importFileName =""
Global $exportFileName =""
Global $modelType = $MOD_NONE
Global $model_DATA_END, $model_DATA_preSFX, $model_DATA_tri, $model_DATA_scale[6], $model_DATA_frame
Global Const $iSFX_DEF_SIZE = (17*4)
Global Const $iSFX_ENTRY_SIZE = (3*4+128) ;64/128 = 512/1024 frames. todo check this in engine. some models have > 900frames
Global $isActive_msgBox = 0

Global $g_aMD3_surf[$iMAXSKIN][2]
Global $g_iMD3_tex = 0

;sprites
Global $aSFX_define[17]
Global $aSFX_add[4]
Global $aSFX_add_frames[10]
Global $aFrames[512]		;frames to enable sfx
Global $aFrameRange[10][2] 	;frame input boxes (10)
Global $sFileName = "test" 	;store file name for saving qdt
Global $model_DATA_SFXDef[25]
Global $model_DATA_SFXEntry[25]

;
Global $fileOpenDialogPath = @ScriptDir &"\"

;headder global
Global $hdr_magic ;,$hdr_skinWidth,$hdr_skinHeight,$hdr_frameSize,$hdr_numSkins,$hdr_numVertices
Global $hdr_TexCoords[$iMAXTEXCORDS][2] ;max verts, x/y

;SFX Type conversion array
Global Const $aSFX_Type[49] = [ _
	0, _ ;0: Blood (Called SFX_SPRITE_SURF_BLOOD1 in code)|"
	1, _ ;1: Bullet Hole (Called SFX_SPRITE_SURF_BULLET1 in code)|"
	2, _ ;2: Riple (Called SFX_SPRITE_SURF_RIPPLE in code)|"
	5, _ ;3: Blood Pool (Called SFX_SPRITE_SURF_BLOOD_POOL in code)|"
	6, _ ;4: Blood Splat|"
	7, _ ;5: Blood Drop|"
	8, _ ;6: Smoke Small|"
	9, _ ;7: Fire|"
	10, _ ;8: Carona|"
	16, _ ;9: Same as 9:|"
	17, _ ;10: Carona Amber|"
	18, _ ;11: Carona Red|"
	19, _ ;12: Carona Green|"
	20, _ ;13: Carona Blue|"
	21, _ ;14: Rain|"
	22, _ ;15: Smoke Small R (Red? but is not red. unfisched texture)|"
	23, _ ;16: Sniper 1c (Missing texture)|"
	24, _ ;17: Sniper 2 (Missing texture)"
	25, _ ;18: Same as 2."
	71, _ ;19: Blood 1"
	72, _ ;20: Blood 1b"
	73, _ ;21: Blood 1c"
	74, _ ;22: Blood 1d"
	75, _ ;23: Blood 1e"
	76, _ ;24: Blood 1f"
	77, _ ;25: Blood 1g"
	78, _ ;26: Blood 1h"
	79, _ ;27: Blood 1i"
	80, _ ;28: Muzzle flash 3"
	100, _ ;29: Muzzle flash HMG (Used for HMG)"
	101, _ ;30: Muzzle flash 1 (Used for Pistol)"
	102, _ ;31: Muzzle flash 2"
	103, _ ;32: Same as 80."
	104, _ ;33: Muzzle flash 4"
	106, _ ;34: Muzzle flash 1a"
	107, _ ;35: Muzzle flash 2a"
	108, _ ;36: Muzzle flash 2b"
	110, _ ;37: Explode 1"
	111, _ ;38: Explode 2"
	116, _ ;39: Smoke Animated"
	120, _ ;40: Flame Thrower"
	121, _ ;41: Return error texture."
	122, _ ;42: Flame Thrower Blue"
	123, _ ;43: Same as 121."
	124, _ ;44: Splash 1"
	125, _ ;45: Splash 2"
	126, _ ;46: Splash 3"
	127, _ ;47: Splash 4"
	128]   ;48: Firewall", "101: Muzzle flash 1 (Used for Pistol)")"


Global Enum _
	$HDR_MD2_ID, _
	$HDR_MD2_VER, _
	$HDR_MD2_SKIN_W, _
	$HDR_MD2_SKIN_H, _
	$HDR_MD2_FR_SIZE, _
	$HDR_MD2_NUM_SKIN, _
	$HDR_MD2_NUM_VERT, _
	$HDR_MD2_NUM_TEX_CORD, _
	$HDR_MD2_NUM_TRIANGLE, _
	$HDR_MD2_NUM_GLCMND, _
	$HDR_MD2_NUM_FRAME, _
	$HDR_MD2_OFF_SKIN, _
	$HDR_MD2_OFF_TEX_CORD, _
	$HDR_MD2_OFF_TRI, _
	$HDR_MD2_OFF_FRAME, _
	$HDR_MD2_OFF_GLCMD, _
	$HDR_MD2_OFF_END

Global Enum _
	$HDR_MDX_ID, _
	$HDR_MDX_VER, _
	$HDR_MDX_SKIN_W, _
	$HDR_MDX_SKIN_H, _
	$HDR_MDX_FR_SIZE, _
	$HDR_MDX_NUM_SKIN, _
	$HDR_MDX_NUM_VERT, _
	$HDR_MDX_NUM_TRI, _
	$HDR_MDX_NUM_GLCMD, _
	$HDR_MDX_NUM_FRAME, _
	$HDR_MDX_NUM_SFX_DEF, _
	$HDR_MDX_NUM_SFX_ENT, _
	$HDR_MDX_NUM_SUBOBJ, _
	$HDR_MDX_OFF_SKIN, _
	$HDR_MDX_OFF_TRI, _
	$HDR_MDX_OFF_FRAME, _
	$HDR_MDX_OFF_GLCMD, _
	$HDR_MDX_OFF_VERT, _
	$HDR_MDX_OFF_SFX_DEF, _
	$HDR_MDX_OFF_SFX_ENT, _
	$HDR_MDX_OFF_BBOXFRAME, _
	$HDR_MDX_OFF_DUMMYEND, _
	$HDR_MDX_OFF_END

Global Enum _
	$HDR_MD3_ID, _
	$HDR_MD3_VER, _
	$HDR_MD3_PATH, _
	$HDR_MD3_FLAGS, _
	$HDR_MD3_NUM_FRAMES, _
	$HDR_MD3_NUM_TAGS, _
	$HDR_MD3_NUM_SURF, _
	$HDR_MD3_NUM_SKIN, _
	$HDR_MD3_OFF_FRAMES, _
	$HDR_MD3_OFF_TAGS, _
	$HDR_MD3_OFF_SURF, _
	$HDR_MD3_OFF_END


Global Enum $HDR_MDL_ID, $HDR_MDL_VER, $HDR_MDL_SKIN_W, $HDR_MDL_SKIN_H, $HDR_MDL_FR_SIZE, _
	$HDR_MDL_SCALE_X, $HDR_MDL_SCALE_Y, $HDR_MDL_SCALE_Z

Global $g_aGameHeaderData[4][23] ;= [ _
;~ 	[], _
;~ 	[], _
;~ 	[], _
;~ 	[] _
;~ ]

Global Enum _
	$OFF_MD2_SKIN, _
	$OFF_MD2_TEXCOORD, _
	$OFF_MD2_TRI, _
	$OFF_MD2_FRAME, _
	$OFF_MD2_GLCMD, _
	$OFF_MD2_END, _
	$COUNT_OFF_MD2
Global Enum _
	$OFF_MDX_SKIN, _
	$OFF_MDX_TRI, _
	$OFF_MDX_FRAME, _
	$OFF_MDX_GLCMD, _
	$OFF_MDX_VERT, _
	$OFF_MDX_SFX_DEF, _
	$OFF_MDX_SFX_ENT, _
	$OFF_MDX_BBOXFRAME, _
	$OFF_MDX_DUMMYEND, _
	$OFF_MDX_END, _
	$COUNT_OFF_MDX

Global $g_aGameHeaderOffSize[4][10] ;= [ _
;~ 	[], _
;~ 	[], _
;~ 	[], _
;~ 	[] _
;~ ]


GUICtrlSetState($in_model_import, $GUI_DROPACCEPTED)
GUICtrlSetState($btn_import, $GUI_DROPACCEPTED)
GUICtrlSetState($Group1, $GUI_DROPACCEPTED)

GUICtrlSetState($in_model_export, $GUI_DROPACCEPTED)
; GUICtrlSetState($btn_export_file, $GUI_DROPACCEPTED)
GUICtrlSetState($Group2, $GUI_DROPACCEPTED)

For $i = 0 To $iMAXSKIN - 1
	GUICtrlSetState($UI_in_skins[$i], $GUI_DROPACCEPTED)
Next

GUISetOnEvent($GUI_EVENT_DROPPED, "fn_dropFile",$KPModelSkins)

_GUICtrlComboBox_SetDroppedWidth($Combo1_SFX_Type, 350)
_GUICtrlComboBox_SetDroppedWidth($Combo3_vertTri, 150)
_GUICtrlComboBox_SetDroppedWidth($Combo2_direction, 150)

#EndRegion


#Region ;==> GUI util
; Startup input filename
if $CmdLine[0] >= 1 Then
	if $CmdLine[1] <> "" Then
		For $i = 1 To $COUNT_MOD -1
			If StringInStr($CmdLine[1], $g_aModelData[$i][1]) Then; todo check trailing chars ;".mdx"
				fn_ImportModel($CmdLine[1])
				ExitLoop
			EndIf
		Next
	EndIf
EndIf

; set the folder for open/save dialog boxes
Func fn_dropFileSkins($filePath)
	$fileOpenDialogPath = $filePath
	;ConsoleWrite("!set openFile Dialog drop skin= "&$fileOpenDialogPath&@CRLF)
	return fn_TrimFilePath($filePath)
EndFunc


; drop files onto GUI
Func fn_dropFile()
	Switch @GUI_DropId
		Case $Group1 ;$in_model_import, , $btn_import
			fn_ImportModel(@GUI_DragFile)	;GUICtrlSetData($in_model_import,@GUI_DragFile)
		Case $Group2 ;$in_model_export, ,$btn_export_file
			$exportFileName = @GUI_DragFile
			GUICtrlSetData($in_model_export, @GUI_DragFile)
		Case Else
			For $i = 0 To $iMAXSKIN - 1
				if @GUI_DropId = $UI_in_skins[$i] Then
					GUICtrlSetData($UI_in_skins[$i], fn_dropFileSkins(@GUI_DragFile))
					ExitLoop
				EndIf
			Next
	EndSwitch
EndFunc

Func _IsChecked($idControlID)
	Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc

Func KPModelSkinsClose()
	fn_ResetSFX_arrays()
	fn_ResetSFX_DATA()
	GUIDelete($KPModelSkins)
	GUIDelete($Form1_msgbox)
	GUIDelete($DMFLAGS)
	Exit
EndFunc

Func fn_Swap4Bytes($4bytes)
	local $a1 = StringSplit($4bytes,"", 1)
	local $sResult=""
	If $a1[0] = 8 Then
		$sResult =$a1[7]&$a1[8] & $a1[5]&$a1[6] & $a1[3]&$a1[4] & $a1[1]&$a1[2]
	ElseIf $a1[0] = 4 Then
		$sResult = $a1[3]&$a1[4] & $a1[1]&$a1[2]
	;ElseIf $a1[0] = 2 Then
	;	$sResult = $a1[2]&$a1[1]
	Else
		$sResult = $4bytes
		ConsoleWrite ("!!ERROR: Swap4Bytes= "&$4bytes&@CRLF)
	EndIf
	;ConsoleWrite ("in= "&$4bytes & "out= " &$sResult&@CRLF)

	Return $sResult
EndFunc ;==> end fn_Swap4Bytes

Func fn_StripNullFromString($sString)
	Local $iIdx = StringInStr($sString, Chr(0))
	If $iIdx Then
		Return  StringLeft($sString, $iIdx-1)
	EndIf

	Return $sString ;unchanged
EndFunc

Func fn_SetCurrentFolder($filePath)
	Local $iIdx = StringInStr($filePath, "\",1, -1)
	If $iIdx Then
		$fileOpenDialogPath = StringLeft($filePath, $iIdx)
		ConsoleWrite("!set openFile Dialog= "&$fileOpenDialogPath&@CRLF)
	EndIf
EndFunc

Func btn_importClick()
	Local $fileName, $sTmp = ""
	For $i = 1 To $COUNT_MOD -1
		$sTmp &= StringFormat("*%s;", $g_aModelData[$i][1])
	Next
	$sTmp = StringFormat("Models (%s)", $sTmp)

	$fileName = FileOpenDialog("Models", $fileOpenDialogPath, $sTmp,1 ,"", $KPModelSkins) ;"Models (*.md2;*.mdx)"
	If not @error Then
		fn_ImportModel($fileName)
	EndIf
EndFunc



Func fn_ImportModel($fileName)
	local $numSkins, $start, $end, $hdr_version
	$importFileName =""
	$exportFileName =""

	if FileExists($fileName) Then
		GUICtrlSetData($in_model_import, $fileName)
		GUICtrlSetData($in_model_export, $fileName)
		$importFileName = $fileName
		$exportFileName = $fileName
		fn_SetCurrentFolder($fileName); set recent folder
		GUICtrlSetState($Checkbox2,$GUI_UNCHECKED);set SFX buton to default OFF

		Local $bFile = FileOpen($fileName , 16) ;$FO_UTF16_LE ) ;binary mode
		$hdr_magic   = hex(FileRead($bFile, 4))
		$hdr_version = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8)))
		ConsoleWrite("--> header_magic = " & _HexToString($hdr_magic)&@CRLF)
		ConsoleWrite("--> header_magic = " & $hdr_magic&@CRLF)
		ConsoleWrite("--> $hdr_version = " & $hdr_version&@CRLF)

		if $hdr_magic == "49445058" And $hdr_version = 4 Then ;IDPX
			$modelType = $MOD_MDX
			$g_aGameHeaderData[$MOD_MDX][$HDR_MDX_ID]  = $hdr_magic
			$g_aGameHeaderData[$MOD_MDX][$HDR_MDX_VER] = $hdr_version
			For $i = $HDR_MDX_SKIN_W To $HDR_MDX_OFF_END
				$g_aGameHeaderData[$MOD_MDX][$i] = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8)))
			Next
			GUICtrlSetData($in_size_w, $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_SKIN_W]) ;$hdr_skinWidth);set GUI skin size
			GUICtrlSetData($in_size_h, $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_SKIN_H]) ;$hdr_skinHeight);set GUI skin size
			$numSkins = $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_NUM_SKIN]

			;calc offset sizes
			$g_aGameHeaderOffSize[$MOD_MDX][$OFF_MDX_SKIN] = 23*4 ;begin at header end?
			For $i = 1 To $OFF_MDX_END
				$start = $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_OFF_SKIN +$i -1]
				$end   = $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_OFF_SKIN +$i +0]
				$g_aGameHeaderOffSize[$MOD_MDX][$i] = $end - $start ;calculate chunk size
				ConsoleWrite("start:"&$start &" end:"&$end &"    total:"&$end - $start&@CRLF)
			Next
		ElseIf $hdr_magic == "49445032" And $hdr_version = 8 Then ;IDP2
			$modelType = $MOD_MD2
			$g_aGameHeaderData[$MOD_MD2][$HDR_MD2_ID]  = $hdr_magic
			$g_aGameHeaderData[$MOD_MD2][$HDR_MD2_VER] = $hdr_version
			For $i = $HDR_MD2_SKIN_W To $HDR_MD2_OFF_END
				$g_aGameHeaderData[$MOD_MD2][$i] = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8)))
			Next
			GUICtrlSetData($in_size_w, $g_aGameHeaderData[$MOD_MD2][$HDR_MD2_SKIN_W]) ;set GUI skin size
			GUICtrlSetData($in_size_h, $g_aGameHeaderData[$MOD_MD2][$HDR_MD2_SKIN_H]) ;set GUI skin size
			$numSkins = $g_aGameHeaderData[$MOD_MD2][$HDR_MD2_NUM_SKIN]

			;calc offset sizes
			$g_aGameHeaderOffSize[$MOD_MD2][$OFF_MD2_SKIN] = 17*4 ;begin at header end?
			For $i = 1 To $OFF_MD2_END
				$start = $g_aGameHeaderData[$MOD_MD2][$HDR_MD2_OFF_SKIN +$i -1]
				$end   = $g_aGameHeaderData[$MOD_MD2][$HDR_MD2_OFF_SKIN +$i +0]
				$g_aGameHeaderOffSize[$MOD_MD2][$i] = $end - $start ;calculate size
			Next
			$g_aGameHeaderOffSize[$MOD_MD2][$OFF_MD2_END] = 0

		;;;;;;;;;;;; MD3 ;;;;;;;;;;;;;;;;;;
		ElseIf $hdr_magic == "49445033" And $hdr_version = 15 Then ;IDP3
			ConsoleWrite("found MD3" &@CRLF)
			$modelType = $MOD_MD3

			;~ $hdr_MD3_path =     _HexToString(FileRead($bFile, 64)) ;todo: file path
			$g_aGameHeaderData[$MOD_MD3][$HDR_MD3_PATH] = _HexToString(FileRead($bFile, 64)) ;todo: file path
			For $i = $HDR_MD3_FLAGS To $HDR_MD3_OFF_END
				$g_aGameHeaderData[$MOD_MD3][$i] = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8)))
			Next
			$numSkins = $g_aGameHeaderData[$MOD_MD3][$HDR_MD3_NUM_SKIN]

		;ElseIf
			;todo q1 model
		Else
			$modelType = 0
		EndIf

		If ($modelType = 0) Or ($numSkins >= $iMAXSKIN) Then ;	(($modelType = $MOD_MD2) And ($hdr_numTexCoords > $iMAXTEXCORDS)) Then
			$modelType = 0
			FileClose ( $bFile )
			fn_MSG_box("File Invalid.")
			Return
		EndIf

		;clear old skins
		fn_ResetSkinInput()

		;clear sprie data
		fn_ResetSFX_arrays()
		fn_ResetSFX_DATA()
		fn_Reset_SpriteTab_Data()
		fn_Reset_Scale()


		;MD3 read skins/shaders
		if $modelType == $MOD_MD3 Then
			;read md3 surface
			Local $iCurOffset = $g_aGameHeaderData[$MOD_MD3][$HDR_MD3_OFF_SURF]
			FileSetPos($bFile, $iCurOffset, $FILE_BEGIN)
			;id, name, flag, numFr, numShd, numVer, numTri, ofsTri, ofsShd, ofsST, ofsXYZ, ofsNor, ofsEnd
			$g_iMD3_tex = 0 ;texture index
			ConsoleWrite("current offs=" & $iCurOffset&@CRLF)

			for $i1 = 1 to $g_aGameHeaderData[$MOD_MD3][$HDR_MD3_NUM_SURF] ;num surf
				FileSetPos($bFile, 4+64+4+4, $FILE_CURRENT) ; seek to NUM_SHADERS
				Local $iNumShad = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8))) ;+76

				FileSetPos($bFile, 12, $FILE_CURRENT) ;seek to OFS_SHADERS
				Local $iOffsShad = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8))) ;+12

				FileSetPos($bFile, 8, $FILE_CURRENT) ;seek to OFS_END
				Local $iOffsEnd = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8))) ;+4
				FileSetPos($bFile,$iCurOffset + $iOffsShad, $FILE_BEGIN)

				for $i2 = 0 to $iNumShad -1 ;num surf
					If $g_iMD3_tex < $iMAXSKIN Then ;max skin count
						$g_aMD3_surf[$g_iMD3_tex][0] = FileGetPos($bFile) ; $iCurOffset + $iOffsShad +( ($i2-1)*68) ;save file offset
						$g_aMD3_surf[$g_iMD3_tex][1] = fn_StripNullFromString(_HexToString(FileRead($bFile, 64)))
						$g_iMD3_tex += 1 ;write skins	1-based
						FileSetPos($bFile, 4, $FILE_CURRENT)
					EndIf
				Next
				;move to next object
				$iCurOffset += $iOffsEnd
				ConsoleWrite("current offs=" & $iCurOffset&@CRLF)
				FileSetPos($bFile, $iCurOffset, $FILE_BEGIN) ; seek to SURFACE_START
			Next

			;copt to $skin array
			for $i1 = 0 to $g_iMD3_tex -1
				$skin[$i1] = $g_aMD3_surf[$i1][1]
			Next

		ElseIf $modelType == $MOD_MD2 Or $modelType == $MOD_MDX Then; md2/mdx
			;read skins
			ConsoleWrite("header_numSkins = " & string($numSkins) & @CRLF)
			if ($modelType = $MOD_MDX) Then
				FileSetPos($bFile, $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_OFF_SKIN], $FILE_BEGIN)
			Else
				FileSetPos($bFile, $g_aGameHeaderData[$MOD_MD2][$HDR_MD2_OFF_SKIN], $FILE_BEGIN)
			EndIf
			for $i1 = 0 to $numSkins -1
				Local $tmpSkin = _HexToString(FileRead($bFile, 64)) ;BinaryToString
				If $i1 < $iMAXSKIN Then ;max skin count
					$skin[$i1] = fn_StripNullFromString($tmpSkin) ;remove anything after null
					ConsoleWrite('skin '& $i1&'= '&$skin[$i1]&@CRLF)
				EndIf
			Next;==> end skins

			;md2 read text cords
			if ($modelType = $MOD_MD2) Then
				FileSetPos($bFile, $g_aGameHeaderData[$MOD_MD2][$HDR_MD2_OFF_TEX_CORD], $FILE_BEGIN) ;$hdr_offsetTexCoords
				For $i1 = 0 To $g_aGameHeaderData[$MOD_MD2][$HDR_MD2_NUM_TEX_CORD] - 1 ;$hdr_numTexCoords
					$hdr_TexCoords[$i1][0] = _WinAPI_SwapWord(dec(hex(FileRead($bFile, 2), 4))) / $g_aGameHeaderData[$MOD_MD2][$HDR_MD2_SKIN_W] ;$hdr_skinWidth;
					$hdr_TexCoords[$i1][1] = _WinAPI_SwapWord(dec(hex(FileRead($bFile, 2), 4))) / $g_aGameHeaderData[$MOD_MD2][$HDR_MD2_SKIN_H] ;$hdr_skinHeight
				Next
			EndIf ;==> end text cords

			;read triangle data +frame data
			if ($modelType = $MOD_MD2) Then
				;tri data
				FileSetPos($bFile, $g_aGameHeaderData[$MOD_MD2][$HDR_MD2_OFF_TRI], $FILE_BEGIN)
				$model_DATA_tri = hex(FileRead($bFile, $g_aGameHeaderOffSize[$MOD_MD2][$OFF_MD2_TRI]))

				;frame data
				FileSetPos($bFile, $g_aGameHeaderData[$MOD_MD2][$HDR_MD2_OFF_TRI], $FILE_BEGIN)
				For $iI = 0 to 5;read float
					$model_DATA_scale[$iI] = _WinAPI_DWordToFloat(_WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8))))
				Next
				$model_DATA_frame = hex(FileRead($bFile, $g_aGameHeaderOffSize[$MOD_MD2][$OFF_MD2_FRAME] -(4*6)))

			Else ;mdx
				;tri data
				FileSetPos($bFile, $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_OFF_TRI], $FILE_BEGIN)
				$model_DATA_tri = hex(FileRead($bFile, $g_aGameHeaderOffSize[$MOD_MDX][$OFF_MDX_TRI]))

				;frame data
				FileSetPos($bFile, $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_OFF_TRI], $FILE_BEGIN)
				For $iI = 0 to 5;read float
					$model_DATA_scale[$iI] = _WinAPI_DWordToFloat(_WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8))))
				Next
				$model_DATA_frame = hex(FileRead($bFile, $g_aGameHeaderOffSize[$MOD_MDX][$OFF_MDX_FRAME] - (4*6))) ;remove scale? TODO CHECK THIS
			EndIf


			;mdx read sfx
			if ($modelType = $MOD_MDX) Then
				;FileSetPos($bFile, $hdr_offsetTriangles, $FILE_BEGIN)
				;$model_DATA_preSFX = hex(FileRead($bFile, $hdr_offsetSfxDefines - $hdr_offsetTriangles)) ;todo split?
				Local $numSfxDef = $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_NUM_SFX_DEF]
				Local $numSfxEnt = $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_NUM_SFX_ENT]
				if ($numSfxDef >= 1) Then
					;index = fn_Get_SpriteIndex_User()
					Local $ofs1 = 4*17*0 ; todo user selected sprite
					FileSetPos($bFile, $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_OFF_SFX_DEF]+$ofs1, $FILE_BEGIN);set to offset
					For $iI = 0 to 3;read integer
						$aSFX_define[$iI] = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8)))
					Next
					;ConsoleWrite(">sfx def flags= "&$aSFX_define[1]&@CRLF)
					$aSFX_define[4] = Round(_WinAPI_IntToFloat( _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8)))), 2)
					$aSFX_define[5] = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8)))

					For $iI = 6 to 16 ;read float
						$aSFX_define[$iI] = Round(_WinAPI_IntToFloat(_WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8)))), 2)
					Next

					; cant display 2+ defines. just store them
					if ($numSfxDef  > 1) Then
						for $iI = 2 To $numSfxDef
							FileSetPos($bFile, $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_OFF_SFX_DEF] + (($iI-1)* $iSFX_DEF_SIZE), FileSetPos);set to offset
							$model_DATA_SFXDef[$iI] = hex(FileRead($bFile, $iSFX_DEF_SIZE))
						Next
					EndIf
				EndIf
				Local $numSfxDef = $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_NUM_SFX_DEF]
				Local $numSfxEnt = $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_NUM_SFX_ENT]
				if ($numSfxEnt >= 1) Then
					FileSetPos($bFile, $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_OFF_SFX_ENT], 0);set to offset ;$hdr_offsetSfxEntries
					$aSFX_add[0] = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8))); vertex index (0-based)
					$aSFX_add[1] = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8))); int define noumber
					$aSFX_add[2] = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8))); int vertex/tri (0/1)
					$aSFX_add[3] = hex(FileRead($bFile, 64))

					ConsoleWrite("anim frames bin="&$aSFX_add[3]&@CRLF)

					if ($numSfxEnt > 1) Then
						for $iI = 2 To $numSfxEnt
							ConsoleWrite("!sfxEntry" &@CRLF)
							FileSetPos($bFile, $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_OFF_SFX_ENT] + (($iI-1)* $iSFX_ENTRY_SIZE),0);set to offset ;$hdr_offsetSfxEntries
							$model_DATA_SFXEntry[$iI] = hex(FileRead($bFile, $iSFX_ENTRY_SIZE))
						Next
					EndIf
				EndIf

				if ($numSfxEnt >= 1) And ($numSfxDef >= 1) Then
					GUICtrlSetState($Checkbox2, $GUI_CHECKED)
				EndIf

				FileSetPos($bFile, $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_OFF_BBOXFRAME], $FILE_BEGIN)
				$model_DATA_END = hex(FileRead($bFile, $g_aGameHeaderOffSize[$MOD_MDX][$OFF_MDX_BBOXFRAME]))
			Else;==>end mdx
				;md2
				FileSetPos($bFile, $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_OFF_GLCMD], $FILE_BEGIN)
				$model_DATA_END = hex(FileRead($bFile, $g_aGameHeaderOffSize[$MOD_MDX][$OFF_MDX_GLCMD]))
			EndIf;==>end md2
		EndIf
		FileClose($bFile) ;close file


		fn_FillSkinInput()
		fn_Fill_Scale();todo: scale
		;=======

		if ($modelType = $MOD_MDX) Then
			Local $numSfxDef = $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_NUM_SFX_DEF]
			Local $numSfxEnt = $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_NUM_SFX_ENT]
			if ($numSfxEnt >= 1) Then
				Local $tmp2 = $aSFX_add[3]
				local $fNum =0
				;64 chars
				For $iI = 0 to 63
					Local $sTmp = Dec(StringLeft($tmp2, 2))
					;ConsoleWrite("bits=" & $sTmp &@CRLF)
					For $j = 0 To 7
						if BitAND($sTmp, BitShift(128, $j)) Then;read bits backwards
							$aFrames[$fNum+$j] = 1
						EndIf
					Next
					$tmp2 = StringTrimLeft($tmp2, 2)
					$fNum+=8
				Next
			EndIf

			if ($numSfxEnt >= 1) And  ($numSfxDef >= 1) Then
				fn_Fill_SpriteTab()
				if ($numSfxEnt > 1) Or  ($numSfxDef > 1) Then
					fn_MSG_box(	"Multiple sprite defined.", _
								"Using first index.", 1)
				EndIf
			EndIf

			;check for incorrect offsets
			If  $g_aGameHeaderOffSize[$MOD_MDX][$OFF_MDX_TRI] < 0  _
			Or	$g_aGameHeaderOffSize[$MOD_MDX][$OFF_MDX_FRAME] < 0  _
			Or	$g_aGameHeaderOffSize[$MOD_MDX][$OFF_MDX_GLCMD] < 0  _
			Or	$g_aGameHeaderOffSize[$MOD_MDX][$OFF_MDX_VERT] < 0 _
			Or	$g_aGameHeaderOffSize[$MOD_MDX][$OFF_MDX_BBOXFRAME] < 0 _
			Or	$g_aGameHeaderOffSize[$MOD_MDX][$OFF_MDX_DUMMYEND] < 0 Then
				fn_MSG_box("Input file offset issue.", "This may effect output.")
			EndIf
		;==>end MDX
		Elseif ($modelType = $MOD_MD2) Then
			If  $g_aGameHeaderOffSize[$MOD_MD2][$OFF_MD2_TEXCOORD] < 0  _
			Or	$g_aGameHeaderOffSize[$MOD_MD2][$OFF_MD2_TRI] < 0  _
			Or	$g_aGameHeaderOffSize[$MOD_MD2][$OFF_MD2_FRAME] < 0  _
			Or	$g_aGameHeaderOffSize[$MOD_MD2][$OFF_MD2_GLCMD] < 0 Then
				fn_MSG_box("Input file offset issue.", "This may effect output.", 1)
			EndIf
		;==>end MD2
		EndIf
	EndIf;==>end FileExists

EndFunc ;==>end fn_ImportModel


;set output file name
Func btn_export_fileClick()
	Local $fileName = FileSaveDialog($g_aModelData[$modelType][0], $fileOpenDialogPath, _ ;"Kingpin Models (*.mdx)"
		StringFormat("%ss (*%s)", $g_aModelData[$modelType][0], $g_aModelData[$modelType][1]) ,2 ,"", $KPModelSkins)

	If not @error Then
		$exportFileName = $fileName
		fn_SetCurrentFolder($fileName)
		GUICtrlSetData($in_model_export, $fileName)
	EndIf
EndFunc

Func Export_MD3()
	Local $hFile, $nBytes, $tBuffer, $iLen, $skinHex
	if StringCompare($importFileName, $exportFileName) Then
		if Not FileCopy($importFileName, $exportFileName, 1) Then
			fn_MSG_box("Can't write output file.", "", 1)
			Return
		EndIf
	EndIf

	$tBuffer = DllStructCreate("byte[64]")
	$hFile = _WinAPI_CreateFile($exportFileName, 2, 4)
	if not $hFile Then
		fn_MSG_box("Can't open output file.")
		Return
	EndIf

	fn_ProcessInputSkins() ; get skin from input boxes

	;overwrite file
	for $i1 = 0 to $g_iMD3_tex -1
		$iLen = StringLen($skin[$i1])
		$skinHex = _StringToHex($skin[$i1])
		;finish of with null
		For $j1 = $iLen+1 To 64
			$skinHex &= "00"
		Next
		;ConsoleWrite("$skinHex="&$skin[$i1]&@CRLF)
		DllStructSetData($tBuffer, 1, "0x"&$skinHex)
		_WinAPI_SetFilePointer($hFile, $g_aMD3_surf[$i1][0], $FILE_BEGIN)
		_WinAPI_WriteFile($hFile, $tBuffer, 64, $nBytes)
	Next
	_WinAPI_CloseHandle($hFile)

EndFunc

;click GO
Func btn_export_GOClick()
	Local $offssetToAdd = 0, $offssetToAdd_SFX1 =0, $offssetToAdd_SFX2 =0
	Local $iLen, $skinHex ="", $curOff = 0
	local $aheader[23]
	Local $bFile

	If $modelType = 0 Then
		fn_MSG_box("No valid model loaded.")
		Return
	EndIf

	; backup file. dont overwrite if it exists
	If _IsChecked($Checkbox1) Then
		Local $isOK = FileCopy($importFileName, string($importFileName&".backup") ,0)
		if Not $isOK And Not FileExists(string($importFileName&".backup")) Then
			;MsgBox(0,"ERROR:", "Cant write backup file",0, $KPModelSkins)
			fn_MSG_box("Can't write backup file.", "", 1)
		EndIf
	EndIf

	if $modelType = $MOD_MD3 Then
		Export_MD3()
		Return
	EndIf

	$bFile = FileOpen ( $exportFileName, $FO_OVERWRITE+$FO_CREATEPATH+$FO_BINARY)
	if $bFile = -1 Then
		fn_MSG_box("Can't open output file.")
		Return
	EndIf

	Local $skinCount = fn_ProcessInputSkins()
	local $skinWidth = GUICtrlRead($in_size_w)
	local $skinHeight= GUICtrlRead($in_size_h)

	If ($modelType = $MOD_MDX) Then
		$g_aGameHeaderData[$MOD_MDX][$HDR_MDX_NUM_SKIN] = $skinCount
		$g_aGameHeaderData[$MOD_MDX][$HDR_MDX_SKIN_W]   = $skinWidth
		$g_aGameHeaderData[$MOD_MDX][$HDR_MDX_SKIN_H]   = $skinHeight

		;write header data
		FileWrite($bFile, "0x"&$g_aGameHeaderData[$MOD_MDX][$HDR_MDX_ID]);IPDX
		for $iI = $HDR_MDX_VER to $HDR_MDX_NUM_SUBOBJ
			ConsoleWrite('>data:'&$g_aGameHeaderData[$MOD_MDX][$iI]&@CRLF)
			FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($g_aGameHeaderData[$MOD_MDX][$iI], 8)))
		Next

		;fix header offset size. compensate for adding a new SFX
		Local $numSfxDef = $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_NUM_SFX_DEF]
		Local $numSfxEnt = $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_NUM_SFX_ENT]
		if _IsChecked($Checkbox2) Then
			if ($numSfxDef = 0) Then $numSfxDef = 1
			if ($numSfxEnt = 0) Then $numSfxEnt = 1
		EndIf
		ConsoleWrite("$numSfxDef"&$numSfxDef&" $numSfxEnt"&$numSfxEnt&@CRLF)
		$g_aGameHeaderOffSize[$MOD_MDX][$OFF_MDX_SFX_DEF +1] = $iSFX_DEF_SIZE*$numSfxDef ;17*int (sdk=68)
		$g_aGameHeaderOffSize[$MOD_MDX][$OFF_MDX_SFX_ENT +1] = $iSFX_ENTRY_SIZE*$numSfxEnt ;3*int + 64bytes (sdk=140)
		$g_aGameHeaderOffSize[$MOD_MDX][$OFF_MDX_SKIN    +1] = 64*$skinCount
		;write header offsets
		For $i = 0 to $OFF_MDX_END
			$curOff += $g_aGameHeaderOffSize[$MOD_MDX][$i]
			ConsoleWrite('-data:'&$g_aGameHeaderOffSize[$MOD_MDX][$i]& " off:"&$curOff&@CRLF)
			FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($curOff, 8)))
		Next
		ConsoleWrite("--> File MDX"&@CRLF)
	ElseIf ($modelType = $MOD_MD2) Then
		$g_aGameHeaderData[$MOD_MD2][$HDR_MD2_NUM_SKIN] = $skinCount
		$g_aGameHeaderData[$MOD_MD2][$HDR_MD2_SKIN_W]   = $skinWidth
		$g_aGameHeaderData[$MOD_MD2][$HDR_MD2_SKIN_H]   = $skinHeight

		;write data
		FileWrite($bFile, "0x"&$g_aGameHeaderData[$MOD_MD2][$HDR_MD2_ID]) ;IPD2
		for $iI = $HDR_MD2_VER to $HDR_MD2_NUM_FRAME
			FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($g_aGameHeaderData[$MOD_MD2][$iI], 8)))
		Next

		$g_aGameHeaderOffSize[$MOD_MD2][$OFF_MD2_SKIN+1] = 64*$skinCount
		For $i = 0 to $OFF_MD2_END ;$OFF_MD2_SKIN To
			$curOff += $g_aGameHeaderOffSize[$MOD_MD2][$i]
			FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($curOff, 8)))
		Next
		ConsoleWrite("--> File MD2"&@CRLF)
	EndIf

	;build skin string
	For $i1 = 0 To $skinCount -1
		$iLen = StringLen($skin[$i1])
		$skinHex &= _StringToHex($skin[$i1])
		;finish of with null
		For $j1 = $iLen+1 To 64
			$skinHex &= "00"
		Next
	Next

	;write skins
	if $skinCount > 0 Then FileWrite($bFile, "0x"&$skinHex)
	$skinHex = ""

	;md2 write textcords
	if ($modelType = $MOD_MD2) Then
		For $i1 = 0 To $g_aGameHeaderData[$MOD_MD2][$HDR_MD2_NUM_TEX_CORD] -1 ; ($hdr_numTexCoords-1)
			FileWrite ( $bFile, "0x"&fn_Swap4Bytes(hex(int($hdr_TexCoords[$i1][0]*$skinWidth),4)))
			FileWrite ( $bFile, "0x"&fn_Swap4Bytes(hex(Int($hdr_TexCoords[$i1][1]*$skinHeight),4)))
		Next
	EndIf

	;write triangle data
	FileWrite ( $bFile, "0x"&$model_DATA_tri)

	;write frame scale
	fn_Update_Scale()
	For $iI = 0 to 5 ;float
		ConsoleWrite("!0x"&fn_Swap4Bytes(hex(_WinAPI_FloatToInt($model_DATA_scale[$iI]), 8))& @CRLF)
		FileWrite ( $bFile, "0x"&fn_Swap4Bytes(hex(_WinAPI_FloatToInt($model_DATA_scale[$iI]), 8)))
	Next

	;write frame data
	FileWrite ( $bFile, "0x"&$model_DATA_frame)

	;mdx write SFX
	If ($modelType = $MOD_MDX) Then
		Local $numSfxDef = $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_NUM_SFX_DEF]
		Local $numSfxEnt = $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_NUM_SFX_ENT]
		;FileWrite ( $bFile, "0x"&$model_DATA_preSFX)

		;setup local arrays with gui data
		fn_Get_SpriteTab_Data()

		if ($numSfxDef >= 1) Then
			For $iI = 0 to 3;integer
				FileWrite ( $bFile, "0x"&fn_Swap4Bytes(hex($aSFX_define[$iI], 8)))
			Next
			FileWrite ( $bFile, "0x"&fn_Swap4Bytes(hex(_WinAPI_FloatToInt($aSFX_define[4]), 8)))
			FileWrite ( $bFile, "0x"&fn_Swap4Bytes(hex($aSFX_define[5], 8)))
			For $iI = 6 to 16;float
				FileWrite ( $bFile, "0x"&fn_Swap4Bytes(hex(_WinAPI_FloatToInt($aSFX_define[$iI]), 8)))
			Next
			;write extra entries
			if ($numSfxDef > 1) Then
				for $iI = 2 To $numSfxDef
					ConsoleWrite("+sfxDef" &@CRLF)
					FileWrite ( $bFile, "0x"&$model_DATA_SFXDef[$iI])
				Next
			EndIf
		EndIf ;==> end sfx defines

		if ($numSfxEnt >= 1) Then
			FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($aSFX_add[0], 8))) ; vertex #
			FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($aSFX_add[1], 8))) ; sfx define index
			FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($aSFX_add[2], 8))) ; 0=vertex
			local $fNum =0
			For $iI = 0 to 63 ;frame to show sfx. 64*8
				Local $sTmp = 0
				;write bits backwards
				For $j = 0 To 7
					if ($aFrames[$fNum+$j] = 1) Then
						$sTmp = BitOR($sTmp, BitShift(128, $j))
					EndIf
				Next
				$fNum+=8
				FileWrite ( $bFile, "0x"&hex($sTmp,2))
			Next
			;write extra entries
			if ($numSfxEnt > 1) Then
				for $iI = 2 To $numSfxEnt
					ConsoleWrite("+sfxEntry" &@CRLF)
					FileWrite ( $bFile, "0x"&$model_DATA_SFXEntry[$iI])
				Next
			EndIf

			GUICtrlSetState($Checkbox2,$GUI_CHECKED)
		EndIf ;==> end sfx entries
	EndIf ;==> end mdx

	;write end data
	FileWrite ( $bFile, "0x"&$model_DATA_END)
	FileClose($bFile)
	ConsoleWrite (	"+File Saved"&@CRLF)
	fn_MSG_box("Model Saved.")
EndFunc

#EndRegion

#Region ;==> GUI. MESSAGE BOX
Func fn_MSG_box($sLine1, $sLine2 = "", $pauseScript = 0)
	Local $aPos = WinGetPos ( $KPModelSkins )
	WinMove($Form1_msgbox, "", $aPos[0]+200, $aPos[1]+200)
	GUICtrlSetData($Label1_msgbox, $sLine1)
	GUICtrlSetData($Label2_msgbox, $sLine2)
	GUISetState(@SW_DISABLE,$KPModelSkins)
	GUISetState(@SW_SHOW,$Form1_msgbox)

	if ($pauseScript = 1) Then
		$isActive_msgBox = 1
		Opt("GUIOnEventMode", 0)
		While ($isActive_msgBox = 1)
			 Switch (GUIGetMsg())
				Case $GUI_EVENT_CLOSE
					Form1_msgboxClose()
				Case $Button1_msgbox
					Form1_msgboxClose()
			 EndSwitch
			 Sleep(20)
		WEnd
		Opt("GUIOnEventMode", 1)
	EndIf
EndFunc

Func Form1_msgboxClose()
	GUISetState(@SW_HIDE, $Form1_msgbox)
	GUISetState(@SW_ENABLE, $KPModelSkins )
	GUISetState(@SW_RESTORE, $KPModelSkins)
	$isActive_msgBox = 0
EndFunc
#EndRegion

#Region ;==> SKIN CHOOSER BUTTONS
Func SetSkin($hw)
	GUICtrlSetData($hw, fn_OpenFile_GetSkinName(GUICtrlRead($hw)))
EndFunc


Func btn_skin_1Click()
	SetSkin($UI_in_skins[0])
EndFunc
Func btn_skin_2Click()
	SetSkin($UI_in_skins[1])
EndFunc
Func btn_skin_3Click()
	SetSkin($UI_in_skins[2])
EndFunc
Func btn_skin_4Click()
	SetSkin($UI_in_skins[3])
EndFunc
Func btn_skin_5Click()
	SetSkin($UI_in_skins[4])
EndFunc
Func btn_skin_6Click()
	SetSkin($UI_in_skins[5])
EndFunc
Func btn_skin_7Click()
	SetSkin($UI_in_skins[6])
EndFunc
Func btn_skin_8Click()
	SetSkin($UI_in_skins[7])
EndFunc
Func btn_skin_9Click()
	SetSkin($UI_in_skins[8])
EndFunc
Func btn_skin_10Click()
	SetSkin($UI_in_skins[9])
EndFunc
Func btn_skin_11Click()
	SetSkin($UI_in_skins[10])
EndFunc
Func btn_skin_12Click()
	SetSkin($UI_in_skins[11])
EndFunc
Func btn_skin_13Click()
	SetSkin($UI_in_skins[12])
EndFunc
Func btn_skin_14Click()
	SetSkin($UI_in_skins[13])
EndFunc
Func btn_skin_15Click()
	SetSkin($UI_in_skins[14])
EndFunc
Func btn_skin_16Click()
	SetSkin($UI_in_skins[15])
EndFunc
Func btn_skin_17Click()
	SetSkin($UI_in_skins[16])
EndFunc
Func btn_skin_18Click()
	SetSkin($UI_in_skins[17])
EndFunc
Func btn_skin_19Click()
	SetSkin($UI_in_skins[18])
EndFunc
Func btn_skin_20Click()
	SetSkin($UI_in_skins[19])
EndFunc
Func btn_skin_21Click()
	SetSkin($UI_in_skins[20])
EndFunc
Func btn_skin_22Click()
	SetSkin($UI_in_skins[21])
EndFunc
Func btn_skin_23Click()
	SetSkin($UI_in_skins[22])
EndFunc
Func btn_skin_24Click()
	SetSkin($UI_in_skins[23])
EndFunc
Func btn_skin_25Click()
	SetSkin($UI_in_skins[24])
EndFunc
Func btn_skin_26Click()
	SetSkin($UI_in_skins[25])
EndFunc
Func btn_skin_27Click()
	SetSkin($UI_in_skins[26])
EndFunc
Func btn_skin_28Click()
	SetSkin($UI_in_skins[27])
EndFunc
Func btn_skin_29Click()
	SetSkin($UI_in_skins[28])
EndFunc
Func btn_skin_30Click()
	SetSkin($UI_in_skins[29])
EndFunc
Func btn_skin_31Click()
	SetSkin($UI_in_skins[30])
EndFunc
Func btn_skin_32Click()
	SetSkin($UI_in_skins[31])
EndFunc

#EndRegion

#Region ;==> SKIN TAB
;buttons

Func fn_TrimFilePath($fileTempName)
	Local $iIdx = StringInStr($fileTempName, "models\")
	if  $iIdx Then
		$fileTempName = StringMid($fileTempName, $iIdx)
	Else
		$iIdx = StringInStr($fileTempName, "players\")
		if  $iIdx Then
			$fileTempName = StringMid($fileTempName, $iIdx)
		Else
			$iIdx = StringInStr($fileTempName, "textures\")
			if  $iIdx Then
				$fileTempName = StringMid($fileTempName, $iIdx)
			Else
				$iIdx = StringInStr($fileTempName, "kingpin\")
				if  $iIdx Then
					$fileTempName = StringMid($fileTempName, $iIdx+8)
					$iIdx = StringInStr($fileTempName, "\")
					$fileTempName = StringMid($fileTempName, $iIdx+1)
				Else
					$iIdx = StringInStr($fileTempName, "quake2\")
					if  $iIdx Then
						$fileTempName = StringMid($fileTempName, $iIdx+8)
						$iIdx = StringInStr($fileTempName, "\")
						$fileTempName = StringMid($fileTempName, $iIdx+1)
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf

	Return StringReplace($fileTempName, "\", "/")

EndFunc

Func fn_FillSkinInput()
	For $i = 0 To $iMAXSKIN - 1
		GUICtrlSetData($UI_in_skins[$i], $skin[$i])
	Next
EndFunc

Func fn_OpenFile_GetSkinName($origSkin)
	Local $fileTempName = FileOpenDialog("Skin", $fileOpenDialogPath, "Kingpin Textures(*.tga;*.pcx)|All Files (*.*)",1,"",$KPModelSkins)

	if not @error Then
		fn_SetCurrentFolder($fileTempName)
		Return fn_TrimFilePath($fileTempName)
	EndIf

	;error getting file. return orig string
	Return $origSkin
EndFunc

Func fn_ProcessInputSkins()
	Local $iCount = 0, $sTmp
	For $i = 0 to $iMAXSKIN - 1
		$sTmp = GUICtrlRead($UI_in_skins[$i])
		If $sTmp <> "" Then
			$skin[$iCount] = StringMid($sTmp, 1, 64)
			$iCount += 1
		EndIf
	Next
	Return $iCount
EndFunc

Func fn_ResetSkinInput()
	for $i = 0 to $iMAXSKIN -1
		$skin[$i] = ""
	Next
	fn_FillSkinInput()
EndFunc

Func btn_clearClick()
	fn_ResetSkinInput()
EndFunc

#EndRegion

#Region ;==> SPRITES TAB
;buttons
Func Button_Sprite_ExportClick()
	fn_Export_QDT()
EndFunc
Func Button_Sprite_ImportClick()
	fn_Import_QDT()
EndFunc
Func Button_Sprite_ResetClick()
	fn_Reset_SpriteTab_Data()
EndFunc

Func Checkbox2Click()
	If ($modelType = $MOD_MDX) Then
		Local $numSfxDef = $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_NUM_SFX_DEF]
		Local $numSfxEnt = $g_aGameHeaderData[$MOD_MDX][$HDR_MDX_NUM_SFX_ENT]

		If _IsChecked($Checkbox2) Then
			if (($numSfxEnt = 0) And ($numSfxDef = 0)) Then
				GUICtrlSetState($Checkbox2, $GUI_UNCHECKED)
			EndIf
		Else
			GUICtrlSetState($Checkbox2, $GUI_CHECKED)
		EndIf
	Else
		GUICtrlSetState($Checkbox2, $GUI_UNCHECKED)
	EndIf
EndFunc

fn_ResetSFX_arrays()
Func fn_ResetSFX_arrays()
	Local $iI
	for $iI = 0 to 16
		$aSFX_define[$iI] = ""
	Next
	for $iI = 0 to 3
		$aSFX_add[$iI] = ""
	Next
	for $iI = 0 to 511
		$aFrames[$iI] = 0
	Next
EndFunc

fn_ResetSFX_DATA()
Func fn_ResetSFX_DATA()
	for $iI = 0 to 24
		$model_DATA_SFXDef[$iI] = ""
		$model_DATA_SFXEntry[$iI] = ""
	Next
	$model_DATA_preSFX = ""
	$model_DATA_END = ""
EndFunc


fn_Reset_SpriteTab_Data()
Func fn_Reset_SpriteTab_Data()
	_GUICtrlComboBox_SetCurSel($Combo1_SFX_Type, 30);type ;101 default pistol
	GuiCtrlSetData($Input1_flags, "0")				;flags
	_GUICtrlComboBox_SetCurSel($Combo2_direction, 0);direction
	GuiCtrlSetData($Input2_speed, "3")				;speed
	GuiCtrlSetData($Input3_gravity, "0")			;gravity
	GuiCtrlSetData($Input4_time, "2")				;time MS
	GuiCtrlSetData($Input5_randTime, "50")			;rand time
	GuiCtrlSetData($Input6_start_alpha, "0.9")		;start alpha
	GuiCtrlSetData($Input7_end_alpha, "0.0")		;end alpha
	GuiCtrlSetData($Input8_fade_in, "0.2")			;fade in
	GuiCtrlSetData($Input9_lifetime, "4.0")			;lifetime
	GuiCtrlSetData($Input10_rand_scale, "0.2")		;rand scale
	GuiCtrlSetData($Input11_start_width, "4.25")	;start width
	GuiCtrlSetData($Input12_end_width, "4.25")		;end width
	GuiCtrlSetData($Input13_start_height, "4.25")	;start height
	GuiCtrlSetData($Input14_end_height, "4.25")		;end height
	GuiCtrlSetData($Input15_rand_w_h, "0.5")		;rand width/height

	GuiCtrlSetData($Input16_vertexID, "0") ;vertex 0-based (-1 will not add any sfx if it did not allready exist)

	;frames
	GuiCtrlSetData($Input_f_start[0], "8")
	GuiCtrlSetData($Input_f_end[0], "8")
	For $i = 1 To 9
		GuiCtrlSetData($Input_f_start[$i], "-1")
		GuiCtrlSetData($Input_f_end[$i], "-1")
	Next
	;sprite flage
	For $i = 0 To $Count_Flags -1
		GUICtrlSetState($UI_Cbox_flags[$i], $GUI_UNCHECKED)
	Next

;sprite image reset
Combo1_SFX_TypeChange()

EndFunc

Func fn_FillFlags_chkBox()
	Local $flagsStr = int(GUICtrlRead($Input1_flags))
	For $i = 0 To $Count_Flags - 1
		if BitAND($flagsStr, BitShift(1, -$i)) Then GUICtrlSetState($UI_Cbox_flags[$i], $GUI_CHECKED)
	Next
EndFunc


;qdt/mdx file loaded and internal arrays set, now fill UI
Func fn_Fill_SpriteTab()
	;SFX Type
	Local $iNum = int(Number($aSFX_define[0]))
	Local $iSFXTypeIndex = 30 ;default pistol
	For $iI = 0 to 48
		if $aSFX_Type[$iI] = $iNum Then
			$iSFXTypeIndex = $iI
			ExitLoop
		EndIf
	Next

	;direction
	Local $upDown = int(Number($aSFX_define[2]))
	Local $upDownIdx = 0 ;default up
	if $upDown =1 Then $upDownIdx = 1


	;use vert/tri?
	Local $VertTri = int(Number($aSFX_add[2]))
	Local $VertTriIdx = 0 ;default vert4ex
	if $VertTri = 1 Then $VertTriIdx = 1

	;$sfx_define
	_GUICtrlComboBox_SetCurSel($Combo1_SFX_Type, $iSFXTypeIndex )
	GuiCtrlSetData($Input1_flags, $aSFX_define[1])
	_GUICtrlComboBox_SetCurSel($Combo2_direction, $upDownIdx)
	GuiCtrlSetData($Input2_speed, $aSFX_define[3])
	GuiCtrlSetData($Input3_gravity, $aSFX_define[4])
	GuiCtrlSetData($Input4_time, $aSFX_define[5])
	GuiCtrlSetData($Input5_randTime, $aSFX_define[6]*100)
	GuiCtrlSetData($Input6_start_alpha, $aSFX_define[7])
	GuiCtrlSetData($Input7_end_alpha, $aSFX_define[8])
	GuiCtrlSetData($Input8_fade_in, $aSFX_define[9])
	GuiCtrlSetData($Input9_lifetime, $aSFX_define[10])
	GuiCtrlSetData($Input10_rand_scale, $aSFX_define[11])
	GuiCtrlSetData($Input11_start_width, $aSFX_define[12])
	GuiCtrlSetData($Input12_end_width, $aSFX_define[13])
	GuiCtrlSetData($Input13_start_height, $aSFX_define[14])
	GuiCtrlSetData($Input14_end_height, $aSFX_define[15])
	GuiCtrlSetData($Input15_rand_w_h, $aSFX_define[16])

	;$sfx_add
	GuiCtrlSetData($Input16_vertexID, $aSFX_add[0]) ;todo add more defines??
	_GUICtrlComboBox_SetCurSel($Combo3_vertTri, $VertTriIdx) ;vertex/tri


	Local $fIdx=0, $iI = 0

	While ($iI < 512 And $fIdx < 10)
		if ($aFrames[$iI]) Then
			$aFrameRange[$fIdx][0] = $iI
			While ( $iI < 512 and $aFrames[$iI])
				$aFrameRange[$fIdx][1] = $iI ;set end time
				$iI+= 1
			WEnd
			$fIdx += 1
		EndIf
		$iI+= 1
	WEnd

	;clear unused input boxes
	For $iI = $fIdx to 9
		$aFrameRange[$iI][0] = -1
		$aFrameRange[$iI][1] = -1
	Next

	;_ArrayDisplay($aFrameRange)
	;todo cleanup
	For $i = 0 To 9
		GuiCtrlSetData($Input_f_start[$i], $aFrameRange[$i][0])
		GuiCtrlSetData($Input_f_end[$i], $aFrameRange[$i][1])
	Next

	fn_FillFlags_chkBox()
	Combo1_SFX_TypeChange()
EndFunc

;retreve sprite data fron UI. before saving qdt/mdx
Func fn_Get_SpriteTab_Data()
	;SFX Type
	Local $iIndex = $aSFX_Type[_GUICtrlComboBox_GetCurSel($Combo1_SFX_Type)] ; 30 ;default pistol
	;SFX Direction
	Local $upDownIdx = _GUICtrlComboBox_GetCurSel($Combo2_direction) ;0 ;default up
	;SFX use vert/tri
	Local $VertTriIdx = _GUICtrlComboBox_GetCurSel($Combo3_vertTri) ;0 ;default vertex
	fn_ResetSFX_arrays()

	;$sfx_define
	$aSFX_define[0] = 	$iIndex
	$aSFX_define[1] = 	int(GUICtrlRead($Input1_flags))
	$aSFX_define[2] = 	$upDownIdx
	$aSFX_define[3] = 	int(GUICtrlRead($Input2_speed))
	$aSFX_define[4] = 	number(GUICtrlRead($Input3_gravity))
	$aSFX_define[5] = 	int(GUICtrlRead($Input4_time))
	$aSFX_define[6] = 	number(GUICtrlRead($Input5_randTime)/100)
	$aSFX_define[7] = 	number(GUICtrlRead($Input6_start_alpha))
	$aSFX_define[8] = 	number(GUICtrlRead($Input7_end_alpha))
	$aSFX_define[9] = 	number(GUICtrlRead($Input8_fade_in))
	$aSFX_define[10] = 	number(GUICtrlRead($Input9_lifetime))
	$aSFX_define[11] = 	number(GUICtrlRead($Input10_rand_scale))
	$aSFX_define[12] = 	number(GUICtrlRead($Input11_start_width))
	$aSFX_define[13] = 	number(GUICtrlRead($Input12_end_width))
	$aSFX_define[14] = 	number(GUICtrlRead($Input13_start_height))
	$aSFX_define[15] = 	number(GUICtrlRead($Input14_end_height))
	$aSFX_define[16] = 	number(GUICtrlRead($Input15_rand_w_h))

	;$sfx_add
	$aSFX_add[0] = 	int(GUICtrlRead($Input16_vertexID)) ;todo add more defines??
	$aSFX_add[1] = 	0 ;always sprite define index 0
	$aSFX_add[2] = 	$VertTriIdx ;vertex/tri

	;frame range to show effect
	For $i = 0 To 9
		$aFrameRange[$i][0]=	int(GUICtrlRead($Input_f_start[$i]))
		$aFrameRange[$i][1]=	int(GUICtrlRead($Input_f_end[$i]))
	Next
	;_ArrayDisplay($aFrameRange)

	For $iI = 0 to 9
		;ConsoleWrite("range start = "&$aFrameRange[$iI][0]& " end=" &$aFrameRange[$iI][1]&@crlf)
		If($aFrameRange[$iI][0] >= 0) and ($aFrameRange[$iI][1] >= 0) And ($aFrameRange[$iI][0] <= $aFrameRange[$iI][1]) Then
			if $aFrameRange[$iI][0] > 511 Then $aFrameRange[$iI][0] = 511
			if $aFrameRange[$iI][1] > 511 Then $aFrameRange[$iI][1] = 511
			For $iJ = $aFrameRange[$iI][0] To $aFrameRange[$iI][1]
				$aFrames[$iJ] = 1
			Next
		EndIf
	Next
	;_ArrayDisplay($aFrames)

EndFunc

Func fn_Import_QDT()
	Local $sfxDefineIdx = 0, $sfxDefineCount = 0, $sfxDefineString = ""
	Local $sfxAddIdx = 0, $sfxAddCount = 0, $sfxAddString =""
	Local $iI, $iJ

	Local $filePath =  FileOpenDialog("kingpin sprites .qdt", $fileOpenDialogPath, "Text files (*.txt;*.qdt)|All files (*.*)", 1,"", $KPModelSkins)
	If Not @error Then
		fn_SetCurrentFolder($filePath)

		Local $aArray = FileReadToArray($filePath)
		If Not @error Then
			Local $idx
			for $iI = 0 to UBound($aArray)-1
				;strip comments
				$idx = StringInStr($aArray[$iI], "//")
				if $idx Then $aArray[$iI] = StringLeft($aArray[$iI],$idx-1)
				;sfx define
				$idx = StringInStr($aArray[$iI], "$sfx_define", 0, 1,1,11)
				if $idx then $sfxDefineIdx = $iI

				$idx = StringInStr($aArray[$iI], "$sfx_add", 0, 1,1,8)
				if $idx then $sfxAddIdx = $iI

				If ($sfxDefineIdx > 0) and  ($iI > $sfxDefineIdx) Then $sfxDefineString &= string($aArray[$iI]& " ")

				;append rest
				If ($sfxAddIdx > 0) And ($iI > $sfxAddIdx) Then $sfxAddString &= string($aArray[$iI]& " ")

			Next
			;ConsoleWrite($sfxDefineString&@CRLF)
			;ConsoleWrite($sfxAddString&@CRLF)

			;todo check exist

			Local  $iCount, $wasNum
			StringStripWS ( $sfxDefineString, 3)
			StringStripWS ( $sfxAddString, 3)
			fn_ResetSFX_arrays()


			$wasNum = 0
			$iCount = 0
			While ($sfxDefineString <> "" And $iCount < 17)
				if StringRegExp($sfxDefineString, '^[\d\.]') Then
					$aSFX_define[$iCount] &= StringLeft($sfxDefineString, 1)
					$wasNum = 1
				Else
					if $wasNum Then $iCount+=1; end of number string. new index
					$wasNum = 0
				EndIf
				$sfxDefineString = StringTrimLeft($sfxDefineString, 1)
			WEnd
			;_ArrayDisplay($aSFX_define)


			;process $sfx_add
			$wasNum = 0
			$iCount = 0
			While ($sfxAddString <> "" And $iCount < 4)
				if StringRegExp($sfxAddString, '^[\d\.]') Then
					$aSFX_add[$iCount] &= StringLeft($sfxAddString, 1)
					$wasNum = 1
				Else
					if $wasNum Then $iCount+=1; end of number string. new index
					$wasNum = 0
				EndIf
				$sfxAddString = StringTrimLeft($sfxAddString, 1)

				;append the rest of the string
				if $iCount = 3 Then
					$aSFX_add[$iCount] &= $sfxAddString
					Local $arr1=StringRegExp($sfxAddString, '(\d+)\s-\s(\d+)', $STR_REGEXPARRAYGLOBALMATCH)
					;_ArrayDisplay($arr1)
					For $iI = 0 to (UBound($arr1)-1) step 2
						ConsoleWrite("i= "&$iI&@CRLF)
						For $iJ = Int($arr1[$iI]) To Int($arr1[$iI+1])
							$aFrames[$iJ] = 1
						Next
					Next
					$iCount+=1
				EndIf
			WEnd
;~ 			_ArrayDisplay($aSFX_add)
			;_ArrayDisplay($aFrames)

			fn_Fill_SpriteTab()


		EndIf
	EndIf
EndFunc

Func fn_Export_QDT()
	Local $sOutFileName = "TEST"
	Local $sOutTmp, $iIdx

	if ($exportFileName <> "") Then
		$iIdx = StringInStr($exportFileName, "\",1, -1)
		If $iIdx Then
			$sOutTmp = StringTrimLeft($exportFileName, $iIdx)
			ConsoleWrite("!outname1= "&$sOutTmp&@CRLF)
			$iIdx = StringInStr($sOutTmp, ".",1, -1)
			If $iIdx Then
				$sOutFileName = StringLeft($sOutTmp, $iIdx-1)
				ConsoleWrite("!outname2= "&$sOutFileName&@CRLF)
			EndIf
		EndIf
	EndIf


	Local $filePath =  FileSaveDialog("kingpin sprites .qdt", $fileOpenDialogPath, "Quake data file (*.qdt)|All files (*.*)", 0, $sOutFileName, $KPModelSkins)
	If  @error  Then
		fn_MSG_box("No file was saved.")
	Else
		Local $hFile= FileOpen($filePath, $FO_OVERWRITE + $FO_CREATEPATH+$FO_UTF8_NOBOM)
		If not ($hFile = -1) Then
			Local $sSfxText[21], $sFrameRng = "", $iI
			fn_Get_SpriteTab_Data()

			fn_SetCurrentFolder($filePath)

			if ($exportFileName = "") Then
				$iIdx = StringInStr($filePath, "\",1, -1)
				If $iIdx Then
					$sOutTmp = StringTrimLeft($filePath, $iIdx)
					ConsoleWrite("!outname3= "&$sOutTmp&@CRLF)
					$iIdx = StringInStr($sOutTmp, ".",1, -1)
					If $iIdx Then
						$sOutFileName = StringLeft($sOutTmp, $iIdx-1)
						ConsoleWrite("!outname4= "&$sOutFileName&@CRLF)
					EndIf
				EndIf
			EndIf


			For $iI = 0 to 9
				If($aFrameRange[$iI][0] >= 0) and ($aFrameRange[$iI][1] >= 0) and ($aFrameRange[$iI][0] <= $aFrameRange[$iI][1]) Then
					$sFrameRng &= $aFrameRange[$iI][0] &" - "& $aFrameRange[$iI][1]& " "
				EndIf
			Next

			$sSfxText[0] =						'// Add SFX to gun' &@CRLF& _
												'$sfx_load ' & $sOutFileName&'   //.mdx to load' &@CRLF& _
												'' &@CRLF& _
												'$sfx_define //Define Index' & @CRLF & _
							$aSFX_define[0]	& 	'     // type (fire/smoke/blood)' &@CRLF
			$sSfxText[1] =	$aSFX_define[1]	&	'		// flags' &@CRLF
			$sSfxText[2] =	$aSFX_define[2]	&	'		// VEL_TYPE_UP (will move upwards)' &@CRLF
			$sSfxText[3] =	$aSFX_define[3]	&	'       // vel_speed' &@CRLF
			$sSfxText[4] =	$aSFX_define[4]	&	'		// gravity' &@CRLF
			$sSfxText[5] =	$aSFX_define[5]	&	'		// spawn interval, 2 = 0.1 seconds' &@CRLF
			$sSfxText[6] =	$aSFX_define[6]	&	'		// random spawn interval (sprite will be spawned 80% of the time)' &@CRLF
			$sSfxText[7] =	$aSFX_define[7]	&	'      // start alpha' &@CRLF
			$sSfxText[8] =	$aSFX_define[8]	&	'		// end alpha' &@CRLF
			$sSfxText[9] =	$aSFX_define[9]	&	'      // fadein time' &@CRLF
			$sSfxText[10] =	$aSFX_define[10]&	'      // lifetime' &@CRLF
			$sSfxText[11] =	$aSFX_define[11]&	'   	// random time scale (fadein and lifetime will be multiplied by (x * 0.5), where x is a random number between -1 and 1' &@CRLF
			$sSfxText[12] =	$aSFX_define[12]&	'       // start width' &@CRLF
			$sSfxText[13] =	$aSFX_define[13]&	'       // end width' &@CRLF
			$sSfxText[14] =	$aSFX_define[14]&	'       // start height' &@CRLF
			$sSfxText[15] =	$aSFX_define[15]&	'       // end height' &@CRLF
			$sSfxText[16] =	$aSFX_define[16]&	'      // random size scale (same as random time scale, but effects only sizes)' &@CRLF& _
												'' &@CRLF& _
												'$sfx_add' &@CRLF
			$sSfxText[17] = $aSFX_add[0]&		'   // INDEX (assigned to the first vertex)' &@CRLF
			$sSfxText[18] = $aSFX_add[1]&		'		// uses the first sfx_define (above)' &@CRLF
			$sSfxText[19] = $aSFX_add[2]&		'   // tells the engine to use the above INDEX # is a 0=vertex / 1=Triangle' &@CRLF
			$sSfxText[20] = $sFrameRng&			'  // 0-based frame ranges to enable the effect for <from - to> <from - to>' &@CRLF & _
												'' &@CRLF& _
												'$sfx_save ' &$sOutFileName& '   //.mdx to save' &@CRLF& ' '

			For $iI = 0 to 20
				FileWrite($hFile, $sSfxText[$iI])
			Next

			FileClose($hFile)
			fn_MSG_box("File saved.")
		EndIf
	EndIf
EndFunc

Func Combo1_SFX_TypeChange()
	_ResourceSetImageToCtrl($Icon_spr,"spr_" & _GUICtrlComboBox_GetCurSel($Combo1_SFX_Type) )
EndFunc
#EndRegion ;==>end sfx

#Region ;==> SPRITE TAB. SFX flags
Func Button_flagsClick()
	Local $aPos = WinGetPos ( $KPModelSkins )
							;from left,  from top
	WinMove($DMFLAGS, "", $aPos[0]+7, $aPos[1]+28)
	GUISetState(@SW_DISABLE,$KPModelSkins)
	GUISetState(@SW_SHOW,$DMFLAGS)
EndFunc

Func DMFLAGSClose()
	Local $tmpFlags = 0
	GUISetState(@SW_HIDE, $DMFLAGS)
	GUISetState(@SW_ENABLE, $KPModelSkins )
	GUISetState(@SW_RESTORE, $KPModelSkins)
	fn_Calculate_flags()
EndFunc

Func fn_Calculate_flags()
	Local $tmpFlags =0
	For $i = 0 To $Count_Flags - 1
		If _IsChecked($UI_Cbox_flags[$i]) Then
			$tmpFlags = BitOR($tmpFlags, bitshift(1, -$i))
		EndIf
	Next
	GUICtrlSetData($Input1_flags,  $tmpFlags)
EndFunc

#EndRegion

#Region ;==> SCALE TAB
; buttons
Func CheckboxScaleClick()
	fn_Set_ScaleInput()
EndFunc
Func btn_scale_centreClick()
	fn_scale_centreModel()
EndFunc
Func btn_scale_dropClick()
	fn_scale_dropToFloor()
EndFunc

Func fn_scale_centreModel()
	Local $tmpScale[6], $xTotal, $yTotal, $zTotal
	For $i = 0 To 5
		$tmpScale[$i] = Number( GUICtrlRead($UI_in_scale[$i]), $NUMBER_DOUBLE)
	Next

	$xTotal = ($tmpScale[0] - $tmpScale[3]) / 2
	$yTotal = ($tmpScale[1] - $tmpScale[4]) / 2
	$zTotal = ($tmpScale[2] - $tmpScale[5]) / 2

	GUICtrlSetData($UI_in_scale[0], $xTotal)
	GUICtrlSetData($UI_in_scale[1], $yTotal)
	GUICtrlSetData($UI_in_scale[2], $zTotal)
	GUICtrlSetData($UI_in_scale[3], -$xTotal)
	GUICtrlSetData($UI_in_scale[4], -$yTotal)
	GUICtrlSetData($UI_in_scale[5], -$zTotal)
EndFunc

Func fn_scale_dropToFloor()
	Local $zMax = Number(GUICtrlRead($UI_in_scale[2]), $NUMBER_DOUBLE)
	Local $zMin = Number(GUICtrlRead($UI_in_scale[5]), $NUMBER_DOUBLE)
	local $fTotal = -15 + ($zMax - $zMin)

	GUICtrlSetData($UI_in_scale[2], $fTotal)
	GUICtrlSetData($UI_in_scale[5], "-15.0")
EndFunc

Func fn_Reset_Scale()
	GUICtrlSetState($CheckboxScale, $GUI_UNCHECKED)
	fn_Set_ScaleInput()
EndFunc

Func fn_Set_ScaleInput()
	if _IsChecked($CheckboxScale) Then
		For $i = 0 To 5
			GUICtrlSetState($UI_in_scale[$i], $GUI_ENABLE)
		Next
		GUICtrlSetState($btn_scale_centre, $GUI_ENABLE)
		GUICtrlSetState($btn_scale_drop, $GUI_ENABLE)
	Else
		For $i = 0 To 5
			GUICtrlSetState($UI_in_scale[$i], $GUI_DISABLE)
		Next
		GUICtrlSetState($btn_scale_centre, $GUI_DISABLE)
		GUICtrlSetState($btn_scale_drop, $GUI_DISABLE)
	EndIf
EndFunc

Func fn_Fill_Scale()
	GUICtrlSetData($UI_in_scale[0], $model_DATA_scale[3] + ($model_DATA_scale[0]*255))
	GUICtrlSetData($UI_in_scale[1], $model_DATA_scale[4] + ($model_DATA_scale[1]*255))
	GUICtrlSetData($UI_in_scale[2], $model_DATA_scale[5] + ($model_DATA_scale[2]*255))
	GUICtrlSetData($UI_in_scale[3], $model_DATA_scale[3])
	GUICtrlSetData($UI_in_scale[4], $model_DATA_scale[4])
	GUICtrlSetData($UI_in_scale[5], $model_DATA_scale[5])
EndFunc

Func fn_Update_Scale()
	if _IsChecked($CheckboxScale) Then
		Local $tmpScale[6]
		For $i = 0 To 5
			$tmpScale[$i] = Number( GUICtrlRead($UI_in_scale[$i]), $NUMBER_DOUBLE)
		Next

		$model_DATA_scale[0] = ($tmpScale[0] - $tmpScale[3]) * 0.003921568627451
		$model_DATA_scale[1] = ($tmpScale[1] - $tmpScale[4]) * 0.003921568627451
		$model_DATA_scale[2] = ($tmpScale[2] - $tmpScale[5]) * 0.003921568627451
		$model_DATA_scale[3] = $tmpScale[3]
		$model_DATA_scale[4] = $tmpScale[4]
		$model_DATA_scale[5] = $tmpScale[5]
		;GUICtrlSetData($InputScale_2, $model_DATA_scale[4] + ($model_DATA_scale[1]*256))
	EndIf

	ConsoleWrite("x="&$model_DATA_scale[0]& " y="&$model_DATA_scale[1]& "  z="&$model_DATA_scale[2]& " x="&$model_DATA_scale[3]& " y="&$model_DATA_scale[4]& " z="&$model_DATA_scale[5]& @CRLF)

EndFunc

#EndRegion

#Region ;==> ICON INCLUDE
_ResourceSetImageToCtrl($Icon_spr,"spr_31")
;==> Resources.au3 by Zedna
Func _ResourceGet($ResName, $ResLang = 0) ; $RT_RCDATA = 10
	Local Const $IMAGE_BITMAP = 0
	Local $hInstance, $hBitmap, $InfoBlock, $GlobalMemoryBlock, $MemoryPointer, $ResSize

	;If $DLL = -1 Then
	  $hInstance = _WinAPI_GetModuleHandle("")
	 ; $hInstance = _WinAPI_LoadLibraryEx($DLL, $LOAD_LIBRARY_AS_DATAFILE)

	If $hInstance = 0 Then Return SetError(1, 0, 0)

	$hBitmap = _WinAPI_LoadImage($hInstance, $ResName, $IMAGE_BITMAP, 0, 0, 0)
	If @error Then Return SetError(2, 0, 0)
	Return $hBitmap ; returns handle to Bitmap

EndFunc


Func _ResourceSetImageToCtrl($CtrlId, $ResName) ; $RT_RCDATA = 10
	Local $ResData

	$ResData = _ResourceGet($ResName, 0)
	If @error Then Return SetError(1, 0, 0)

	_SetBitmapToCtrl($CtrlId, $ResData)
	If @error Then Return SetError(2, 0, 0)

	Return 1
EndFunc

; internal helper function
; thanks for improvements Melba
Func _SetBitmapToCtrl($CtrlId, $hBitmap)
    Local Const $STM_SETIMAGE = 0x0172
    Local Const $STM_GETIMAGE = 0x0173
    Local Const $BM_SETIMAGE = 0xF7
    Local Const $BM_GETIMAGE = 0xF6
    Local Const $IMAGE_BITMAP = 0
    Local Const $SS_BITMAP = 0x0E
    Local Const $BS_BITMAP = 0x0080
    Local Const $GWL_STYLE = -16

    Local $hWnd, $hPrev, $Style, $iCtrl_SETIMAGE, $iCtrl_GETIMAGE, $iCtrl_BITMAP

    $hWnd = GUICtrlGetHandle($CtrlId)
    If $hWnd = 0 Then Return SetError(1, 0, 0)


    $CtrlId = _WinAPI_GetDlgCtrlID($hWnd) ; support for $CtrlId = -1
    If @error Then Return SetError(2, 0, 0)


    ; determine control class and adjust constants accordingly
    Switch _WinAPI_GetClassName($CtrlId)
        Case "Button" ; button,checkbox,radiobutton,groupbox
            $iCtrl_SETIMAGE = $BM_SETIMAGE
            $iCtrl_GETIMAGE = $BM_GETIMAGE
            $iCtrl_BITMAP = $BS_BITMAP
        Case "Static" ; picture,icon,label
            $iCtrl_SETIMAGE = $STM_SETIMAGE
            $iCtrl_GETIMAGE = $STM_GETIMAGE
            $iCtrl_BITMAP = $SS_BITMAP
        Case Else
            Return SetError(3, 0, 0)
	EndSwitch

	; set SS_BITMAP/BS_BITMAP style to the control
    $Style = _WinAPI_GetWindowLong($hWnd, $GWL_STYLE)
    If @error Then Return SetError(4, 0, 0)
    _WinAPI_SetWindowLong($hWnd, $GWL_STYLE, BitOR($Style, $iCtrl_BITMAP))
    If @error Then Return SetError(5, 0, 0)

	; set image to the control
    $hPrev  = _SendMessage($hWnd, $iCtrl_SETIMAGE, $IMAGE_BITMAP, $hBitmap)
    If @error Then Return SetError(6, 0, 0)

    If $hPrev Then _WinAPI_DeleteObject($hPrev)

	Return 1
EndFunc
;==> END Resources.au3
#EndRegion


While 1
	Sleep(100)
WEnd
