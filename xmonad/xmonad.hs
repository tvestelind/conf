import XMonad
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig,
          layoutHook = avoidStruts  $  layoutHook defaultConfig,
          logHook = dynamicLogWithPP xmobarPP
              { ppOutput = hPutStrLn xmproc,
                ppTitle = xmobarColor "green" "" . shorten 50
              },
          borderWidth        = 1,
          terminal           = "xterm",
          normalBorderColor  = "#111111",
          focusedBorderColor = "#ff3333" }
