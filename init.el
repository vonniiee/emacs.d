(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(package-initialize)

(use-package vterm
  :ensure t)

(use-package free-keys
  :ensure t)

(use-package all-the-icons
  :if (display-graphic-p)
  :ensure t)

(use-package neotree
  :config (keymap-global-set "M-T" 'neotree-toggle)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  :ensure t)

;;(use-package restart-emacs
;;  :ensure t)
;; doesn't work in the terminal :(


(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(vterm symon)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
