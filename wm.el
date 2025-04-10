(use-package exwm)

(setq exwm-workspace-number 4)
(add-hook 'exwm-update-class-hook 
	  (lambda () (exwm-workspace-rename-buffer (if exwm-class-name
						       exwm-class-name
						     "shmeep"))))
(add-hook 'exwm-update-title-hook
	  (lambda () (exwm-workspace-rename-buffer (if exwm-class-name
						       exwm-class-name
						     "shmeep"))))

(setq exwm-input-global-keys
      `(([?\s-r] . exwm-reset) ;; s-r: Reset (to line-mode).
	([?\s-S] . (lambda ()
		     (interactive)
		     (shell-command "scrot --select - | copyq copy image/png -")))
        ([?\s-w] . exwm-workspace-switch) ;; s-w: Switch workspace.
        ([?\s-&] . (lambda (cmd) ;; s-&: Launch application.
                     (interactive (list (read-shell-command "$ ")))
                     (start-process-shell-command cmd nil cmd)))
        ;; s-N: Switch to certain workspace.
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "s-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,i))))
                  (number-sequence 0 9))
	,@(mapcar (lambda (i)
		    `(,(kbd (format "s-M-%d" i)) .
		      (lambda ()
			(interactive)
			(exwm-workspace-move-window ,i))))
		  (number-sequence 0 9))))

(setq exwm-randr-workspace-monitor-plist '(1 "eDP-1" 2 "eDP-2"))
(add-hook 'exwm-randr-screen-change-hook
	  (lambda ()
	    (start-process-shell-command
	     "xrandr" nil "xrandr --output eDP-1 --above eDP-2 --auto")))


(exwm-randr-mode 1)
