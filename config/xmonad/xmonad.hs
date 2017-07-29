import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.CopyWindow
import System.IO

myManageHook 		= composeAll
		               [ className =? "Gimp"       --> doFloat
		               , className =? "Vncviewer"  --> doFloat
		               ]

modShift 		= mod4Mask .|. shiftMask

myStartupHook		= foldr (>>) (return ())
				[ spawn "setxkbmap -layout gb"
				, spawn "feh --randomize --bg-fill /vagrant/config/background/*"
				]

myActiveBorderColour 	= "gray80"

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ defaultConfig
             { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
             , layoutHook = avoidStruts $ layoutHook defaultConfig
             , logHook = dynamicLogWithPP $ xmobarPP
                         { ppOutput = hPutStrLn xmproc
                         , ppTitle = xmobarColor "green" "" . shorten 50
                         }
             , modMask = mod4Mask
	     , startupHook = myStartupHook
	     , focusedBorderColor = myActiveBorderColour
             } `additionalKeys`
             [ ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
             , ((0, xK_Print), spawn "scrot")
             , ((modShift, xK_h), sendMessage ToggleStruts)

		-- Application Launching
             , ((mod4Mask, xK_c), spawn "code" >> return ())
             
		-- Power Control
--             , ((modShift, xK_l), spawn "gnome-screensaver-command -a" >> return ())
             , ((modShift, xK_End), spawn "sudo shutdown -h now" >> return ())
             , ((modShift, xK_Home), spawn "sudo shutdown -r now" >> return ())
             ]

