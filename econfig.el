(setq
 backup-by-copying t
 backup-directory-alist '(("." . "~/.emacs-saves/"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs-saves/")))

