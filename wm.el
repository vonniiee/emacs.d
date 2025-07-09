(use-package exwm)

(setq exwm-workspace-number 10)
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
        ([?\s-&] . (lambda () ;; s-&: Launch application.
                     (interactive)
                     (app-launcher-run-app)))
	([?\s-*] . (lambda (cmd)
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

;; I should probably find a way to split this sort of config based on which machine
;; I'm using. I only use exwm on my main laptop rn, but i could see myself using it if
;; I get a desktop in the future. Maybe something with /sys/devices/virtual/dmi/id/board_name
;; would work well for that. Actually fuck it i'll do that right now.
(load (include-name (concat "machine/" (s-trim (f-read "/sys/devices/virtual/dmi/id/board_name")))))

(exwm-randr-mode 1)

(use-package bluetooth
  :bind
  (("C-c b" . bluetooth-list-devices))
  :ensure t)

(use-package app-launcher
  :straight '(app-launcher :host github :repo "SebastienWae/app-launcher"))

(exwm-wm-mode)

