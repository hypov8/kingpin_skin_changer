
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=star_icon.ico
#AutoIt3Wrapper_Outfile=kingpin_skin_changer.exe
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Description=Kingpin Skin Changer v1.0.6
#AutoIt3Wrapper_Res_Fileversion=1.0.6.0
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

;~ #NoTrayIcon

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
;   fixed sprites to read 1024 frames
;   moved reading data to separate functions
;   added quake/hexen mdl support (only flags can be changed)

; update v1.0.6
;   huge code cleanup. to allow easy additions
;   capped input box string lengths
;   added check for file incorrect file lengths. fixed on export
;

; todo
;   update .mdl features
;   add additional models
;   log file or summary of errors

#Region ;==> GLOBAL
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
#include <GuiEdit.au3>
#include <GuiScrollBars.au3>
#include <StructureConstants.au3>
Opt("GUIOnEventMode", 1)
Opt("GUICloseOnESC", 0)
Opt("MustDeclareVars", 1)

Global Const $g_sVersion   = "v1.0.6"
Global Const $iMAXSKIN     = 32
Global Const $MAXTRIANGLES = 4096
Global Const $MAXVERTEX    = 2048
Global $KPModelSkins, $UI_Grp_open, $UI_Grp_exportFile, $UI_In_import, $UI_Btn_import, $UI_In_export, $UI_Btn_exportFile,  _
	$UI_Btn_exportGo , $UI_Btn_scaleCentre, $UI_Btn_scaleDrop, $UI_CBox_scale, _
	$UI_CBox_backup, $UI_In_sizeH, $UI_In_sizeW, $UI_Btn_clearSkins, $UI_Btn_spriteReset, $UI_Img_sprite, _
	$UI_Btn_spriteImport, $UI_Btn_spriteExport, $UI_Group_spriteMDX, $UI_Group_spriteMDL, $Input1_flags_mdl, _
	$UI_Cbox_MDXSfx, $UI_Group_spriteEmpty, $UI_label_msgBox2, $UI_label_msgBox1, $UI_Btn_msgBox, $GUI_msgbox, _
	$UI_In_frStart[10], $UI_In_frEnd[10], $UI_in_scale[6], $UI_btn_browsSkins[$iMAXSKIN], $UI_in_skins[$iMAXSKIN], _
	$GUI_Popup_skins, $GUI_Popup_spritesMDX, $GUI_Popup_spritesMDL, $GUI_Popup_scale, $GUI_Popup_about, $GUI_Popup_spritesNONE, _
	$UI_Btn_Skins, $UI_Btn_Sprites, $UI_Btn_Scale, $UI_Btn_About, $GUI_DMFlags

;mdx sprites
Global Enum _
	$MDX_SP_DEF_0_TYPE, _
	$MDX_SP_DEF_1_FLAGS, _
	$MDX_SP_DEF_2_DIR, _
	$MDX_SP_DEF_3_SPEED, _
	$MDX_SP_DEF_4_DELAY, _
	$MDX_SP_DEF_5_TIME, _
	$MDX_SP_DEF_6_SPAWN, _
	$MDX_SP_DEF_7_ALPHA_ST, _
	$MDX_SP_DEF_8_ALPHA_END, _
	$MDX_SP_DEF_9_FADEIN, _
	$MDX_SP_DEF_10_LIFE, _
	$MDX_SP_DEF_11_RAND_SCALE, _
	$MDX_SP_DEF_12_WIDTH_ST, _
	$MDX_SP_DEF_13_WIDTH_END, _
	$MDX_SP_DEF_14_HEIGHT_ST, _
	$MDX_SP_DEF_15_HEIGHT_END, _
	$MDX_SP_DEF_16_RAND_WH, _
	$MDX_SP_ENT_0_V_IDX, _
	$MDX_SP_ENT_1_DEFID, _
	$MDX_SP_ENT_2_TYPE, _
	$MDX_SP_ENT_3_FRAMES, _
	$COUNT_MDX_SP
Global Enum $SPR_MDX_HW, $SPR_MDX_TYPE, $SPR_MDX_VALUE, $SPR_MDX_LABEL, $SPR_MDX_TOOLTIP, $COUNT_SPR_MDX ;, $SPR_MDX_FUNC
Global Enum $SP_TYPE_INT, $SP_TYPE_FLT, $SP_TYPE_CBO, $SP_TYPE_PCT, $SP_TYPE_BYT, $SP_TYPE_FLG, $SP_TYPE_SPR
Global Const $iSFX_DEF_SIZE = (17*4)
Global Const $iSFX_ENTRY_SIZE = (3*4+128) ;64/128 = 512/1024 frames. todo check this in engine. some models have > 900frames

global $g_aMDX_sprite_cfg[$COUNT_MDX_SP][$COUNT_SPR_MDX] = [ _ ;SFX def
	[0, $SP_TYPE_SPR, 30,   "SFX Type",         "Sprite image to use"], _
	[0, $SP_TYPE_FLG, 0,    "Flags.",           "Flags."], _
	[0, $SP_TYPE_CBO, 0,    "Direction",        "Direction sprite will face"], _
	[0, $SP_TYPE_INT, 3,    "Speed",            "Velocity/Speed (type=integer)"], _
	[0, $SP_TYPE_INT, 0,    "Gravity/Delay",    "Use gravity for sprite. (type=integer)"], _
	[0, $SP_TYPE_INT, 2,    "Time 0.1s *",      "Spawn interval. 2=0.2 seconds (type=integer)"], _
	[0, $SP_TYPE_PCT, 0.5,  "Spawn %",          "Random spawn interval (sprite will be spawned 50% of the time) (type=float. converted to percent in UI)"], _
	[0, $SP_TYPE_PCT, 0.9,  "Start Alpha %",    "The start of a sprite with how much alpha the sprite has.(type=Float. converted to percent in UI)"], _
	[0, $SP_TYPE_PCT, 0.0,  "End Alpha %",      "The end of a sprite with how much alpha the sprite has. (type=float. converted to percent in UI)"], _
	[0, $SP_TYPE_FLT, 0.2,  "Fade In",          "Fade in time. (type=float)"], _
	[0, $SP_TYPE_FLT, 4.0,  "Lifetime",         "How long will the sprite will be shown before it is gone. (type=float)"], _
	[0, $SP_TYPE_FLT, 0.2,  "Rand Scale",       "Random time scale (fadein and lifetime will be multiplied by (x * 0.5), where x is a random number between -1 and 1. (type=float)"], _
	[0, $SP_TYPE_FLT, 4.25, "Start Width",      "Start size of sprite in width. (type=float)"], _
	[0, $SP_TYPE_FLT, 4.25, "End Width",        "End size of sprite in width. (type=float)"], _
	[0, $SP_TYPE_FLT, 4.25, "Start Height",     "Start size of sprite in height. (type=float)"], _
	[0, $SP_TYPE_FLT, 4.25, "End Height",       "End size of sprite in height. (type=float)"], _
	[0, $SP_TYPE_FLT, 0.5,  "Rand W/H",         "Random size scale (same as random time scale, but effects only sizes) (type=float)"],  _
	[0, $SP_TYPE_INT, 0,    "Vert/Tri Index",   "What vertex/face index do you want the sprite to be attached to. (type=integer)"], _
	[0, $SP_TYPE_INT, 0,    "Define Index",     "Always use the first defined index."], _
	[0, $SP_TYPE_CBO, 0,    "Vert/Tri ?",       "Select vertex or triangle to spawn sprite at"], _
	[0, $SP_TYPE_BYT, "",   "Frames",           ""] _
]	;todo framerange?

;~ popup gui (flags)
Global Const $COUNT_FLAGS = 25 ;16777216
Global enum $FLAG_NAME, $FLAG_DEF
Global $UI_Cbox_flags[$COUNT_FLAGS], $UI_Labl_flags[$COUNT_FLAGS]
;sfx string names. kingpin
Global Const $g_aFlags_kp1[$COUNT_FLAGS][2] = [ _
	["Add Gravity",                        "GRAVITY"], _ ;
	["Fixed Decal",                        "SURFACE_EFFECT"], _ ;
	["No Random Rotation",                 "NO_FLIP"], _ ;
	["Fixed Decal. Sort Near. Blend Blue", "LIGHTFLARE"], _ ;
	["Sort Near. Alpha",                   "DEPTHHACK"], _ ;
	["2D Sprite (Rotate Z)",               "UPRIGHT"], _ ;
	["Move up. Black",                     "VEL_IS_ANGLES"], _ ;
	["Blend White",                        "ADDITIVE_BLEND"], _ ;
	["Sprite (Alpha)",                     "ALPHA_IS_FRAME"], _ ;
	["Blend Blue",                         "VEL_IS_COLOR_MODU"], _ ;
	["Cull Close",                         "CLOSE_CULL"], _ ;
	["",""] _
]
;sfx string names. quake/hexen
Global Const $g_aFlags_quake[$COUNT_FLAGS][2] = [ _
	["Rocket trail",                                       "EF_ROCKET"], _
	["Grenade trail",                                      "EF_GRENADE"], _
	["Gib trail",                                          "EF_GIB"], _
	["rotate (bonus items)",                               "EF_ROTATE"], _
	["green split trail",                                  "EF_TRACER"], _
	["small blood trail",                                  "EF_ZOMGIB"], _
	["orange split trail + rotate",                        "EF_TRACER2"], _
	["purple trail",                                       "EF_TRACER3"], _
	["Yellow transparent trail in all directions",         "EF_FIREBALL"], _
	["Blue-white transparent trail, with gravity",         "EF_ICE"], _
	["This model has mip-maps",                            "EF_MIP_MAP"], _
	["Black transparent trail with negative light",        "EF_SPIT"], _
	["Transparent sprite",                                 "EF_TRANSPARENT"], _
	["Vertical spray of particles",                        "EF_SPELL"], _
	["Solid model with color 0",                           "EF_HOLEY"], _
	["Translucency through the particle table",            "EF_SPECIAL_TRANS"], _
	["Poly Model always faces you",                        "EF_FACE_VIEW"], _
	["leave a trail at top and bottom of model",           "EF_VORP_MISSILE"], _
	["slowly move up and left/right",                      "EF_SET_STAFF"], _
	["a trickle of blue/white particles with gravity",     "EF_MAGICMISSILE"], _
	["a trickle of brown particles with gravity",          "EF_BONESHARD"], _
	["white transparent particles with little gravity",    "EF_SCARAB"], _
	["Green drippy acid shit",                             "EF_ACIDBALL"], _
	["Blood rain shot trail",                              "EF_BLOODSHOT"], _
	["Set per frame, this model will use the far mip map", "EF_MIP_MAP_FAR"] _
]

Global Enum _
	$MOD_NONE = -1 , _
	$MOD_MDL, _
	$MOD_MD2, _
	$MOD_MDX, _
	$MOD_MD3, _
	$COUNT_MOD
Global Const $g_aModelData[$COUNT_MOD][2] = [ _
	['Quake1',  ".mdl"], _ ;todo add games.
	["Quake2",  ".md2"], _
	["Kingpin", ".mdx"], _
	["Quake3",  ".md3"] _
]
Global $g_ImportFileName =""
Global $g_ExportFileName =""
Global $g_iModelType = $MOD_NONE
Global $isActive_msgBox = 0
Global $g_iCurrentTab = 0
global $g_isPopupActive = False

;sprites
Global Enum _
	$SFX_IDX_VERT, _
	$SFX_IDX_DEFF, _
	$SFX_IDX_TYPE, _
	$SFX_FRAMES, _
	$COUNT_SFX_ENTRY
Global Const $COUNT_SFX_FRAMES = 1024
Global Const $COUNT_SFX_DEF = 17
Global $fileOpenDialogPath = @ScriptDir &"\" ; store last folder

;SFX Type conversion array ;$Combo1_SFX_Type
Global Const $COUNT_SFX_TYPE = 49
Global Const $g_aMDXSFX_sprite_Cfg[$COUNT_SFX_TYPE][2] = [ _
	[0, "Blood (Called SFX_SPRITE_SURF_BLOOD1 in code)"], _
	[1, "Bullet Hole (Called SFX_SPRITE_SURF_BULLET1 in code)"], _
	[2, "Riple (Called SFX_SPRITE_SURF_RIPPLE in code)"], _
	[5, "Blood Pool (Called SFX_SPRITE_SURF_BLOOD_POOL in code)"], _
	[6, "Blood Splat"], _
	[7, "Blood Drop"], _
	[8, "Smoke Small"], _
	[9, "Fire"], _
	[10, "Carona"], _
	[16, "Same as 9:"], _
	[17, "Carona Amber"], _
	[18, "Carona Red"], _
	[19, "Carona Green"], _
	[20, "Carona Blue"], _
	[21, "Rain"], _
	[22, "Smoke Small R (Red? but is not red. unfisched texture)"], _
	[23, "Sniper 1c (Missing texture)"], _
	[24, "Sniper 2 (Missing texture)"], _
	[25, "Same as 2."], _
	[71, "Blood 1"], _
	[72, "Blood 1b"], _
	[73, "Blood 1c"], _
	[74, "Blood 1d"], _
	[75, "Blood 1e"], _
	[76, "Blood 1f"], _
	[77, "Blood 1g"], _
	[78, "Blood 1h"], _
	[79, "Blood 1i"], _
	[80, "Muzzle flash 3"], _
	[100, "Muzzle flash HMG (Used for HMG)"], _
	[101, "Muzzle flash 1 (Used for Pistol)"], _
	[102, "Muzzle flash 2 (Used for Tommygun)"], _
	[103, "Same as 80. (Used for Shotgun)"], _
	[104, "Muzzle flash 4 (Used for Flamethrower)"], _
	[106, "Muzzle flash 1a"], _
	[107, "Muzzle flash 2a"], _
	[108, "Muzzle flash 2b"], _
	[110, "Explode 1"], _
	[111, "Explode 2"], _
	[116, "Smoke Animated"], _
	[120, "Flame Thrower"], _
	[121, "Return error texture."], _
	[122, "Flame Thrower Blue"], _
	[123, "Same as 121."], _
	[124, "Splash 1"], _
	[125, "Splash 2"], _
	[126, "Splash 3"], _
	[127, "Splash 4"], _
	[128, "Firewall"] _
]

;== HEADER ==
;MD2
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
;MDX
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
	$HDR_MDX_OFF_VERTINFO, _
	$HDR_MDX_OFF_SFX_DEF, _
	$HDR_MDX_OFF_SFX_ENT, _
	$HDR_MDX_OFF_BBOXFRAME, _
	$HDR_MDX_OFF_DUMMYEND, _
	$HDR_MDX_OFF_END
;MD3
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
;MDL
Global Enum _
	$HDR_MDL_ID, _
	$HDR_MDL_VER, _
	$HDR_MDL_SCALE_X, _
	$HDR_MDL_SCALE_Y, _
	$HDR_MDL_SCALE_Z, _
	$HDR_MDL_ORIGIN_X, _
	$HDR_MDL_ORIGIN_Y, _
	$HDR_MDL_ORIGIN_Z, _
	$HDR_MDL_BOUND_RAD, _
	$HDR_MDL_EYE_X, _
	$HDR_MDL_EYE_Y, _
	$HDR_MDL_EYE_Z, _
	$HDR_MDL_NUM_SKINS, _
	$HDR_MDL_SKIN_W, _
	$HDR_MDL_SKIN_H, _
	$HDR_MDL_NUM_VERTS, _
	$HDR_MDL_NUM_TRIS, _
	$HDR_MDL_NUM_FRAMES, _
	$HDR_MDL_SYNC_TYPE, _
	$HDR_MDL_FLAGS, _
	$HDR_MDL_SIZE

;== OFFSETS ==
;MD2
Global Enum _
	$OFF_MD2_SKIN, _
	$OFF_MD2_TEXCOORD, _
	$OFF_MD2_TRI, _
	$OFF_MD2_FRAME, _
	$OFF_MD2_GLCMD, _
	$OFF_MD2_END, _
	$COUNT_OFF_MD2
;MDX
Global Enum _
	$OFF_MDX_SKIN, _
	$OFF_MDX_TRI, _
	$OFF_MDX_FRAME, _
	$OFF_MDX_GLCMD, _
	$OFF_MDX_VERTINFO, _
	$OFF_MDX_SFX_DEF, _
	$OFF_MDX_SFX_ENT, _
	$OFF_MDX_BBOXFRAME, _
	$OFF_MDX_DUMMYEND, _
	$OFF_MDX_END, _
	$COUNT_OFF_MDX
;MDL
Global Enum _
	$OFF_MDL_SKINS, _
	$OFF_MDL_TEX_CORD, _
	$OFF_MDL_TRI, _
	$OFF_MDL_FRAME, _
	$COUNT_OFF_MDL

;model data storage
Global $g_aHeaderData[35]
Global $g_aLumpSize[35]
Global $g_aLumpData[35]
#EndRegion ;==> END GLOBAL


Func UI_Tabs()
	local $aGUI = [$GUI_Popup_spritesMDX, $GUI_Popup_spritesMDL, $GUI_Popup_spritesNONE, _
		$GUI_Popup_skins, $GUI_Popup_scale, $GUI_Popup_about]

	;hide all
	For $hw in $aGUI
		GUISetState(@SW_HIDE, $hw)
	Next

	Select
		Case _IsChecked($UI_Btn_Skins) ; skins
			GUISetState(@SW_SHOW, $GUI_Popup_skins)
		Case _IsChecked($UI_Btn_Sprites) ; sprites
			Switch $g_iModelType
				Case $MOD_MDL
					GUISetState(@SW_SHOW, $GUI_Popup_spritesMDL)
				Case $MOD_MD3
					GUISetState(@SW_SHOW, $GUI_Popup_spritesNONE)
				Case $MOD_MD2
					GUISetState(@SW_SHOW, $GUI_Popup_spritesNONE)
				Case Else
					GUISetState(@SW_SHOW, $GUI_Popup_spritesMDX)
			EndSwitch
		Case _IsChecked($UI_Btn_Scale) ; scale
			GUISetState(@SW_SHOW, $GUI_Popup_scale)
		Case _IsChecked($UI_Btn_About) ; about
			GUISetState(@SW_SHOW, $GUI_Popup_about)
		Case Else
			;invalid
	EndSelect

EndFunc

Func UI_Btn_TabClick()
	UI_Tabs()
EndFunc

;new gui end

#Region ;==> BUILD_GUI
	GUI_MainUI()
	GUI_Build_TabSkins() ;skins tab
	GUISetState(@SW_SHOW, $KPModelSkins)
	GUISetState(@SW_SHOW, $GUI_Popup_skins)
	GUI_Build_TabSprites_MDX() ;sprites tab
	GUI_Build_TabSprites_MDL() ;sprites tab
	GUI_Build_TabSprites_NONE() ;sprites tab
	GUI_Build_TabScale()
	GUI_Build_TabAbout()
	GUI_Build_Flags()
	GUI_Build_msgBox()

	UI_Tabs() ;set active pags (button/tab)

	Func GUI_MainUI()
		$KPModelSkins = GUICreate("Kingpin Model Skin Changer "& $g_sVersion, 494, 510, -1, -1, BitOr($GUI_SS_DEFAULT_GUI,$WS_CLIPSIBLINGS), BitOR($WS_EX_ACCEPTFILES,$WS_EX_WINDOWEDGE))
		GUISetOnEvent($GUI_EVENT_CLOSE, "KPModelSkinsClose")

		$UI_Grp_open = GUICtrlCreateGroup("#1. Open Model", 4, 4, 381, 57, -1, $WS_EX_TRANSPARENT)
			$UI_Btn_import = GUICtrlCreateButton("Import..", 12, 24, 77, 29)
			GUICtrlSetTip(-1, "Output File Name will also be updated")
			GUICtrlSetOnEvent(-1, "btn_importClick")
			$UI_In_import = GUICtrlCreateInput("", 96, 28, 277, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY))
		GUICtrlCreateGroup("", -99, -99, 1, 1)

		;export group
		$UI_Grp_exportFile = GUICtrlCreateGroup("#2. Output Model Path", 4, 64, 381, 57, -1, $WS_EX_TRANSPARENT)
			$UI_Btn_exportFile = GUICtrlCreateButton("Save name..", 12, 84, 77, 29)
			GUICtrlSetTip(-1, "Set output filename different to import.")
			GUICtrlSetOnEvent(-1, "btn_export_fileClick")
			$UI_In_export = GUICtrlCreateInput("", 96, 88, 277, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY))
		GUICtrlCreateGroup("", -99, -99, 1, 1)

		GUICtrlCreateGroup("#3. Skins/Sprite/Scale", 4, 124, 485, 381, -1, $WS_EX_TRANSPARENT)
			$UI_Btn_Skins = GUICtrlCreateRadio("Skins", 12, 144, 57, 21, BitOR($GUI_SS_DEFAULT_RADIO,$BS_PUSHLIKE))
			GUICtrlSetOnEvent(-1, "UI_Btn_TabClick")
			GUICtrlSetState(-1, $GUI_CHECKED)
			$UI_Btn_Sprites = GUICtrlCreateRadio("Sprites", 72, 144, 57, 21, BitOR($GUI_SS_DEFAULT_RADIO,$BS_PUSHLIKE))
			GUICtrlSetOnEvent(-1, "UI_Btn_TabClick")
			$UI_Btn_Scale = GUICtrlCreateRadio("Scale", 132, 144, 57, 21, BitOR($GUI_SS_DEFAULT_RADIO,$BS_PUSHLIKE))
			GUICtrlSetOnEvent(-1, "UI_Btn_TabClick")
			$UI_Btn_About = GUICtrlCreateRadio("About", 192, 144, 57, 21, BitOR($GUI_SS_DEFAULT_RADIO,$BS_PUSHLIKE))
			GUICtrlSetOnEvent(-1, "UI_Btn_TabClick")
			$UI_Btn_clearSkins = GUICtrlCreateButton("Clear Skins", 416, 144, 65, 21)
			GUICtrlSetTip(-1, "Clear all skins.")
			GUICtrlSetOnEvent(-1, "btn_clearClick")
			$UI_In_sizeW = GUICtrlCreateInput("", 336, 144, 37, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetTip(-1, "Texture Width")
			$UI_In_sizeH = GUICtrlCreateInput("", 376, 144, 37, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetTip(-1, "Texture Height")
			GUICtrlCreateLabel("W/H", 304, 146, 28, 17, $SS_RIGHT)
			GUICtrlSetTip(-1, "Skin Width/Height")
		GUICtrlCreateGroup("", -99, -99, 1, 1)

		GUICtrlCreateGroup("#4. Save", 392, 4, 97, 117,-1, $WS_EX_TRANSPARENT)
			$UI_Btn_exportGo = GUICtrlCreateButton("GO!", 401, 56, 77, 57)
			GUICtrlSetTip(-1, "Generate model"&@CRLF&"CAUTION: make sure you have a backup.")
			GUICtrlSetOnEvent(-1, "fn_Export_GOClick")
			$UI_CBox_backup = GUICtrlCreateCheckbox("Backup", 404, 28, 69, 17)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetTip(-1, "Create a backup file (file_name.mdx.backup)"&@CRLF&"File will NOT be backed up if a backup already exists")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
	EndFunc

	Func GUI_Build_TabSkins()
		GUISwitch($KPModelSkins); return to main UI
		local $iOffY = 0
		$GUI_Popup_skins = GUICreate("", 469, 322, 12, 174, $WS_CHILD, $WS_EX_STATICEDGE, $KPModelSkins)
		_GUIScrollBars_Init($GUI_Popup_skins, 0, 40)
		GUIRegisterMsg($WM_VSCROLL, "WM_VSCROLL")

		For $i = 0 To $iMAXSKIN - 1
			$UI_btn_browsSkins[$i] = GUICtrlCreateButton("Skin "&$i+1, 0, $iOffY, 61, 21)
			GUICtrlSetOnEvent($UI_btn_browsSkins[$i], "btn_skinClicked")
			$UI_in_skins[$i]= GUICtrlCreateInput("", 62, $iOffY, 380, 21)
			GuiCtrlSetLimit(-1, 63)
			$iOffY += 21
		Next
	EndFunc
	Func GUI_Build_TabSprites_MDL()
		GUISwitch($KPModelSkins); return to main UI
		$GUI_Popup_spritesMDL = GUICreate("", 469, 322, 12, 174, $WS_CHILD, -1, $KPModelSkins)

		GUICtrlCreateGroup("Quake/Hexen Flags", 2, -3, 465, 323)
			GUICtrlCreateButton("Flags", 32, 19, 41, 25)
			GUICtrlSetOnEvent(-1, "Button_flags_mdlClick")
			$Input1_flags_mdl = GUICtrlCreateInput("0", 78, 21, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY,$ES_NUMBER))
			GUICtrlSetTip(-1, "Flags.")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
	EndFunc
	Func GUI_Build_TabSprites_MDX()
		Local $iOff

		GUISwitch($KPModelSkins); return to main UI
		$GUI_Popup_spritesMDX = GUICreate("", 469, 322, 12, 174, $WS_CHILD, -1, $KPModelSkins) ;+$WS_DLGFRAME, $WS_EX_CLIENTEDGE

		GUICtrlCreateGroup("Kingpin MDX Sprite Settings", 2, -3 , 465, 323)
			$iOff = 0
			For $i = 0 To 11
				$g_aMDX_sprite_cfg[$i][$SPR_MDX_HW] = fn_UI_MDXSfx_Create($i, 0, $iOff)
				$iOff += 24
			Next
			$iOff = 0
			For $i = 12 To 19 ;2nd column
				if $i = $MDX_SP_ENT_0_V_IDX Then
					$iOff += 6 ;seperate inputs slightly
				EndIf
				$g_aMDX_sprite_cfg[$i][$SPR_MDX_HW] = fn_UI_MDXSfx_Create($i, 156, $iOff)
				$iOff += 24
			Next

			GUICtrlSetOnEvent($g_aMDX_sprite_cfg[$MDX_SP_DEF_0_TYPE][$SPR_MDX_HW], "Combo1_SFX_TypeChange") ; $Combo1_SFX_TypeChange
			GUICtrlSetData($g_aMDX_sprite_cfg[$MDX_SP_DEF_2_DIR][$SPR_MDX_HW], "0: UP|1: Use Face/Vert Direction", "0: UP")
			GUICtrlSetState($g_aMDX_sprite_cfg[$MDX_SP_ENT_1_DEFID][$SPR_MDX_HW], $GUI_DISABLE) ;todo user selected?
			GUICtrlSetData($g_aMDX_sprite_cfg[$MDX_SP_ENT_2_TYPE][$SPR_MDX_HW], "0: Spawn at Vertex|1: Spawn centre of Triangle", "0: Spawn at Vertex")

			$UI_Btn_spriteReset = GUICtrlCreateButton("Reset", 150, 285, 77, 25)
			GUICtrlSetTip(-1, "Return all input boxes to default pistol sfx")
			GUICtrlSetOnEvent(-1, "Button_Sprite_ResetClick")
			$UI_Btn_spriteImport = GUICtrlCreateButton("Import .qdt", 150, 229, 77, 25)
			GUICtrlSetOnEvent(-1, "Button_Sprite_ImportClick")
			$UI_Btn_spriteExport = GUICtrlCreateButton("Export .qdt", 150, 257, 77, 25)
			GUICtrlSetOnEvent(-1, "Button_Sprite_ExportClick")

			GUICtrlCreateGroup("Show on frame/s (0-Based)", 310, 21, 149, 291)
				GUICtrlCreateLabel("Start", 320, 43, 43, 17)
				GUICtrlCreateLabel("End", 390, 43, 35, 17)

				$iOff = 63
				For $i = 0 To 9
					;frame start inputs
					$UI_In_frStart[$i] = GUICtrlCreateInput("0", 318, $iOff, 62, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
					GUICtrlSetLimit(-1, 4) ;4 chars
					GUICtrlCreateUpdown($UI_In_frStart[$i], $UDS_NOTHOUSANDS);$Updown_f_start[$i] =
					GUICtrlSetLimit(-1, 1023, -1)
					GUICtrlSetTip(-1, "Integer")
					;frame end inputs
					$UI_In_frEnd[$i] = GUICtrlCreateInput("0", 390, $iOff, 62, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER));$Updown_f_end[$i] =
					GUICtrlSetLimit(-1, 4) ;4 chars
					GUICtrlCreateUpdown($UI_In_frEnd[$i], $UDS_NOTHOUSANDS)
					GUICtrlSetLimit(-1, 1023, -1)
					GUICtrlSetTip(-1, "Integer")
					$iOff += 24
				Next
			GUICtrlCreateGroup("", -99, -99, 1, 1)

			;sprites buttons
			$UI_Cbox_MDXSfx = GUICtrlCreateCheckbox("Add / Update SFX", 234, 229, 69, 81, BitOR($BS_CHECKBOX,$BS_CENTER,$BS_PUSHLIKE,$BS_MULTILINE))
			GUICtrlSetTip(-1, "Add an SFX entry into the .mdx."&@crlf&"Once SFX is inside an mdx it wont be removed."&@crlf&"To disable set all start/end to -1.")
			GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
			GUICtrlSetOnEvent(-1, "UI_Cbox_MDXSfxClick")
			GUICtrlCreateButton("Flags", 32, 47, 41, 25)
			GUICtrlSetOnEvent(-1, "Button_flagsClick")
			$UI_Img_sprite = GUICtrlCreateLabel("", 146, 25, 32, 32, $SS_SUNKEN)
		GUICtrlCreateGroup("", -99, -99, 1, 1)
	EndFunc
	Func GUI_Build_TabSprites_NONE()
		GUISwitch($KPModelSkins)
		$GUI_Popup_spritesNONE = GUICreate("", 469, 322, 12, 174, $WS_CHILD, -1, $KPModelSkins)

		GUICtrlCreateGroup("", 2, -3, 465, 323)
			;empty group
		GUICtrlCreateGroup("", -99, -99, 1, 1)
	EndFunc
	Func GUI_Build_TabScale()
		GUISwitch($KPModelSkins)
		$GUI_Popup_scale = GUICreate("", 469, 322, 12, 174, $WS_CHILD, -1, $KPModelSkins)

		GUICtrlCreateGroup("Model Scale/Position", 2, -3, 465, 323)
			$UI_CBox_scale = GUICtrlCreateCheckbox("Enable Rescale", 16, 21, 113, 17)
			GUICtrlSetOnEvent(-1, "CheckboxScaleClick")
			GUICtrlCreateLabel("BBox Max XYZ", 10, 49, 81, 17, $SS_RIGHT)
			$UI_in_scale[0] = GUICtrlCreateInput("0.0", 98, 45, 117, 21)
			GUICtrlSetTip(-1, "X")
			$UI_in_scale[1] = GUICtrlCreateInput("0.0", 218, 45, 117, 21)
			GUICtrlSetTip(-1, "Y")
			$UI_in_scale[2] = GUICtrlCreateInput("0.0", 338, 45, 117, 21)
			GUICtrlSetTip(-1, "Z")
			GUICtrlCreateLabel("BBox Min XYZ",          10, 77, 81, 17, $SS_RIGHT)
			$UI_in_scale[3] = GUICtrlCreateInput("0.0", 98, 73, 117, 21)
			GUICtrlSetTip(-1, "X")
			$UI_in_scale[4] = GUICtrlCreateInput("0.0", 218, 73, 117, 21)
			GUICtrlSetTip(-1, "Y")
			$UI_in_scale[5] = GUICtrlCreateInput("0.0", 338, 73, 117, 21)
			GUICtrlSetTip(-1, "Z")
			GUICtrlCreateEdit("", 14, 109, 441, 201, BitOR($ES_AUTOVSCROLL,$ES_AUTOHSCROLL,$ES_READONLY,$ES_WANTRETURN))
			GUICtrlSetData(-1, StringFormat("Scale/reposition models using its bounding-box(BBox) size/position.\r\nThis is non destructive so vertex precision wont be lost.\r\n\r\nOnly effective on the first frame. So its not recommended for animated models.\r\n\r\nBBox Max is the most maximum XYZ position of any vertex.\r\nBBox Min is the most minimum XYZ position of any vertex.\r\n\r\nA pickup item BBox is usually min(-15, -15, -15) max(+15, +15, +15)\r\nIf you want to scale it taller while keeping item on the floor you set max-Z higher.\r\nEg.. min(-15, -15, -15) max(+15, +15, +30)"))
			$UI_Btn_scaleDrop = GUICtrlCreateButton("Drop To Floor", 338, 13, 117, 25)
			GUICtrlSetTip(-1, "Drop Z height to -15")
			GUICtrlSetOnEvent(-1, "btn_scale_dropClick")
			$UI_Btn_scaleCentre = GUICtrlCreateButton("Centre Model", 218, 13, 113, 25)
			GUICtrlSetTip(-1, "Place model at centre origin")
			GUICtrlSetOnEvent(-1, "btn_scale_centreClick")
		GUICtrlCreateGroup("", -99, -99, 1, 1)

	EndFunc
	Func GUI_Build_TabAbout()
		GUISwitch($KPModelSkins)
		$GUI_Popup_about = GUICreate("", 469, 322, 12, 174, $WS_CHILD, $WS_EX_STATICEDGE, $KPModelSkins)

		GUICtrlCreateEdit("", 0, 0, 469, 322, BitOR($ES_READONLY,$ES_WANTRETURN,$WS_VSCROLL), 0)
		GUICtrlSetData(-1, StringFormat( _
			"Created By David Smyth (Hypov8)\r\n" & _
			"===========================\r\n" & _
			"Email: hypov8@hotmail.com\r\n" & _
			"Links: buymeacoffee.com/hypov8\r\n\r\n" & _
			"ABOUT: \r\n=======\r\n" & _
			"Used for changing skins/sprites in md2/mdx files without needing a modelling program.\r\n" & _
			"MDX and MD2 are lossy file formats. Storing vertex position as a single Byte(256 grid units)\r\n" & _
			"So every time you open and save, you may loose vertex precision.\r\n" & _
			"This program stops the data loss by just updating skin/sprite values.\r\n\r\n" & _
			"Output file name is always set when a new model is loaded.\r\n" & _
			"File will be overwritten by default unless you change the Save File Name.\r\n" & _
			"Do take caution updating the original file. Always have a backup.\r\n\r\n" & _
			"Skin path"&Chr(39)&"s can be manually edited/deleted if needed.\r\n\r\n" & _
			"Skin names are truncated if models/, players/, textures/, kingpin/, Quake2/ is found.\r\n\r\n" & _
			"Added Texture size option.\r\nKingpin max size is 480 but value seems irrelevant to render quality.\r\n" & _
			"Quake2 UV now resize for software mode.\r\nFile drag and drop supported for all input boxes.\r\n" & _
			"File [ Open with ] supported.\r\n\r\n" & _
			"USAGE: \r\n=======\r\n" & _
			"#1. Click [ Import ]. Select your md2/mdx file\r\n" & _
			"#2. Click [ File Name ]. If you want to save as a new file\r\n" & _
			"#3. Change skins/sprites as desired. Skin names can be typed.\r\n" & _
			"#4. Click [ GO! ]. This will make a new/updated model with your skins.\r\n\r\n" & _
			"DISCLAIMER: \r\n===========\r\n" & _
			"Care taken writing program but I do not take any responsibility for loss or damages."))
	EndFunc
	Func GUI_Build_Flags()
		Local $iOff	= 34

		$GUI_DMFlags = GUICreate("SFX FLAGS", 484, 500, 2, 2, bitor($WS_POPUP,$WS_DLGFRAME), $WS_EX_TOPMOST, $KPModelSkins)
		GUISetOnEvent($GUI_EVENT_CLOSE, "DMFLAGSClose")
		GUICtrlCreateGroup("Flags", 12, 10, 462, 479)
			For $i = 0 To $COUNT_FLAGS -1
				$UI_Cbox_flags[$i] = GUICtrlCreateCheckbox('', 20, $iOff, 255, 14)
				$UI_Labl_flags[$i] = GUICtrlCreateLabel('', 286, $iOff, 164, 14)
				$iOff += 16
			Next
			GUICtrlCreateButton("Close", 84, $iOff, 309, 45) ;356
			GUICtrlSetOnEvent(-1, "DMFLAGSClose")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		GUISetState(@SW_HIDE, $GUI_DMFlags)
	EndFunc
	Func GUI_Build_msgBox()
		$GUI_msgbox = GUICreate("Info", 145, 118, -1, -1, $WS_SYSMENU, -1, $KPModelSkins)
		GUISetOnEvent($GUI_EVENT_CLOSE, "Form1_msgboxClose", $GUI_msgbox)
		$UI_Btn_msgBox = GUICtrlCreateButton("&OK", 37, 65, 75, 23)
		GUICtrlSetOnEvent(-1, "Form1_msgboxClose")
		GUICtrlCreateLabel("", 0, 0, 138, 57)
		GUICtrlSetBkColor(-1, 0xFFFFFF)
		$UI_label_msgBox1 = GUICtrlCreateLabel("Label1_msgbox", 12, 16, 116, 17)
		GUICtrlSetBkColor(-1, 0xFFFFFF)
		$UI_label_msgBox2 = GUICtrlCreateLabel("Label2_msgbox", 12, 32, 116, 17)
		GUICtrlSetBkColor(-1, 0xFFFFFF)
		GUISetState(@SW_HIDE, $GUI_msgbox)
	EndFunc

	;gui items for sprite tab
	Func fn_UI_MDXSfx_Create($idx, $xOff, $yOff)
		Local Const $x1 = 6, $x2 = 82, $y = 25
		Local $type = $g_aMDX_sprite_cfg[$idx][$SPR_MDX_TYPE]
		Local $sTip = $g_aMDX_sprite_cfg[$idx][$SPR_MDX_TOOLTIP]
		local $label = $g_aMDX_sprite_cfg[$idx][$SPR_MDX_LABEL]
		Local $value = $g_aMDX_sprite_cfg[$idx][$SPR_MDX_VALUE]
		local $ret = -1

		Switch $type
			Case $SP_TYPE_FLG ;has button
				$ret = GUICtrlCreateInput($value, $x2+$xOff, $y+$yOff, 63, 21,  BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY,$ES_NUMBER))
				GUICtrlSetTip(-1, $sTip)
				Return $ret
			Case $SP_TYPE_CBO, $SP_TYPE_SPR
				GUICtrlCreateLabel($label,        $x1+$xOff, $y+$yOff, 70, 21, $SS_RIGHT+$SS_CENTERIMAGE)
				GUICtrlSetTip(-1, $sTip)
				$ret = GUICtrlCreateCombo("",     $x2+$xOff, $y+$yOff, 63, 21, BitOR($GUI_SS_DEFAULT_COMBO, $CBS_SIMPLE))
				GUICtrlSetTip(-1, $sTip)
				Return $ret
			Case $SP_TYPE_INT, $SP_TYPE_PCT, $SP_TYPE_FLT
				GUICtrlCreateLabel($label,        $x1+$xOff, $y+$yOff, 70, 21, $SS_RIGHT+$SS_CENTERIMAGE)
				GUICtrlSetTip(-1, $sTip)
				$ret = GUICtrlCreateInput($value, $x2+$xOff, $y+$yOff, 62, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
				GUICtrlSetTip(-1, $sTip)
				GUICtrlCreateUpdown(-1, $UDS_NOTHOUSANDS)
				If $type = $SP_TYPE_PCT Then
					GUICtrlSetLimit(-1, 100, 0) ;0-100 %
				Else
					GUICtrlSetLimit(-1, 2048, 0)
				EndIf
				GUICtrlSetTip(-1, $sTip)
				Return $ret
			Case Else
				ConsoleWrite("!err1"&@CRLF)
				Return -1
		EndSwitch
		ConsoleWrite("!err1"&@CRLF)
		Return -1
	EndFunc

	Func WM_VSCROLL($hWnd, $iMsg, $wParam, $lParam)
		#forceref $iMsg, $wParam, $lParam
		Local $iScrollCode = BitAND($wParam, 0x0000FFFF)
		Local $iIndex = -1, $iCharY, $iPosY
		Local $iMin, $iMax, $iPage, $iPos, $iTrackPos

		For $x = 0 To UBound($__g_aSB_WindowInfo) - 1
			If $__g_aSB_WindowInfo[$x][0] = $hWnd Then
				$iIndex = $x
				$iCharY = $__g_aSB_WindowInfo[$iIndex][3]
				ExitLoop
			EndIf
		Next
		If $iIndex = -1 Then
			Return 0
		EndIf

		; Get all the vertial scroll bar information
		Local $tSCROLLINFO = _GUIScrollBars_GetScrollInfoEx($hWnd, $SB_VERT)
		$iMin = DllStructGetData($tSCROLLINFO, "nMin")
		$iMax = DllStructGetData($tSCROLLINFO, "nMax")
		$iPage = DllStructGetData($tSCROLLINFO, "nPage")
		; Save the position for comparison later on
		$iPosY = DllStructGetData($tSCROLLINFO, "nPos")
		$iPos = $iPosY
		$iTrackPos = DllStructGetData($tSCROLLINFO, "nTrackPos")

		Switch $iScrollCode
			Case $SB_TOP ; user clicked the HOME keyboard key
				DllStructSetData($tSCROLLINFO, "nPos", $iMin)
			Case $SB_BOTTOM ; user clicked the END keyboard key
				DllStructSetData($tSCROLLINFO, "nPos", $iMax)
			Case $SB_LINEUP ; user clicked the top arrow
				DllStructSetData($tSCROLLINFO, "nPos", $iPos - 1)
			Case $SB_LINEDOWN ; user clicked the bottom arrow
				DllStructSetData($tSCROLLINFO, "nPos", $iPos + 1)
			Case $SB_PAGEUP ; user clicked the scroll bar shaft above the scroll box
				DllStructSetData($tSCROLLINFO, "nPos", $iPos - $iPage)
			Case $SB_PAGEDOWN ; user clicked the scroll bar shaft below the scroll box
				DllStructSetData($tSCROLLINFO, "nPos", $iPos + $iPage)
			Case $SB_THUMBTRACK ; user dragged the scroll box
				DllStructSetData($tSCROLLINFO, "nPos", $iTrackPos)
		EndSwitch

		; // Set the position and then retrieve it.  Due to adjustments
		; //   by Windows it may not be the same as the value set.

		DllStructSetData($tSCROLLINFO, "fMask", $SIF_POS)
		_GUIScrollBars_SetScrollInfo($hWnd, $SB_VERT, $tSCROLLINFO)
		_GUIScrollBars_GetScrollInfo($hWnd, $SB_VERT, $tSCROLLINFO)
		;// If the position has changed, scroll the window and update it
		$iPos = DllStructGetData($tSCROLLINFO, "nPos")
		If ($iPos <> $iPosY) Then
			_GUIScrollBars_ScrollWindow($hWnd, 0, $iCharY * ($iPosY - $iPos))
			$iPosY = $iPos
		EndIf

		Return $GUI_RUNDEFMSG
	EndFunc   ;==>WM_VSCROLL

#EndRegion ;==> END BUILD_GUI

#Region ;==> GUI_UTIL
	fn_Commandline()
	fn_FinishUI()
	fn_Reset_SpriteTab_Data()

	Func fn_Commandline()
		; Startup input filename
		if $CmdLine[0] >= 1 And $CmdLine[1] <> "" Then
			For $i = 0 To $COUNT_MOD -1
				If StringInStr($CmdLine[1], $g_aModelData[$i][1]) Then; todo check trailing chars ;".mdx"
					fn_ImportModel($CmdLine[1])
					ExitLoop
				EndIf
			Next
		EndIf
	EndFunc

	Func GUI_Flags_SetCBoxLable($gameID)
		Switch $gameID
			Case $MOD_MDL
				For $i = 0 To $COUNT_FLAGS -1
					If $g_aFlags_quake[$i][$FLAG_NAME] <> "" Then
						GUICtrlSetData($UI_Cbox_flags[$i], $g_aFlags_quake[$i][$FLAG_NAME])
						GUICtrlSetData($UI_Labl_flags[$i], StringFormat("%s  [ %i ]", $g_aFlags_quake[$i][$FLAG_DEF], BitShift(1, -$i)))
					Else
						GUICtrlSetData($UI_Cbox_flags[$i], '')
						GUICtrlSetData($UI_Labl_flags[$i], '')
					EndIf
				Next
			Case $MOD_MDX
				For $i = 0 To $COUNT_FLAGS -1
					If $g_aFlags_kp1[$i][$FLAG_NAME] <> "" Then
						GUICtrlSetData($UI_Cbox_flags[$i], $g_aFlags_kp1[$i][$FLAG_NAME])
						GUICtrlSetData($UI_Labl_flags[$i],  StringFormat("%s  [ %i ]", $g_aFlags_kp1[$i][$FLAG_DEF], BitShift(1, -$i)))
					Else
						GUICtrlSetData($UI_Cbox_flags[$i], '')
						GUICtrlSetData($UI_Labl_flags[$i], '')
					EndIf
				Next
			Case Else
				For $i = 0 To $COUNT_FLAGS -1
					GUICtrlSetData($UI_Cbox_flags[$i], '')
					GUICtrlSetData($UI_Labl_flags[$i], '')
				Next
		EndSwitch
	EndFunc

	Func fn_FinishUI()
		;set sprites  dropdown strings
		Local $aHW = [$UI_In_import, $UI_Btn_import, $UI_Grp_open, $UI_Grp_exportFile, $UI_In_export]; $UI_Btn_exportFile
		Local $inSprite = ""
		For $i = 0 To $COUNT_SFX_TYPE -1
			$inSprite &= StringFormat("%i: %s|", $g_aMDXSFX_sprite_Cfg[$i][0], $g_aMDXSFX_sprite_Cfg[$i][1]) ;fill mdx sprite combo
		Next
		$inSprite = StringTrimRight($inSprite, 1)
		GUICtrlSetData($g_aMDX_sprite_cfg[$MDX_SP_DEF_0_TYPE][$SPR_MDX_HW], $inSprite) ;$Combo1_SFX_Type

		;==> GUI_DROP_FILES
		for $hw in $aHW
			GUICtrlSetState($hw, $GUI_DROPACCEPTED)
		Next
		For $i = 0 To $iMAXSKIN - 1
			GUICtrlSetState($UI_in_skins[$i], $GUI_DROPACCEPTED)
		Next

		GUISetOnEvent($GUI_EVENT_DROPPED, "fn_dropFile", $KPModelSkins)

		_GUICtrlComboBox_SetDroppedWidth($g_aMDX_sprite_cfg[$MDX_SP_DEF_0_TYPE][$SPR_MDX_HW], 350) ;$Combo1_SFX_Type
		_GUICtrlComboBox_SetDroppedWidth($g_aMDX_sprite_cfg[$MDX_SP_DEF_2_DIR][$SPR_MDX_HW], 150) ;$Combo2_direction
		_GUICtrlComboBox_SetDroppedWidth($g_aMDX_sprite_cfg[$MDX_SP_ENT_2_TYPE][$SPR_MDX_HW], 150) ;$Combo3_vertTri
		;==> END GUI_DROP_FILES
	EndFunc

	Func fn_setUI_SpriteTab_hideMDX()
		For $i = $UI_Group_spriteMDX To $UI_Group_spriteMDL -1
			ControlHide($KPModelSkins, "", $i)
		Next
	EndFunc
	Func fn_setUI_SpriteTab_hideMDL()
		For $i = $UI_Group_spriteMDL To $UI_Group_spriteEmpty -1
			ControlHide($KPModelSkins, "", $i)
		Next
	EndFunc
	Func fn_setUI_SpriteTab_showMDX()
		For $i = $UI_Group_spriteMDX To $UI_Group_spriteMDL -1
			ControlShow($KPModelSkins, "", $i)
		Next
	EndFunc
	Func fn_setUI_SpriteTab_showMDL()
		For $i = $UI_Group_spriteMDL To $UI_Group_spriteEmpty -1
			ControlShow($KPModelSkins, "", $i)
		Next
	EndFunc

	Func fn_setUI_SpriteTab_showState($rebuild = False)
		;rebuild: model changed

		if not ($g_iCurrentTab = 2) Then
			fn_setUI_SpriteTab_hideMDX()
			fn_setUI_SpriteTab_hideMDL()
			ControlHide($KPModelSkins, "", $UI_Group_spriteEmpty)
		Else
			Switch $g_iModelType
				Case $MOD_MDX, $MOD_NONE
					ControlHide($KPModelSkins, "", $UI_Group_spriteEmpty)
					fn_setUI_SpriteTab_hideMDL()
					if $rebuild Then
						fn_setUI_SpriteTab_showMDX()
					EndIf
				Case $MOD_MDL
					ControlHide($KPModelSkins, "", $UI_Group_spriteEmpty)
					fn_setUI_SpriteTab_hideMDX()
					if $rebuild Then
						fn_setUI_SpriteTab_showMDL()
					EndIf
				Case Else
					fn_setUI_SpriteTab_hideMDL()
					fn_setUI_SpriteTab_hideMDX()
					ControlShow($KPModelSkins, "", $UI_Group_spriteEmpty)
			EndSwitch
		EndIf
	EndFunc

	; set the folder for open/save dialog boxes
	Func fn_dropFileSkins($filePath)
		$fileOpenDialogPath = $filePath
		;ConsoleWrite("!set openFile Dialog drop skin= "&$fileOpenDialogPath&@CRLF)
		return fn_TrimFilePath($filePath)
	EndFunc

	; drop files onto GUI
	Func fn_dropFile()
		Switch @GUI_DropId
			Case $UI_Grp_open
				fn_ImportModel(@GUI_DragFile)
			Case $UI_Grp_exportFile
				$g_ExportFileName = @GUI_DragFile
				GUICtrlSetData($UI_In_export, @GUI_DragFile)
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
		GUIDelete($KPModelSkins)
		GUIDelete($GUI_msgbox)
		GUIDelete($GUI_DMFlags)
		Exit
	EndFunc

	Func fn_Swap4Bytes($sBytes)
		local $a1 = StringSplit($sBytes,"", 1)
		If $a1[0] = 8 Then
			Return $a1[7]&$a1[8] & $a1[5]&$a1[6] & $a1[3]&$a1[4] & $a1[1]&$a1[2]
		Else
			ConsoleWrite ("!ERROR: Swap4Bytes= "&$sBytes&@CRLF)
			Return $sBytes
		EndIf
	EndFunc ;==> end fn_Swap4Bytes

	Func fn_Swap2Bytes($sBytes)
		local $a1 = StringSplit($sBytes,"", 1)
		If $a1[0] = 4 Then
			Return $a1[3]&$a1[4] & $a1[1]&$a1[2]
		Else
			ConsoleWrite ("!ERROR: Swap2Bytes= "&$sBytes&@CRLF)
			Return $sBytes
		EndIf
	EndFunc

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
			;~ ConsoleWrite("!set openFile Dialog= "&$fileOpenDialogPath&@CRLF)
		EndIf
	EndFunc

	Func fn_SetUI_WH($width, $height)
		GUICtrlSetData($UI_In_sizeW, $width) ;set GUI skin size
		GUICtrlSetData($UI_In_sizeH, $height) ;set GUI skin size
	EndFunc

	Func btn_importClick()
		Local $fileName, $sTmp = ""
		For $i = 0 To $COUNT_MOD -1
			$sTmp &= StringFormat("*%s;", $g_aModelData[$i][1])
		Next
		$sTmp = StringFormat("Models (%s)", $sTmp)

		$fileName = FileOpenDialog("Models", $fileOpenDialogPath, $sTmp,1 ,"", $KPModelSkins) ;"Models (*.md2;*.mdx)"
		If not @error Then
			fn_ImportModel($fileName)
		EndIf
	EndFunc

	;set output file name
	Func btn_export_fileClick()
		if $g_iModelType = $MOD_NONE Then
			fn_MSG_box("Input file invalid.", "", 1)
			Return
		EndIf

		Local $sName = StringFormat("%s Models", $g_aModelData[$g_iModelType][0])
		Local $fileName = FileSaveDialog( $sName, $fileOpenDialogPath, _ ;"Kingpin Models (*.mdx)"
			StringFormat("%s (*%s)", $sName, $g_aModelData[$g_iModelType][1]) ,2 ,"", $KPModelSkins)

		If not @error Then
			$g_ExportFileName = $fileName
			fn_SetCurrentFolder($fileName)
			GUICtrlSetData($UI_In_export, $fileName)
		EndIf
	EndFunc

#EndRegion ;==> END GUI_UTIL

#Region ;==> fn_ReadHeader_ ; (get header data)
	Func fn_ReadHeader_Lump(ByRef $bFile, $end)
		For $i = 2 To $end
			$g_aHeaderData[$i] = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8)))
		Next
	EndFunc

	Func fn_ReadHeader_MD2(ByRef $bFile, $hdr_magic, $hdr_version) ;, ByRef $numSkins)
		Local $start, $end

		;read header lump
		fn_ReadHeader_Lump($bFile, $HDR_MD2_OFF_END)
		;set lump sizes from headers
		fn_lumpSize_calculate($HDR_MD2_OFF_SKIN, $OFF_MD2_END -1)
		;fix invalid end of file
		fn_lumpSize_fix($bFile, $g_aHeaderData[$HDR_MD2_OFF_END], $g_aLumpSize[$OFF_MD2_END - 1])
		;set UI image dimensions
		fn_SetUI_WH($g_aHeaderData[$HDR_MD2_SKIN_W], $g_aHeaderData[$HDR_MD2_SKIN_H])

		;update UI etc
		$g_aHeaderData[$HDR_MD2_ID]  = $hdr_magic   ;#0
		$g_aHeaderData[$HDR_MD2_VER] = $hdr_version ;#1
		;$numSkins = $g_aHeaderData[$HDR_MD2_NUM_SKIN] ;todo remove this
	EndFunc

	Func fn_ReadHeader_MDX(ByRef $bFile, $hdr_magic, $hdr_version) ;, ByRef $numSkins)
		;read header lump
		fn_ReadHeader_Lump($bFile, $HDR_MDX_OFF_END)
		;set lump sizes from headers
		fn_lumpSize_calculate($HDR_MDX_OFF_SKIN, $OFF_MDX_END -1)
		;fix invalid end of file ;$g_aLumpSize[$OFF_MDX_END]
		fn_lumpSize_fix($bFile, $g_aHeaderData[$HDR_MDX_OFF_END], $g_aLumpSize[$OFF_MDX_END - 1])
		;set UI image dimensions
		fn_SetUI_WH($g_aHeaderData[$HDR_MDX_SKIN_W], $g_aHeaderData[$HDR_MDX_SKIN_H])

		;update UI etc
		$g_aHeaderData[$HDR_MDX_ID]  = $hdr_magic
		$g_aHeaderData[$HDR_MDX_VER] = $hdr_version
		;$numSkins = $g_aHeaderData[$HDR_MDX_NUM_SKIN]

		;enable checkbox for sprites
		if ($g_aHeaderData[$HDR_MDX_NUM_SFX_DEF] >= 1) And ($g_aHeaderData[$HDR_MDX_NUM_SFX_ENT] >= 1) Then
			GUICtrlSetState($UI_Cbox_MDXSfx, $GUI_CHECKED)
		EndIf
	EndFunc

	Func fn_ReadHeader_MDL(ByRef $bFile, $hdr_magic, $hdr_version) ;, ByRef $numSkins)
		Local $start, $end, $w, $h, $numTri, $numVert, $numFrames

		;header lump
		fn_ReadHeader_Lump($bFile, $HDR_MDL_SIZE)

		fn_SetUI_WH($g_aHeaderData[$HDR_MDL_SKIN_W], $g_aHeaderData[$HDR_MDL_SKIN_H])

		;update UI etc
		$g_aHeaderData[$HDR_MDL_ID]  = $hdr_magic
		$g_aHeaderData[$HDR_MDL_VER] = $hdr_version
	EndFunc

	Func fn_ReadHeader_MD3(ByRef $bFile, $hdr_magic, $hdr_version) ;, ByRef $numSkins)
		Local $start, $end

		;header lump
		;~ fn_ReadHeader_Lump($bFile, $HDR_MD3_OFF_END)..
		$g_aHeaderData[$HDR_MD3_PATH] = _HexToString(FileRead($bFile, 64)) ;todo: file path
		For $i = $HDR_MD3_FLAGS To $HDR_MD3_OFF_END
			$g_aHeaderData[$i] = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8)))
		Next

		$g_aHeaderData[$HDR_MDL_ID]  = $hdr_magic
		$g_aHeaderData[$HDR_MDL_VER] = $hdr_version
	EndFunc

#EndRegion ;==> END fn_ReadHeader_

#Region ;==> fn_lumpSize
	Func fn_lumpSize_calculate($iOffset, $iEnd)
		Local $start, $end
		For $i = 0 To $iEnd ;$COUNT_OFF_MDX-2
			$start = $g_aHeaderData[$iOffset +$i +0] ; lump position in header
			$end   = $g_aHeaderData[$iOffset +$i +1] ; next lump
			$g_aLumpSize[$i] = $end - $start ;calculate chunk size
			;ConsoleWrite(StringFormat("start: %-6i  end: %-6i  size: %-6i\n", $start, $end, $end - $start))
		Next
	EndFunc

	Func fn_lumpSize_fix(ByRef $bFile, ByRef $hdrEnd, ByRef $lumpSize)

		FileSetPos($bFile, 0, $FILE_END)
		Local $len = FileGetPos($bFile) - $hdrEnd

		if $len > 0 Then
			$lumpSize += $len ;increase lump size
			$hdrEnd += $len ;update offset
			ConsoleWrite("!ERROR: end of file size incorrect"&@CRLF)
		EndIf
	EndFunc
#EndRegion

#Region ;==> fn_GetFromLump_ (get data from stored lumps)
	Func fn_GetFromLump_Skins(ByRef $skinLump, $numSkins)
		Local $aSkins[$iMAXSKIN]
		local $sTmp = _HexToString($skinLump)
		For $i = 0 To $numSkins -1
			$aSkins[$i] = StringLeft($sTmp, 64)
			$sTmp = StringTrimLeft($sTmp, 64)
		Next
		Return $aSkins
	EndFunc

	Func fn_GetFromLump_texCords(ByRef $lump, $count)
		;~ Local $count = $g_aHeaderData[$HDR_MD2_NUM_TEX_CORD]
		Local $texWidth = $g_aHeaderData[$HDR_MD2_SKIN_W]
		Local $texHeight = $g_aHeaderData[$HDR_MD2_SKIN_H]
		Local $iOff, $aTexCoords[$count][2]

		For $i = 0 To $count - 1
			$iOff = $i*8 +1 ;1-based string
			$aTexCoords[$i][0] = fn_readLump_SHORT($lump, $iOff+0) / $texWidth
			$aTexCoords[$i][1] = fn_readLump_SHORT($lump, $iOff+4) / $texHeight
		Next
		Return $aTexCoords
	EndFunc

#EndRegion ;==> END fn_GetFromLump_

#Region ;==> fn_ReadFileLump_ (get full lump from file)
	;read lump into hex string
	Func fn_ReadFileLump(ByRef $bFile, $offset, $size)
		FileSetPos($bFile, $offset, $FILE_BEGIN)
		Return hex(FileRead($bFile, $size))
	EndFunc

	Func fn_ReadFileLump_MDX(ByRef $bFile)
		For $i = 0 To $COUNT_OFF_MDX -1
			$g_aLumpData[$i] = fn_ReadFileLump($bFile, $g_aHeaderData[$HDR_MDX_OFF_SKIN + $i], $g_aLumpSize[$i])
		Next
	EndFunc

	Func fn_ReadFileLump_MD2(ByRef $bFile)
		For $i = 0 To $COUNT_OFF_MD2 -1
			$g_aLumpData[$i] = fn_ReadFileLump($bFile, $g_aHeaderData[$HDR_MD2_OFF_SKIN + $i], $g_aLumpSize[$i])
		Next
	EndFunc

	Func fn_ReadFileLump_MD3(ByRef $bFile)
		Local $iCurOffset, $iNumShad, $iOffsShad, $iOffsEnd
		;Local $numSkins = $g_aHeaderData[$HDR_MD3_NUM_SKIN] ; not used
		Local $iSkinCount = 0

		;seek to first md3 surface
		$iCurOffset = $g_aHeaderData[$HDR_MD3_OFF_SURF]
		FileSetPos($bFile, $iCurOffset, $FILE_BEGIN)
		ConsoleWrite("current offs=" & $iCurOffset&@CRLF)

		;each surface can have multiple shaders defined
		for $i1 = 1 to $g_aHeaderData[$HDR_MD3_NUM_SURF] ;num surf
			FileSetPos($bFile, 4+64+4+4, $FILE_CURRENT) ; seek to NUM_SHADERS
			$iNumShad = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8))) ;+76

			FileSetPos($bFile, 12, $FILE_CURRENT) ;seek to OFS_SHADERS
			$iOffsShad = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8))) ;+12

			FileSetPos($bFile, 8, $FILE_CURRENT) ;seek to OFS_END
			$iOffsEnd = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8))) ;+4
			FileSetPos($bFile, $iCurOffset + $iOffsShad, $FILE_BEGIN)

			for $j = 0 to $iNumShad -1 ;num surf
				If $iSkinCount < $iMAXSKIN Then ;max skin count
					$g_aLumpSize[$iSkinCount] = FileGetPos($bFile) ; $iCurOffset + $iOffsShad +( ($i2-1)*68) ;save file offset
					$g_aLumpData[$iSkinCount] = Hex(FileRead($bFile, 64))
					$iSkinCount += 1
					FileSetPos($bFile, 4, $FILE_CURRENT) ;skip SHADER_INDEX
				EndIf
			Next

			;move to next object
			$iCurOffset += $iOffsEnd
			ConsoleWrite("current offs=" & $iCurOffset&@CRLF)
			FileSetPos($bFile, $iCurOffset, $FILE_BEGIN) ; seek to SURFACE_START
		Next
		;update header
		$g_aHeaderData[$HDR_MD3_NUM_SKIN] = $iSkinCount
	EndFunc

	Func fn_ReadFileLump_MDL(ByRef $bFile)
		;todo no lump data needed. yet
		;GUICtrlSetData($Input1_flags_mdl, $g_MDl_flags)
	EndFunc
#EndRegion ;END ==> fn_ReadFileLump_

#Region ;==> fn_UIFill_ (Fill UI from data)
	Func fn_UIFill_SkinInput($aSkins, $num)
		For $i = 0 To $num - 1
			GUICtrlSetData($UI_in_skins[$i], $aSkins[$i])
		Next
		For $i =  $num To $iMAXSKIN - 1
			GUICtrlSetData($UI_in_skins[$i], "")
		Next
	EndFunc
	Func fn_UIFill_MDXSfxDef($aSFXDef, $num)
		if $num > 0 Then
			For $i = 0 To 16
				fn_MDX_SFX_SetUI($i, $aSFXDef[$i])
			Next
		EndIf
	EndFunc
	Func fn_UIFill_MDXSfxEnt($aSFXEnt, $num)
		If $num Then
			Local $frames = $aSFXEnt[3]
			For $i = 0 To 2
				fn_MDX_SFX_SetUI(17+$i, $aSFXEnt[$i])
			Next
			if IsArray($frames) Then
				For $i = 0 to UBound($frames) -1
					if $i < 10 Then
						GUICtrlSetData($UI_In_frStart[$i], $frames[$i][0])
						GUICtrlSetData($UI_In_frEnd[$i],   $frames[$i][1])
					EndIf
				Next
			EndIf
		EndIf
	EndFunc
	Func fn_UIFill_MDL_Flags($flags)
		GUICtrlSetData($Input1_flags_mdl, $flags)
	EndFunc

	Func fn_fill_UI_MDX()
		local $aSkins    = fn_GetFromLump_Skins($g_aLumpData[$OFF_MDX_SKIN], $g_aHeaderData[$HDR_MDX_NUM_SKIN])
		Local $aSFXDef   = fn_getMDX_SfxDef_fromLump($g_aLumpData[$OFF_MDX_SFX_DEF], $g_aHeaderData[$HDR_MDX_NUM_SFX_DEF])
		Local $aSFXEntry = fn_getMDX_SfxEnt_fromLump($g_aLumpData[$OFF_MDX_SFX_ENT], $g_aHeaderData[$HDR_MDX_NUM_SFX_ENT])
		Local $aScale    = fn_getMDX_Scale_fromLump($g_aLumpData[$OFF_MDX_FRAME])

		fn_UIFill_SkinInput($aSkins, $g_aHeaderData[$HDR_MDX_NUM_SKIN])
		fn_UIFill_MDXSfxDef($aSFXDef, $g_aHeaderData[$HDR_MDX_NUM_SFX_DEF])
		fn_UIFill_MDXSfxEnt($aSFXEntry, $g_aHeaderData[$HDR_MDX_NUM_SFX_ENT])
		fn_SetUI_Scale($aScale)

		;check for incorrect offsets
		If  $g_aLumpSize[$OFF_MDX_TRI] < 0  _
		Or	$g_aLumpSize[$OFF_MDX_FRAME] < 0  _
		Or	$g_aLumpSize[$OFF_MDX_GLCMD] < 0  _
		Or	$g_aLumpSize[$OFF_MDX_VERTINFO] < 0 _
		Or	$g_aLumpSize[$OFF_MDX_BBOXFRAME] < 0 _
		Or	$g_aLumpSize[$OFF_MDX_DUMMYEND] < 0 Then
			;todo error EOF
			fn_MSG_box("Input file offset issue.", "This may effect output.")
		EndIf
	EndFunc

	Func fn_fill_UI_MD2()
		local $aSkins = fn_GetFromLump_Skins($g_aLumpData[$OFF_MD2_SKIN], $g_aHeaderData[$HDR_MD2_NUM_SKIN])
		Local $aScale = fn_getMD2_Scale_fromLump($g_aLumpData[$OFF_MD2_FRAME])

		fn_UIFill_SkinInput($aSkins,  $g_aHeaderData[$HDR_MD2_NUM_SKIN])
		fn_SetUI_Scale($aScale)

		If  $g_aLumpSize[$OFF_MD2_TEXCOORD] < 0  _
		Or	$g_aLumpSize[$OFF_MD2_TRI] < 0  _
		Or	$g_aLumpSize[$OFF_MD2_FRAME] < 0  _
		Or	$g_aLumpSize[$OFF_MD2_GLCMD] < 0 Then
			fn_MSG_box("Input file offset issue.", "This may effect output.", 1)
		EndIf
	EndFunc

	Func fn_fill_UI_MD3()
		Local $aSkins[$iMAXSKIN]
		Local $iSkinCount = $g_aHeaderData[$HDR_MD3_NUM_SKIN]

		For $i = 0 To $iSkinCount -1
			$aSkins[$i] = fn_StripNullFromString(_HexToString($g_aLumpData[$i]));lumps are skin hex strings
		Next
		For $i = $iSkinCount To $iMAXSKIN-1
			$aSkins[$i] = ""
		Next
		fn_UIFill_SkinInput($aSkins, $iMAXSKIN) ;$g_aHeaderData[$HDR_MD3_NUM_SKIN]
	EndFunc

	Func fn_fill_UI_MDL()
		;only flags supported
		Local $flags = $g_aHeaderData[$HDR_MDL_FLAGS]
		fn_UIFill_MDL_Flags($flags)
	EndFunc
#EndRegion ;END ==> fn_UIFill_

#Region ;==> IMPORT
	Func fn_ImportModel($fileName)
		local $numSkins, $hdr_version, $hdr_magic, $bFile
		$g_ImportFileName =""
		$g_ExportFileName =""

		if FileExists($fileName) Then
			GUICtrlSetData($UI_In_import, $fileName)
			GUICtrlSetData($UI_In_export, $fileName)
			$g_ImportFileName = $fileName
			$g_ExportFileName = $fileName
			$g_iModelType = $MOD_NONE
			fn_SetCurrentFolder($fileName); set recent folder
			GUICtrlSetState($UI_Cbox_MDXSfx, $GUI_UNCHECKED);set SFX buton to default OFF

			$bFile = FileOpen($fileName , 16) ;$FO_UTF16_LE ) ;binary mode
			$hdr_magic   = hex(FileRead($bFile, 4))
			$hdr_version = _WinAPI_SwapDWord(dec(hex(FileRead($bFile, 4), 8)))
			ConsoleWrite("--> header_magic = " & _HexToString($hdr_magic)&@CRLF)
			ConsoleWrite("--> header_magic = " & $hdr_magic&@CRLF)
			ConsoleWrite("--> $hdr_version = " & $hdr_version&@CRLF)

			;read header
			;================ MDX ================
			if $hdr_magic == "49445058" And $hdr_version = 4 Then ;IDPX
				$g_iModelType = $MOD_MDX
				fn_ReadHeader_MDX($bFile, $hdr_magic, $hdr_version)
			;
			;================ MD2 ================
			ElseIf $hdr_magic == "49445032" And $hdr_version = 8 Then ;IDP2
				$g_iModelType = $MOD_MD2
				fn_ReadHeader_MD2($bFile, $hdr_magic, $hdr_version)
			;
			;================ MD3 ================
			ElseIf $hdr_magic == "49445033" And $hdr_version = 15 Then ;IDP3
				ConsoleWrite("found MD3" &@CRLF)
				$g_iModelType = $MOD_MD3
				fn_ReadHeader_MD3($bFile, $hdr_magic, $hdr_version)
			;
			;================ MDL ================
			ElseIf $hdr_magic == "4944504F" And $hdr_version = 6 Then ;IDPO
				ConsoleWrite("found MDL" &@CRLF)
				$g_iModelType = $MOD_MDL
				fn_ReadHeader_MDL($bFile, $hdr_magic, $hdr_version)
			;
			;================ unknown ================
			Else
				FileClose($bFile)
				fn_MSG_box("File Invalid.")
				Return
			EndIf

			;================
			;read file lumps
			Switch $g_iModelType
				Case $MOD_MDX ; mdx
					fn_ReadFileLump_MDX($bFile)
				Case $MOD_MD2 ; md2
					fn_ReadFileLump_MD2($bFile)
				Case $MOD_MD3 ; md3
					fn_ReadFileLump_MD3($bFile)
				Case $MOD_MDL ; mdl
					fn_ReadFileLump_MDL($bFile)
				Case Else
					FileClose($bFile)
					fn_MSG_box("File Invalid.")
					Return
			EndSwitch

			FileClose($bFile) ;close file

			fn_ResetSkinInput() ;clear old skins
			fn_Reset_SpriteTab_Data()
			fn_Reset_Scale()

			;fill UIwith data
			Switch $g_iModelType
				Case $MOD_MDX
					fn_fill_UI_MDX()
				Case  $MOD_MD2
					fn_fill_UI_MD2()
				Case $MOD_MDL
					fn_fill_UI_MDL()
				Case $MOD_MD3
					fn_fill_UI_MD3()
				Case Else
					fn_MSG_box("File Invalid.")
					Return
			EndSwitch

			UI_Tabs()
		EndIf;==>end FileExists

	EndFunc ;==>end fn_ImportModel

#EndRegion ;==> END IMPORT

#Region ;==> EXPORT
	Func fn_padHexData($data, $len)
		local $newLen = $len*2 ;hex is 2 char per byte
		local $currLen = StringLen($data)

		If $currLen >= $newLen Then
			;trim if needed
			;~ ConsoleWrite("+len2:"&StringLen($len)& ' str:'&StringLeft($data, $newLen)&@CRLF)
			return StringLeft($data, $newLen)
		Else
			local $ret = $data
			For $i = $currLen To $newLen-1
				$ret &= "0"
			Next
			;~ ConsoleWrite("+len2:"&StringLen($ret)& ' str:'&$ret&@CRLF)
			Return $ret
		EndIf
	EndFunc

	Func fn_Export_MergeData($new, $old, $size)
		Local $ret = ""
		Local $lenNew = StringLen($new)
		$ret = $new & StringTrimLeft($old, $lenNew)
		If StringLen($ret) = ($size*2) Then ;hex is 2x
			Return $ret
		EndIf
		;fix len
		ConsoleWrite("!ERROR: lump merge size failed"&@CRLF)
		Return fn_padHexData($ret, $size)
	EndFunc

	Func fn_Export_TrimStartData($data, $size)
		Return StringTrimLeft($data, $size*2) ;hex is 2x
	EndFunc

	Func fn_Export_MDX()
		Local $aSkins[$iMAXSKIN], $aScale, $curOff, $skinCount, $skinWidth, $skinHeight, $numSfxDef, $numSfxEnt
		Local $bFile = FileOpen($g_ExportFileName, $FO_OVERWRITE+$FO_CREATEPATH+$FO_BINARY)
		if $bFile = -1 Then
			fn_MSG_box("Can't open output file.")
			Return
		EndIf

		$skinCount = fn_ProcessInputSkins($aSkins)
		$skinWidth = GUICtrlRead($UI_In_sizeW)
		$skinHeight= GUICtrlRead($UI_In_sizeH)
		$numSfxDef = $g_aHeaderData[$HDR_MDX_NUM_SFX_DEF]
		$numSfxEnt = $g_aHeaderData[$HDR_MDX_NUM_SFX_ENT]
		ConsoleWrite("--> File MDX"&@CRLF)

		if _IsChecked($UI_Cbox_MDXSfx) Then
			if ($numSfxDef = 0) Then
				$numSfxDef = 1
			EndIf
			if ($numSfxEnt = 0) Then
				$numSfxEnt = 1
			EndIf
		EndIf
		ConsoleWrite("$numSfxDef:"&$numSfxDef&" $numSfxEnt:"&$numSfxEnt&@CRLF)

		$g_aHeaderData[$HDR_MDX_NUM_SKIN]    = $skinCount
		$g_aHeaderData[$HDR_MDX_SKIN_W]      = $skinWidth
		$g_aHeaderData[$HDR_MDX_SKIN_H]      = $skinHeight
		$g_aHeaderData[$HDR_MDX_NUM_SFX_DEF] = $numSfxDef
		$g_aHeaderData[$HDR_MDX_NUM_SFX_ENT] = $numSfxEnt

		;write header data
		FileWrite($bFile, "0x"&$g_aHeaderData[$HDR_MDX_ID]) ;IPDX
		for $iI = 1 to $HDR_MDX_NUM_SUBOBJ ;$HDR_MDX_VER
			;~ ConsoleWrite('>data:'&$g_aHeaderData[$iI]&@CRLF)
			FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($g_aHeaderData[$iI], 8)))
		Next

		;fix lump sizes
		$g_aLumpSize[$OFF_MDX_SKIN]    = $skinCount*64
		$g_aLumpSize[$OFF_MDX_SFX_DEF] = $numSfxDef*$iSFX_DEF_SIZE ;17*int (sdk=68)
		$g_aLumpSize[$OFF_MDX_SFX_ENT] = $numSfxEnt*$iSFX_ENTRY_SIZE ;3*int + 64bytes (sdk=140)

		;write header offsets
		$curOff = 23*4 ;header size
		FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($curOff, 8))) ;offset skins
		For $i = 0 to $OFF_MDX_END -1
			$curOff += $g_aLumpSize[$i]
			;~ ConsoleWrite(StringFormat('-lumpSize: %-6i  offset: %-6i\n', $g_aLumpSize[$i], $curOff))
			FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($curOff, 8)))
		Next

		;write skins
		For $i1 = 0 To $skinCount -1
			FileWrite($bFile, "0x"&fn_padHexData(_StringToHex($aSkins[$i1]), 64))
		Next

		;write triangle data
		FileWrite($bFile, "0x"& $g_aLumpData[$OFF_MDX_TRI])

		;write frame scale (frame header)
		If _IsChecked($UI_CBox_scale) Then
			$aScale = fn_GetUI_Scale()
			Local $tmpData = ""
			For $iI = 0 to 5 ;float
				FileWrite($bFile, "0x"&fn_Swap4Bytes(hex(_WinAPI_FloatToInt($aScale[$iI]), 8)))
			Next
			FileWrite($bFile, "0x"& fn_Export_TrimStartData($g_aLumpData[$OFF_MDX_FRAME], 6*4))
		Else
			FileWrite($bFile, "0x"& $g_aLumpData[$OFF_MDX_FRAME])
		EndIf

		;write gl commands
		FileWrite($bFile, "0x"& $g_aLumpData[$OFF_MDX_GLCMD])

		;write vertex info (object ID)
		FileWrite($bFile, "0x"& $g_aLumpData[$OFF_MDX_VERTINFO])

		if _IsChecked($UI_Cbox_MDXSfx) Then
			;mdx write SFX
			Local  $aDefData[17], $aEntryData[4], $aFrameRange[10][2]
			Local $numSfxDef = $g_aHeaderData[$HDR_MDX_NUM_SFX_DEF]
			Local $numSfxEnt = $g_aHeaderData[$HDR_MDX_NUM_SFX_ENT]

			;setup local arrays with gui data
			fn_MDX_ReadSpriteTab_Data($aDefData, $aEntryData, $aFrameRange)

			if ($numSfxDef > 0) Then
				For $iI = 0 to 3 ;integer
					FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($aDefData[$iI], 8)))
				Next
				FileWrite($bFile, "0x"&fn_Swap4Bytes(hex(_WinAPI_FloatToInt($aDefData[4]), 8)))
				FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($aDefData[5], 8)))
				For $iI = 6 to $COUNT_SFX_DEF -1 ;float
					FileWrite($bFile, "0x"&fn_Swap4Bytes(hex(_WinAPI_FloatToInt($aDefData[$iI]), 8)))
				Next
				;write extra entries
				if ($numSfxDef > 1) Then
					FileWrite($bFile, "0x"&fn_Export_TrimStartData($g_aLumpData[$OFF_MDX_SFX_DEF], $iSFX_DEF_SIZE))
				EndIf
			EndIf ;==> end sfx defines

			if ($numSfxEnt > 0) Then
				Local $sFrames
				ConsoleWrite("!numSfxEnt count:"&$numSfxEnt&@CRLF)
				FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($aEntryData[0], 8))) ; vertex # ;g_sMDX_SFX_defData
				FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($aEntryData[1], 8))) ; sfx define index
				FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($aEntryData[2],  8))) ; 0=vertex

				;write sprite frames
				fn_MDXSfx_FramesToBits($aFrameRange, $sFrames)
				$sFrames = fn_padHexData($sFrames, 128) ;check len
				FileWrite($bFile, "0x"&$sFrames)

				;write extra entries
				if ($numSfxEnt > 1) Then
					;todo check 64byte version(512 frames). note: i suspect multi entries are allways 1024
					FileWrite($bFile, "0x"&fn_Export_TrimStartData($g_aLumpData[$OFF_MDX_SFX_ENT], $iSFX_ENTRY_SIZE))
				EndIf
			EndIf ;==> end sfx entries
		EndIf

		;write bbox data
		FileWrite ( $bFile, "0x"& $g_aLumpData[$OFF_MDX_BBOXFRAME])
		;write dummy data
		FileWrite ( $bFile, "0x"& $g_aLumpData[$OFF_MDX_DUMMYEND])
		;write end data
		FileWrite($bFile, "0x"& $g_aLumpData[$OFF_MDX_END]) ;write any additional data that was not referenced properly

		FileClose($bFile)
	EndFunc

	Func fn_Export_MD2()
		Local $aSkins[$iMAXSKIN], $aScale, $skinCount, $skinWidth, $skinHeight
		Local $bFile = FileOpen($g_ExportFileName, $FO_OVERWRITE+$FO_CREATEPATH+$FO_BINARY)
		if $bFile = -1 Then
			fn_MSG_box("Can't open output file.")
			Return
		EndIf

		$skinCount = fn_ProcessInputSkins($aSkins)
		$skinWidth = GUICtrlRead($UI_In_sizeW)
		$skinHeight= GUICtrlRead($UI_In_sizeH)
		ConsoleWrite("--> File MD2"&@CRLF)

		$g_aHeaderData[$HDR_MD2_NUM_SKIN] = $skinCount
		$g_aHeaderData[$HDR_MD2_SKIN_W]   = $skinWidth
		$g_aHeaderData[$HDR_MD2_SKIN_H]   = $skinHeight

		;write data
		FileWrite($bFile, "0x"&$g_aHeaderData[$HDR_MD2_ID]) ;IPD2
		for $iI = 1 to $HDR_MD2_NUM_FRAME ;$HDR_MD2_VER
			FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($g_aHeaderData[$iI], 8)))
		Next

		;fix lump sizes
		$g_aLumpSize[$OFF_MD2_SKIN] = $skinCount*64

		;write header offsets
		Local $curOff = 17*4 ;header size
		FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($curOff, 8))) ;write skins pos. begin after header size
		For $i = 0 to $OFF_MD2_END -1
			$curOff += $g_aLumpSize[$i]
			ConsoleWrite(StringFormat('-lumpSize: %-6i  offset: %-6i\n', $g_aLumpSize[$i], $curOff))
			FileWrite($bFile, "0x"&fn_Swap4Bytes(hex($curOff, 8)))
		Next

		;write skin
		For $i1 = 0 To $skinCount -1
			FileWrite($bFile, "0x"&fn_padHexData(_StringToHex($aSkins[$i1]), 64))
		Next

		;md2 write textcords
		Local $aTexCoords = fn_GetFromLump_texCords($g_aLumpData[$OFF_MD2_TEXCOORD], $g_aHeaderData[$HDR_MD2_NUM_TEX_CORD])
		For $i1 = 0 To UBound($aTexCoords) -1 ; $g_aHeaderData[$HDR_MD2_NUM_TEX_CORD] -1
			FileWrite($bFile, "0x"&fn_Swap2Bytes(hex(int($aTexCoords[$i1][0]*$skinWidth), 4))) ;fn_Swap2Bytes
			FileWrite($bFile, "0x"&fn_Swap2Bytes(hex(Int($aTexCoords[$i1][1]*$skinHeight), 4))) ;fn_Swap2Bytes
		Next

		;write triangle data
		FileWrite($bFile, "0x"&$g_aLumpData[$OFF_MD2_TRI])

		;write frame scale (frame header)
		If _IsChecked($UI_CBox_scale) Then
			$aScale = fn_GetUI_Scale()
			For $iI = 0 to 5 ;float
				FileWrite($bFile, "0x"&fn_Swap4Bytes(hex(_WinAPI_FloatToInt($aScale[$iI]), 8)))
			Next
			FileWrite($bFile, "0x"& fn_Export_TrimStartData($g_aLumpData[$OFF_MD2_FRAME], 6*4))
		Else
			FileWrite($bFile, "0x"& $g_aLumpData[$OFF_MD2_FRAME])
		EndIf

		;write gl commands
		FileWrite($bFile, "0x"& $g_aLumpData[$OFF_MD2_GLCMD]) ;$model_DATA_GLComands)
		ConsoleWrite("-glcmd:"&$g_aLumpData[$OFF_MD2_GLCMD]&@CRLF)
		;write end data
		FileWrite($bFile, "0x"& $g_aLumpData[$OFF_MD2_END]) ;$model_DATA_END) ;write any additional data that was not referenced properly
		ConsoleWrite(">end:"&$g_aLumpData[$OFF_MD2_END]&@CRLF)
		FileClose($bFile)
	EndFunc

	Func fn_Export_MDL()
		Local $hFile, $nBytes, $tBuffer, $iLen, $skinHex

		;load file
		$hFile = _WinAPI_CreateFile($g_ExportFileName, 2, 4)
		if not $hFile Then
			fn_MSG_box("Can't open output file.")
			Return
		EndIf

		;write unsigned int to model flags
		$tBuffer = DllStructCreate("UINT")
		DllStructSetData($tBuffer, 1, int(GUICtrlRead($Input1_flags_mdl))) ;"0x"& ;$g_MDl_flags
		_WinAPI_SetFilePointer($hFile, 76, $FILE_BEGIN)
		_WinAPI_WriteFile($hFile, $tBuffer, 4, $nBytes)
		ConsoleWrite("!bytes:"&$nBytes&@CRLF)
		_WinAPI_CloseHandle($hFile)
	EndFunc

	Func fn_Export_MD3()
		Local $hFile, $nBytes, $tBuffer, $iLen, $aSkins[$iMAXSKIN]
		Local $iSkinCount = $g_aHeaderData[$HDR_MD3_NUM_SKIN]

		;load file
		$hFile = _WinAPI_CreateFile($g_ExportFileName, 2, 4)
		if not $hFile Then
			fn_MSG_box("Can't open output file.")
			Return
		EndIf

		fn_ProcessInputSkins($aSkins) ; get skin from input boxes

		;overwrite file
		$tBuffer = DllStructCreate("byte[64]")
		For $i = 0 To $iSkinCount-1 ; $iMAXSKIN -1
			;~ If  > 0 Then$g_aLumpSize[$i]
			DllStructSetData($tBuffer, 1, "0x"&fn_padHexData(_StringToHex($aSkins[$i]), 64))
			_WinAPI_SetFilePointer($hFile, $g_aLumpSize[$i], $FILE_BEGIN)
			_WinAPI_WriteFile($hFile, $tBuffer, 64, $nBytes)
			;~ EndIf
		Next

		_WinAPI_CloseHandle($hFile)
	EndFunc

	Func fn_Export_GOClick()
		If $g_iModelType = $MOD_NONE Then
			fn_MSG_box("No valid model loaded.")
			Return
		EndIf

		; backup file. dont overwrite if it exists
		If _IsChecked($UI_CBox_backup) Then
			Local $isOK = FileCopy($g_ImportFileName, string($g_ImportFileName&".backup"), 0)
			if Not $isOK And Not FileExists(string($g_ImportFileName&".backup")) Then
				fn_MSG_box("Can't write backup file.", "", 1)
				Return
			EndIf
		EndIf

		;if in/out names are differnt, make sure new file can be writen to
		;todo
		;~ if StringCompare($g_ImportFileName, $g_ExportFileName) Then
		;~ 	if Not FileCopy($g_ImportFileName, $g_ExportFileName, 1) Then
		;~ 		fn_MSG_box("Can't write output file.", "", 1)
		;~ 		Return
		;~ 	EndIf
		;~ EndIf

		Switch $g_iModelType
			Case $MOD_MDX
				fn_Export_MDX()
			Case $MOD_MD2
				fn_Export_MD2()
			Case $MOD_MDL
				fn_Export_MDL()
			Case $MOD_MD3
				fn_Export_MD3()
			;Case Else
		EndSwitch

		fn_MSG_box("Model Saved.")
		ConsoleWrite("+File Saved"&@CRLF)
	EndFunc

#EndRegion ;==> END

#Region ;==> GUI_MESSAGE_BOX
	Func fn_MSG_box($sLine1, $sLine2 = "", $pauseScript = 0)
		Local $aPos = WinGetPos ( $KPModelSkins )
		WinMove($GUI_msgbox, "", $aPos[0]+200, $aPos[1]+200)
		GUICtrlSetData($UI_label_msgBox1, $sLine1)
		GUICtrlSetData($UI_label_msgBox2, $sLine2)
		GUISetState(@SW_DISABLE,$KPModelSkins)
		GUISetState(@SW_SHOW,$GUI_msgbox)

		if ($pauseScript = 1) Then
			$isActive_msgBox = 1
			Opt("GUIOnEventMode", 0)
			While ($isActive_msgBox = 1)
				Switch (GUIGetMsg())
					Case $GUI_EVENT_CLOSE
						Form1_msgboxClose()
					Case $UI_Btn_msgBox
						Form1_msgboxClose()
				EndSwitch
				Sleep(20)
			WEnd
			Opt("GUIOnEventMode", 1)
		EndIf
	EndFunc

	Func Form1_msgboxClose()
		GUISetState(@SW_HIDE, $GUI_msgbox)
		GUISetState(@SW_ENABLE, $KPModelSkins )
		GUISetState(@SW_RESTORE, $KPModelSkins)
		$isActive_msgBox = 0
	EndFunc
#EndRegion ;==> END GUI_MESSAGE_BOX

#Region ;==> SKIN_CHOOSER_BUTTONS
	Func SetSkin($hw)
		GUICtrlSetData($hw, fn_OpenFile_GetSkinName(GUICtrlRead($hw)))
	EndFunc

	Func btn_skinClicked()
		Local $btnID = @GUI_CtrlId
		ConsoleWrite('btn:'&$btnID&@CRLF)
		For $i = 0 To $iMAXSKIN -1
			if $UI_btn_browsSkins[$i] = $btnID Then
				SetSkin($UI_in_skins[$i])
				ExitLoop
			EndIf
		Next
	EndFunc

#EndRegion ;==> END SKIN_CHOOSER_BUTTONS

#Region ;==> SKIN_TAB
	;buttons

	Func fn_TrimFilePath($fileTempName)
		;clean up filename when importing to UI
		Local $bFound = False, $idx
		local const $knownPath[] = ["models\", "players\", "textures\", "sprites\", "pics\"]

		For $name In $knownPath
			$idx = StringInStr($fileTempName, $name)
			if $idx Then
				$fileTempName = StringMid($fileTempName, $idx)
				$bFound = True
				ExitLoop
			EndIf
		Next

		If not $bFound Then
			For $i = 0 To UBound($g_aModelData) -1
				$idx = StringInStr($fileTempName, $g_aModelData[$i][0]&"\")
				if $idx Then
					$fileTempName = StringMid($fileTempName, StringLen($g_aModelData[$i][0])+$idx+1)
					$idx = StringInStr($fileTempName, "\", 0, 2) ;strip mod path
					$fileTempName = StringMid($fileTempName, $idx+1)
					ExitLoop
				EndIf
			Next
		EndIf

		Return StringReplace($fileTempName, "\", "/")

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

	Func fn_ProcessInputSkins(ByRef $aSkins)
		Local $iCount = 0, $sTmp
		For $i = 0 to $iMAXSKIN - 1
			$sTmp = GUICtrlRead($UI_in_skins[$i])
			If $sTmp <> "" Then
				$aSkins[$iCount] = StringMid($sTmp, 1, 63) ;$g_aSkins ;null terminated
				$iCount += 1
			EndIf
		Next
		Return $iCount
	EndFunc

	Func fn_ResetSkinInput()
		Local $aSkins[$iMAXSKIN]
		for $i = 0 to $iMAXSKIN -1
			$aSkins[$i] = ""
		Next

		fn_UIFill_SkinInput($aSkins, $iMAXSKIN)
	EndFunc

	Func btn_clearClick()
		fn_ResetSkinInput()
	EndFunc

#EndRegion ;==> END SKIN_TAB

#Region ;==> SPRITES_TAB

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

	Func fn_MDXSfx_FramesToBits($aFrameRange, ByRef $sFrames)
		local $fNum = 0, $aFrames[1024], $start, $end, $iVal
		For $i = 0 To 9
			$start = $aFrameRange[$i][0]
			$end   = $aFrameRange[$i][1]
			if $start >= 0 And $start < 2024 And $end >= 0 And $end < 2024 Then
				For $j = $start To $end
					$aFrames[$j] = 1
				Next
			EndIf
		Next

		For $iI = 0 to 127 ;($COUNT_SFX_FRAMES/8)-1  ;frame to show sfx. 1024(128*8)
			$iVal = 0
			For $j = 0 To 7
				if ($aFrames[$fNum+$j] = 1) Then ;aSFXFrames
					$iVal = BitOR($iVal, BitShift(128, $j)) ;write bits backwards
				EndIf
			Next
			$fNum += 8
			$sFrames &= hex($iVal, 2)
		Next
	EndFunc

	Func UI_Cbox_MDXSfxClick()
		If ($g_iModelType = $MOD_MDX) Then
			Local $numSfxDef = $g_aHeaderData[$HDR_MDX_NUM_SFX_DEF]
			Local $numSfxEnt = $g_aHeaderData[$HDR_MDX_NUM_SFX_ENT]

			If _IsChecked($UI_Cbox_MDXSfx) Then
				if (($numSfxEnt = 0) And ($numSfxDef = 0)) Then
					GUICtrlSetState($UI_Cbox_MDXSfx, $GUI_UNCHECKED)
				EndIf
			Else
				GUICtrlSetState($UI_Cbox_MDXSfx, $GUI_CHECKED)
			EndIf
		Else
			GUICtrlSetState($UI_Cbox_MDXSfx, $GUI_UNCHECKED)
		EndIf
	EndFunc

	Func fn_Reset_SpriteTab_Data()
		For $i = 0 To 19
			fn_MDX_SFX_SetUI($i, $g_aMDX_sprite_cfg[$i][$SPR_MDX_VALUE])
		Next

		;frames
		GuiCtrlSetData($UI_In_frStart[0], "8")
		GuiCtrlSetData($UI_In_frEnd[0], "8")
		For $i = 1 To 9
			GuiCtrlSetData($UI_In_frStart[$i], "-1")
			GuiCtrlSetData($UI_In_frEnd[$i], "-1")
		Next
		;sprite flag
		For $i = 0 To $COUNT_FLAGS -1
			GUICtrlSetState($UI_Cbox_flags[$i], $GUI_UNCHECKED)
		Next

		;sprite image reset
		Combo1_SFX_TypeChange()
	EndFunc

	Func fn_setUI_PCT($hw, $data)
		GuiCtrlSetData($hw, int($data * 100))
	EndFunc
	Func fn_setUI_INT($hw, $data)
		GuiCtrlSetData($hw, $data)
	EndFunc
	Func fn_setUI_FLOAT($hw, $data)
		GuiCtrlSetData($hw, StringFormat("%.2f", $data))
	EndFunc
	Func fn_setUI_COMBO($hw, $data)
		_GUICtrlComboBox_SetCurSel($hw, int(Number($data)))
	EndFunc
	Func fn_setUI_SPRITE($hw, $data)
		local $idx = int(Number($data)), $found = False
		For $i = 0 To $COUNT_SFX_TYPE -1
			if $g_aMDXSFX_sprite_Cfg[$i][0] = $idx Then
				$idx = $i
				$found = True
				ExitLoop
			EndIf
		Next
		if $found = False Then
			$idx = 30
		EndIf
		_GUICtrlComboBox_SetCurSel($hw, $idx)
	EndFunc
	Func fn_setUI_FRAMES($data)
		Local $len = UBound($data)
		if IsArray($data) Then
			ConsoleWrite("- fn_setUI_FRAMES is array"&@CRLF)
			For $i = 0 To 9
				GuiCtrlSetData($UI_In_frStart[$i], $data[$i][0])
				GuiCtrlSetData($UI_In_frEnd[$i],   $data[$i][1])
			Next
		Else
			ConsoleWrite("- fn_setUI_FRAMES not array"&@CRLF)
			For $i = 0 To 9
				GuiCtrlSetData($UI_In_frStart[$i], '-1')
				GuiCtrlSetData($UI_In_frEnd[$i],   '-1')
			Next
		EndIf
	EndFunc

	Func fn_MDX_SFX_SetUI($idx, ByRef $value)
		Local $hw = $g_aMDX_sprite_cfg[$idx][$SPR_MDX_HW]
		Local $type = $g_aMDX_sprite_cfg[$idx][$SPR_MDX_TYPE]

		Switch $type
			Case $SP_TYPE_PCT
				fn_setUI_PCT($hw, $value) ;convert 0-1 to 0-100
			Case $SP_TYPE_INT, $SP_TYPE_FLG
				fn_setUI_INT($hw, $value)
			Case $SP_TYPE_FLT
				fn_setUI_FLOAT($hw, $value)
			Case $SP_TYPE_CBO
				fn_setUI_COMBO($hw, $value)
			Case $SP_TYPE_SPR
				fn_setUI_SPRITE($hw, $value) ;convert to dropdown
			Case $SP_TYPE_BYT
				fn_setUI_FRAMES($value)
		EndSwitch
	EndFunc


	Func fn_getMDX_SfxDef_fromLump(ByRef $lumpData, $count)
		Local $aRet[17]
		Local $iNum, $iSFXType_idx = 30 ;default pistol
		Local $numSfxDef = $g_aHeaderData[$HDR_MDX_NUM_SFX_DEF]

		if $numSfxDef < 1 Then Return $aRet
		if $numSfxDef > 1 Then fn_MSG_box(	"Multiple sprite defined.", "Using first index.", 1)

		;ConsoleWrite("-data:"&$lumpData&@CRLF)
		;SFX Type (#0). find matching sprite id
		$aRet[$MDX_SP_DEF_0_TYPE] = 30 ;default pistol sprite
		$iNum = fn_MDX_SFXDef_readLumpData($lumpData, $MDX_SP_DEF_0_TYPE) ;todo move to func
		For $iI = 0 to $COUNT_SFX_TYPE -1
			if $iNum = $g_aMDXSFX_sprite_Cfg[$iI][0] Then
				$aRet[$MDX_SP_DEF_0_TYPE] = $iI
				ExitLoop
			EndIf
		Next
		;$sfx_define,
		For $i = 1 To 16 ;$COUNT_MDX_SP -1
			$aRet[$i] = fn_MDX_SFXDef_readLumpData($lumpData, $i)
			;ConsoleWrite(">idx:"&$i&" dat="&$aRet[$i]&" sec:"&StringMid($lumpData, $i*8+1, 8)&@CRLF)
		Next
		Return $aRet
	EndFunc

	Func fn_getMDX_SfxEnt_fromLump(ByRef $lumpData, $count)
		Local $aRet[4], $sFrData, $aRetFrames[10][2], $fIdx=0, $iI = 0, $iOff = 0, $byte, $aFrames[$COUNT_SFX_FRAMES]
		Local $numSfxEnt = $g_aHeaderData[$HDR_MDX_NUM_SFX_ENT]

		if $numSfxEnt < 1 Then Return
		if ($numSfxEnt > 1)  Then fn_MSG_box("Multiple sprite defined.", "Using first index.", 1)

		;$sfx_add
		For $i = 0 To $SFX_IDX_TYPE ; $MDX_SP_ENT_2_TYPE
			$aRet[$i] = fn_MDX_SFXEntry_readLumpData($lumpData, $MDX_SP_ENT_0_V_IDX + $i, $i)
		Next
		$sFrData = fn_MDX_SFXEntry_readLumpData($lumpData, $MDX_SP_ENT_3_FRAMES, $SFX_FRAMES, 128)
		;ConsoleWrite(StringFormat("-frames:%s\n", $sFrData))
		;process hex byte data into full frame array.
		While $sFrData <> ""
			$byte = StringLeft($sFrData, 2) ; get hex byte
			For $j = 0 To 7
				if BitAND(Dec($byte), BitShift(128, $j)) Then ;read bits backwards
					$aFrames[$iOff+$j] = 1
				EndIf
			Next
			$sFrData = StringTrimLeft($sFrData, 2)
			$iOff += 8
		WEnd

		;get frame usage for 10 input boxes
		While ($iI < $COUNT_SFX_FRAMES And $fIdx < 10)
			if ($aFrames[$iI]) Then
				$aRetFrames[$fIdx][0] = $iI
				While ( $iI < $COUNT_SFX_FRAMES and $aFrames[$iI])
					$aRetFrames[$fIdx][1] = $iI ;set end time
					$iI+= 1
				WEnd
				$fIdx += 1
			EndIf
			$iI+= 1
		WEnd
		;fix any missing data
		For $i = $fIdx To 9
			$aRetFrames[$i][0] = -1
			$aRetFrames[$i][1] = -1
		Next
		$aRet[3] = $aRetFrames
		$aRet[1] =  0 ; force 'Define Index' ;todo configure?
		Return $aRet
	EndFunc

	Func fn_getMD2_Scale_fromLump(ByRef $lumpData)
		return fn_getMDX_Scale_fromLump($lumpData) ;dupe
	EndFunc
	Func fn_getMDX_Scale_fromLump(ByRef $lumpData)
		Local $aRet[6]

		For $i = 0 To 5
			$aRet[$i] = fn_readLump_FLOAT($lumpData, $i*8 +1) ; 1-based
		Next
		Return $aRet
	EndFunc

	Func fn_readInput_PERCENT($hw)
		return Number(GUICtrlRead($hw)) / 100.0
	EndFunc
	Func fn_readInput_INT($hw)
		return int(GUICtrlRead($hw))
	EndFunc
	Func fn_readInput_FLOAT($hw)
		return number(GUICtrlRead($hw))
	EndFunc
	Func fn_readInput_COMBO($hw)
		return  _GUICtrlComboBox_GetCurSel($hw)
	EndFunc

	Func fn_MDX_SFX_readUIData($idx)
		Local $type = $g_aMDX_sprite_cfg[$idx][$SPR_MDX_TYPE]
		Local $hw = $g_aMDX_sprite_cfg[$idx][$SPR_MDX_HW]

		Switch $type
			Case $SP_TYPE_PCT
				Return fn_readInput_PERCENT($hw) ;convert back to float
			Case $SP_TYPE_INT, $SP_TYPE_FLG
				Return fn_readInput_INT($hw)
			Case $SP_TYPE_FLT
				Return fn_readInput_FLOAT($hw)
			Case $SP_TYPE_CBO, $SP_TYPE_SPR
				Return fn_readInput_COMBO($hw)
		EndSwitch
		Return 0
	EndFunc

	Func fn_readLump_SHORT(ByRef $lump, $idx)
		return _WinAPI_SwapWord(Dec(StringMid($lump, $idx, 4)))
	EndFunc
	Func fn_readLump_INT(ByRef $lump, $idx)
		return _WinAPI_SwapDWord(Dec(StringMid($lump, $idx, 8)))
	EndFunc
	Func fn_readLump_FLOAT(ByRef $lump, $idx)
		return _WinAPI_IntToFloat(_WinAPI_SwapDWord(Dec(StringMid($lump, $idx, 8))))
	EndFunc
	Func fn_readLump_COMBO(ByRef $lump, $idx)
		return _WinAPI_SwapDWord(Dec(StringMid($lump, $idx, 8)))
	EndFunc
	Func fn_readLump_BYTES(ByRef $lump, $idx, $size)
		;~ return _HexToString(StringMid($lump, $idx, $size)) ;todo check this
		return StringMid($lump, $idx, $size) ;todo check this
	EndFunc
	;mdx sprite
	Func fn_MDX_SFXDef_readLumpData(ByRef $lump, $idx, $size=0)
		Switch $g_aMDX_sprite_cfg[$idx][$SPR_MDX_TYPE] ;get type from config array
			Case $SP_TYPE_INT, $SP_TYPE_FLG
				Return fn_readLump_INT($lump, $idx*8+1) ;*8 converts index to 4b*2(hex chr)
			Case $SP_TYPE_FLT, $SP_TYPE_PCT
				Return fn_readLump_FLOAT($lump, $idx*8+1)
			Case $SP_TYPE_CBO, $SP_TYPE_SPR
				Return fn_readLump_COMBO($lump, $idx*8+1)
			Case $SP_TYPE_BYT
				Return fn_readLump_BYTES($lump, $idx*8+1, $size) ;todo
		EndSwitch
		Return 0
	EndFunc
	Func fn_MDX_SFXEntry_readLumpData(ByRef $lump, $idx, $offset, $size=0)
		Switch $g_aMDX_sprite_cfg[$idx][$SPR_MDX_TYPE] ;get type from config array
			Case $SP_TYPE_INT, $SP_TYPE_FLG
				Return fn_readLump_INT($lump, $offset*8+1) ;*8 converts index to 4b*2(hex chr)
			Case $SP_TYPE_FLT, $SP_TYPE_PCT
				Return fn_readLump_FLOAT($lump, $offset*8+1) ;+1=string 1-based
			Case $SP_TYPE_CBO, $SP_TYPE_SPR
				Return fn_readLump_COMBO($lump, $offset*8+1)
			Case $SP_TYPE_BYT
				Return fn_readLump_BYTES($lump, $offset*8+1, $size) ;todo
		EndSwitch
		Return 0
	EndFunc
	Func fn_MDX_SFX_convertSpriteIndex($index)
		; fix sprite index to match kingpin define
		ConsoleWrite("$index"&$index&@CRLF)
		if $index < 0 Then
			$index = 0
			ConsoleWrite("!error idx:"&$index&@CRLF)
		ElseIf $index >= 49 Then
			$index = 49
			ConsoleWrite("!error idx:"&$index&@CRLF)
		EndIf

		Return $g_aMDXSFX_sprite_Cfg[$index][0] ;$g_aSFX_def
	EndFunc

	;retreve sprite data fron UI. before saving qdt/mdx
	Func fn_MDX_ReadSpriteTab_Data(ByRef $aDefData, ByRef $aEntryData, ByRef $aFrameRange)
		;$sfx_define
		For $i = 0 To $MDX_SP_DEF_16_RAND_WH
			$aDefData[$i] = fn_MDX_SFX_readUIData($i) ;read UI
		Next
		local $idx = $aDefData[$MDX_SP_DEF_0_TYPE]
		ConsoleWrite("id:"&$idx&@CRLF)
		$aDefData[$MDX_SP_DEF_0_TYPE] = fn_MDX_SFX_convertSpriteIndex($aDefData[$MDX_SP_DEF_0_TYPE]); fix sprite index to match kingpin

		;$sfx_add
		For $i = 0  To 2 ; $MDX_SP_ENT_0_V_IDX ; $MDX_SP_ENT_2_TYPE
			$aEntryData[$i] = fn_MDX_SFX_ReadUIData($MDX_SP_ENT_0_V_IDX + $i)
		Next

		;frame range to show effect from input boxes
		For $i = 0 To 9
			$aFrameRange[$i][0] = fn_readInput_INT($UI_In_frStart[$i])
			$aFrameRange[$i][1] = fn_readInput_INT($UI_In_frEnd[$i])
		Next
	EndFunc

	Func fn_range($val, $min, $max)
		If $val > $max Then
			$val = $max
		ElseIf $val < $min Then
			$val = $min
		EndIf
		Return $val
	EndFunc

	Func fn_stringClearComments($sData)
		local $idx = StringInStr($sData, "//")
		if $idx Then
			Return StringMid($sData, 1, $idx-1)
		Else
			Return $sData
		EndIf
	EndFunc

	Func fn_tokenizeSFX_def(ByRef $aRet, $iArraySize, $data)
		local $wasNum = 0, $iIdx = 0, $aTmp, $aNum, $iCount
		$data = StringStripWS($data, 3)
		$data = StringRegExpReplace($data, "[^\S]+", " ")
		if not @error Then
			$aNum = StringRegExp($data, "[\d\.]+", $STR_REGEXPARRAYGLOBALMATCH)
			if not @error Then
				$iCount = UBound($aNum)
				For $i = 0 To $iArraySize -1
					If $i < $iCount Then
						$aRet[$i] = $aNum[$i]
					Else
						$aRet[$i] = 0 ;invalid. fill with zero
					EndIf
				Next
				Return ;ok
			EndIf
		EndIf

		;error
		For $i = 0 To $iArraySize -1
			$aRet[$i] = 0
		Next
	EndFunc

	Func fn_tokenizeSFX_entry(ByRef $aRet, $iArraySize, $data)
		local $wasNum = 0, $iIdx = 0, $aTmp, $aNum, $iCount, $start, $end
		;defaults?
		$aRet[0] = 0
		$aRet[1] = 0
		$aRet[2] = 0
		$aRet[3] = Null

		$data = StringStripWS($data, 3)
		$data = StringRegExpReplace($data, "[^\S]+", " ")
		if not @error Then
			$aNum = StringRegExp($data, "[\d\.]+", $STR_REGEXPARRAYGLOBALMATCH)
			if not @error and UBound($aNum) > 2 Then
				;get first 3 entries
				$aRet[0] = $aNum[0]
				$aRet[1] = $aNum[1]
				$aRet[2] = $aNum[2]
			EndIf

			;get <from>-<to> frame ranges
			$aNum = StringRegExp($data, "(\d+)\s-\s(\d+)", $STR_REGEXPARRAYGLOBALMATCH)
			if not @error Then
				Local $aFrame[10][2]
				$iCount = UBound($aNum) ;4
				For $i = 0 To 9
					If $iCount >($i*2+1) Then
						$start = fn_range(int($aNum[$i*2+0]), 0, 1023)
						$end   = fn_range(int($aNum[$i*2+1]), 0, 1023)
						$aFrame[$i][0] = $start
						$aFrame[$i][1] = $end
					Else
						$aFrame[$i][0] = -1
						$aFrame[$i][1] = -1
					EndIf
				Next
				$aRet[3] = $aFrame
			EndIf
		EndIf
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
				Local $idx, $iLen = UBound($aArray), $aSFXDef[$COUNT_SFX_DEF], $aSFXEntry[4]
				for $iI = 0 to $iLen -1
					;strip comments

					$aArray[$iI] = fn_stringClearComments($aArray[$iI])

					;find $sfx_define data
					$idx = StringInStr($aArray[$iI], "$sfx_define", 0, 1,1,11)
					if $idx then
						$iI += 1
						while $iI < $iLen And Not StringInStr($aArray[$iI], "$", 0, 1,1,1)
							$aArray[$iI] = fn_stringClearComments($aArray[$iI])
							$sfxDefineString &= string($aArray[$iI]& " ") ;space is delimiter
							$iI += 1
						WEnd
					EndIf

					;find sfx entry data
					$idx = StringInStr($aArray[$iI], "$sfx_add", 0, 1,1,8)
					if $idx then
						$iI += 1
						while $iI < $iLen And Not StringInStr($aArray[$iI], "$", 0, 1,1,1)
							$aArray[$iI] = fn_stringClearComments($aArray[$iI])
							$sfxAddString &= string($aArray[$iI]& " ") ;space is delimiter
							$iI += 1
						WEnd
						ContinueLoop
					EndIf
				Next

				ConsoleWrite(StringFormat("sfx1:%s\n", $sfxDefineString))
				ConsoleWrite(StringFormat("sfx2:%s\n", $sfxAddString))

				fn_tokenizeSFX_def($aSFXDef, $COUNT_SFX_DEF, $sfxDefineString)
				fn_tokenizeSFX_entry($aSFXEntry, 4, $sfxAddString)

				fn_UIFill_MDXSfxDef($aSFXDef, 1)
				fn_UIFill_MDXSfxEnt($aSFXEntry, 1)
			EndIf
		EndIf
	EndFunc

	Func fn_getFileNameInPath($sPath, ByRef $sOutFileName)
		Local $iIdx = StringInStr($sPath, "\",1, -1), $sOutTmp

		If $iIdx Then
			$sOutTmp = StringTrimLeft($sPath, $iIdx)
			ConsoleWrite("!outname1= "&$sOutTmp&@CRLF)
			$iIdx = StringInStr($sOutTmp, ".",1, -1)
			If $iIdx Then
				$sOutFileName = StringLeft($sOutTmp, $iIdx-1)
				ConsoleWrite("!outname2= "&$sOutFileName&@CRLF)
			EndIf
		EndIf
	EndFunc

	Func fn_Export_QDT()
		Local $sOutFileName = "TEST"
		Local $sOutTmp, $iIdx, $start, $end, $filePath
		Local Const $qdt_Hint_def[17] = [ _
			'// type (fire/smoke/blood)', _
			'// flags', _
			'// VEL_TYPE_UP (0=move up 1=vert dir)', _
			'// vel_speed', _
			'// gravity', _
			'// spawn interval, 2 = 0.1 seconds', _
			'// random spawn interval (sprite will be spawned 80% of the time)', _
			'// start alpha', _
			'// end alpha', _
			'// fadein time', _
			'// lifetime', _
			'// random time scale (fadein and lifetime will be multiplied by (x * 0.5), where x is a random number between -1 and 1', _
			'// start width', _
			'// end width', _
			'// start height', _
			'// end height', _
			'// random size scale (same as random time scale, but effects only sizes)' _
		]
		Local Const $qdt_Hint_entry[4] = [ _
			'// INDEX (assigned to the first vertex)', _
			'// uses the first sfx_define (above)', _
			'// tells the engine to use the above INDEX # is a 0=vertex / 1=Triangle', _
			'// 0-based frame ranges to enable the effect for <from - to> <from - to>' _
		]

		if Not ($g_iModelType = $MOD_MDX) And Not ($g_iModelType = $MOD_NONE) Then
			fn_MSG_box("Model not .mdx.")
			Return
		EndIf

		if ($g_ExportFileName <> "") Then
			fn_getFileNameInPath($g_ExportFileName, $sOutFileName)
		EndIf

		$filePath = FileSaveDialog("kingpin sprites .qdt", $fileOpenDialogPath, "Quake data file (*.qdt)|All files (*.*)", 0, $sOutFileName, $KPModelSkins)
		If  @error  Then
			fn_MSG_box("No file was saved.")
		Else
			Local $hFile = FileOpen($filePath, $FO_OVERWRITE + $FO_CREATEPATH+$FO_UTF8_NOBOM)
			If not ($hFile = -1) Then
				Local $sSfxText= '', $sFrameRng = "", $iI, $aDefData[17], $aEntryData[4], $aFrameRange[10][2]
				fn_SetCurrentFolder($filePath)

				;read sprite tab inputs
				fn_MDX_ReadSpriteTab_Data($aDefData, $aEntryData, $aFrameRange)

				;get file name
				if ($g_ExportFileName = "") Then
					fn_getFileNameInPath($filePath, $sOutFileName)
				EndIf

				;build frame string <start-end>
				For $iI = 0 to 9
					$start = $aFrameRange[$iI][0]
					$end   = $aFrameRange[$iI][1]
					If($start >= 0) and ($end >= 0) Then
						if $end < $start Then $end = $start
						$sFrameRng &= StringFormat("%i - %i ", $start, $end)
					EndIf
				Next

				;build export string
				$sSfxText = '' &@CRLF& _
					'// Add SFX to model' &@CRLF& _
					'$sfx_load ' &$sOutFileName&'   //.mdx to load' &@CRLF& _
					'' &@CRLF& _
					'$sfx_define // define. Index 0' & @CRLF
				For $i = 0 To 16
					$sSfxText &= StringFormat("%-11s %s\n", $aDefData[$i], $qdt_Hint_def[$i]) ;$g_aSFX_def
				Next
				$sSfxText &= '' &@CRLF& _
					'$sfx_add    //sfx entry' &@CRLF
				For $i = 0 To 2
					$sSfxText &= StringFormat("%-11s %s\n", $aEntryData[$i], $qdt_Hint_entry[$i]) ;$g_aSFX_entry
				Next
				$sSfxText &= StringFormat("%s   %s\n\n", $sFrameRng, $qdt_Hint_entry[3]) ;framews
				$sSfxText &= '$sfx_save ' &$sOutFileName& '   //.mdx to save' &@CRLF& ' '

				FileWrite($hFile, $sSfxText)
				FileClose($hFile)
				fn_MSG_box("File saved.")
			EndIf
		EndIf
	EndFunc

	Func Combo1_SFX_TypeChange()
		_ResourceSetImageToCtrl($UI_Img_sprite,"spr_" & _GUICtrlComboBox_GetCurSel($g_aMDX_sprite_cfg[$MDX_SP_DEF_0_TYPE][$SPR_MDX_HW])) ;$Combo1_SFX_Type
	EndFunc
#EndRegion ;==> END SPRITES_TAB


#Region ;==> GUI_FLAGS (SPRITE TAB. SFX flags)
	Func GUI_Flags_GetInput_CtrlID()
		Switch $g_iModelType
			Case $MOD_MDX
				return $g_aMDX_sprite_cfg[$MDX_SP_DEF_1_FLAGS][$SPR_MDX_HW] ;$Input1_flags
			Case $MOD_MDL
				return $Input1_flags_mdl
			Case Else
				Return -1
				;todo add game
		EndSwitch
	EndFunc

	Func GUI_Flags_SetCheked()
		Local $iFlag = 0, $value
		Local $hw = GUI_Flags_GetInput_CtrlID()
		if $hw = -1 Then
			 Return
		EndIf
		$value = int(Number(GUICtrlRead($hw)))

		For $i = 0 To $COUNT_FLAGS - 1
			If BitAND($value, bitshift(1, -$i)) Then
				GUICtrlSetState($UI_Cbox_flags[$i], $GUI_CHECKED)
			EndIf
		Next
	EndFunc

	Func Button_flagsClick()
		Local $aPos = WinGetPos($KPModelSkins)
		GUI_Flags_SetCBoxLable($g_iModelType) ;set names
		WinMove($GUI_DMFlags, "", $aPos[0]+5, $aPos[1]+28) ;from left,  from top
		GUI_Flags_SetCheked()
		$g_isPopupActive = True
		GUISetState(@SW_SHOW, $GUI_DMFlags)
	EndFunc

	Func DMFLAGSClose()
		GUISetState(@SW_HIDE, $GUI_DMFlags)
		$g_isPopupActive = False
		GUI_Flags_GetCheked()
	EndFunc

	Func Button_flags_mdlClick()
		Button_flagsClick()
	EndFunc

	Func GUI_Flags_GetCheked()
		Local $iFlag = 0
		Local $hw = GUI_Flags_GetInput_CtrlID()
		if $hw = -1 Then
			Return
		EndIf

		For $i = 0 To $COUNT_FLAGS - 1
			If _IsChecked($UI_Cbox_flags[$i]) Then
				$iFlag = BitOR($iFlag, bitshift(1, -$i))
			EndIf
		Next
		GUICtrlSetData($hw,  $iFlag)
	EndFunc

#EndRegion ;==> END GUI_FLAGS (SPRITE TAB. SFX flags)

GUIRegisterMsg($WM_SYSCOMMAND, "On_WM_SYSCOMMAND")
Func On_WM_SYSCOMMAND($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $lParam
	Local Const $SC_MOVE = 0xF010

	If $hWnd = $KPModelSkins And BitAND($wParam, 0xFFF0) = $SC_MOVE Then
		if $g_isPopupActive = True Then
			Return False ;stop movemeant of parent
		EndIf
	EndIf

	Return $GUI_RUNDEFMSG
EndFunc

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
			$tmpScale[$i] = Number(GUICtrlRead($UI_in_scale[$i]), $NUMBER_DOUBLE)
		Next

		$xTotal = ($tmpScale[0] - $tmpScale[3]) / 2.0
		$yTotal = ($tmpScale[1] - $tmpScale[4]) / 2.0
		$zTotal = ($tmpScale[2] - $tmpScale[5]) / 2.0

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
		GUICtrlSetState($UI_CBox_scale, $GUI_UNCHECKED)
		fn_Set_ScaleInput()
	EndFunc

	fn_Set_ScaleInput() ;init
	Func fn_Set_ScaleInput()
		if _IsChecked($UI_CBox_scale) Then
			For $i = 0 To 5
				;GUICtrlSetState($UI_in_scale[$i], $GUI_ENABLE)
				_GUICtrlEdit_SetReadOnly($UI_in_scale[$i], False)
			Next
			GUICtrlSetState($UI_Btn_scaleCentre, $GUI_ENABLE)
			GUICtrlSetState($UI_Btn_scaleDrop, $GUI_ENABLE)
		Else
			For $i = 0 To 5
				;GUICtrlSetState($UI_in_scale[$i], $GUI_DISABLE)
				_GUICtrlEdit_SetReadOnly($UI_in_scale[$i], True)
			Next
			GUICtrlSetState($UI_Btn_scaleCentre, $GUI_DISABLE)
			GUICtrlSetState($UI_Btn_scaleDrop, $GUI_DISABLE)
		EndIf
	EndFunc

	Func fn_SetUI_Scale($aScale)
		GUICtrlSetData($UI_in_scale[0], StringFormat("%.8f", $aScale[3] + ($aScale[0]*255.0)))
		GUICtrlSetData($UI_in_scale[1], StringFormat("%.8f", $aScale[4] + ($aScale[1]*255.0)))
		GUICtrlSetData($UI_in_scale[2], StringFormat("%.8f", $aScale[5] + ($aScale[2]*255.0)))
		GUICtrlSetData($UI_in_scale[3], StringFormat("%.8f", $aScale[3]))
		GUICtrlSetData($UI_in_scale[4], StringFormat("%.8f", $aScale[4]))
		GUICtrlSetData($UI_in_scale[5], StringFormat("%.8f", $aScale[5]))
	EndFunc

	Func fn_GetUI_Scale()
		Local $tmpScale[6], $ret[6]
		For $i = 0 To 5
			$tmpScale[$i] = Number(GUICtrlRead($UI_in_scale[$i]), $NUMBER_DOUBLE)
		Next
		$ret[0] = ($tmpScale[0] - $tmpScale[3]) * 0.003921568627451
		$ret[1] = ($tmpScale[1] - $tmpScale[4]) * 0.003921568627451
		$ret[2] = ($tmpScale[2] - $tmpScale[5]) * 0.003921568627451
		$ret[3] = $tmpScale[3]
		$ret[4] = $tmpScale[4]
		$ret[5] = $tmpScale[5]
		Return $ret
	EndFunc

#EndRegion ;==> END SCALE TAB

#Region ;==> ICON INCLUDE
	;todo convert to icon?
	_ResourceSetImageToCtrl($UI_Img_sprite,"spr_31")
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
#EndRegion  ;==> END ICON INCLUDE


While 1
	Sleep(100)
WEnd
