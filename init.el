(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "6fc9e40b4375d9d8d0d9521505849ab4d04220ed470db0b78b700230da0a86c1" "b11edd2e0f97a0a7d5e66a9b82091b44431401ac394478beb44389cf54e6db28" default))
 '(package-selected-packages '(company flycheck vterm symon)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package vterm
  :ensure t)

(use-package free-keys
  :ensure t)

(use-package dimmer
  :config (dimmer-mode t)
  (dimmer-fraction 0.90)
  :ensure t)

(use-package mood-line
  :config
  (setq mood-line-glyph-alist mood-line-glyphs-fira-code)
  (setq mood-line-format mood-line-format-default-extended)
  (mood-line-mode)
  :ensure t)

;(use-package monokai-theme
;  :config (load-theme 'monokai t)
;  :ensure t)

;(use-package grandshell-theme
;  :config (load-theme 'grandshell t)
;  :ensure t)

;(use-package kaolin-themes
;  :config (load-theme 'kaolin-eclipse t)
;  :ensure t)

(use-package ef-themes
  :config (load-theme 'ef-cherie t)
  :ensure t)

(use-package all-the-icons
  :if (display-graphic-p)
  :ensure t)

(use-package neotree
  :config (keymap-global-set "M-T" 'neotree-toggle)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (neotree-toggle)
  :ensure t)

(use-package company
  :config (global-company-mode)
  :ensure t)

(use-package flycheck
  :init (global-flycheck-mode)
  :ensure t)

(use-package lsp-ui
  :config (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-position 'at-point)
  (keymap-global-set "M-B" 'lsp-ui-doc-focus-frame)
  (keymap-global-set "M-A" 'lsp-ui-doc-toggle)
  :ensure t)
(use-package lsp-mode
  :config (lsp-diagnostics-mode)
  :ensure t)

(use-package rustic
  :ensure t)


(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(display-time-mode 1)
(display-battery-mode 1)

;;(use-package restart-emacs
;;  :ensure t)
;; doesn't work in the terminal :(


(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))



