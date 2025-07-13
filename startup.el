(defun random-list-element (list)
  (let* ((size (length list))
	 (index (random size)))
    (nth index list)))

(use-package enlight
  :custom
  (enlight-content
   (concat
    (propertize (random-list-element '("hiii :3" "Hi!" "heyy lol")) 'face 'highlight)
    "\n"
    (enlight-menu
     '(("Org Mode"
	("Agenda" (org-agenda nil " ") "a"))
       ("Other"
	("Terminal" (vterm) "t")
	("Projects" project-switch-project "p"))))))
  :ensure t)

(setq initial-buffer-choice #'enlight)
(setq inhibit-startup-screen t)
