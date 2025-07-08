(setq exwm-randr-workspace-monitor-plist '(1 "eDP-1" 2 "eDP-2"))
(add-hook 'exwm-randr-screen-change-hook
	  (lambda ()
	    (start-process-shell-command
	     "xrandr" nil "xrandr --output eDP-1 --above eDP-2 --auto")))
(shell-command "xinput --map-to-output \"ELAN9008:00 04F3:4259\" \"eDP-1\"")
(shell-command "xinput --map-to-output \"ELAN9009:00 04F3:42EC\" \"eDP-2\"")

