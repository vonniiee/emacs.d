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
   '("c2c63381042e2e4686166d5d59a09118017b39003e58732b31737deeed454f1c" "a49795828869471ffeeb3753c61e265a75b33fed7c7b7614ee17663f1ef4b3b0" "658f6e811d9972cf53b52b00fa050ef8b30290d901833510b8af7284fd52e333" "0c2cf3b28f43e091cd7e790a7d3bf761e18195e7c35f5d39b1a880f6bcb33377" "3b5bac2bef0c51a169be7e9b5f80414e662e5eb2e3e3cf126873325e9344d26e" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "6fc9e40b4375d9d8d0d9521505849ab4d04220ed470db0b78b700230da0a86c1" "b11edd2e0f97a0a7d5e66a9b82091b44431401ac394478beb44389cf54e6db28" default))
 '(package-selected-packages
   '(rg neotree all-the-icons which-key rustic lsp-mode lsp-ui ef-themes mood-line dimmer elcord company flycheck vterm symon)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package elcord
  :config (elcord-mode)
  :ensure t)

(use-package vterm
  :ensure t)

(use-package multi-vterm
  :config
  (keymap-global-unset "C-t")
  (keymap-global-set "C-t t" 'multi-vterm-dedicated-toggle)
  (keymap-global-set "C-t a" 'multi-vterm)
  (keymap-global-set "C-t n" 'multi-vterm-next)
  (keymap-global-set "C-t p" 'multi-vterm-prev)
  (keymap-global-set "C-t f" 'multi-vterm-project)
  :ensure t)

(use-package free-keys
  :ensure t)

(use-package dimmer
  :config (dimmer-mode t)
  (setq dimmer-fraction 0.70)
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
  :config (load-theme 'ef-bio t)
  :ensure t)

(use-package all-the-icons
  :if (display-graphic-p)
  :ensure t)

(use-package rg
  :config (rg-enable-default-bindings)
  :ensure t)

(use-package company
  :config (global-company-mode)
  :ensure t)

(use-package flycheck
  :init (global-flycheck-mode)
  :ensure t)

(use-package which-key
  :init (which-key-mode)
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
  :bind-keymap ("C-c e" . lsp-command-map)
  :config (lsp-diagnostics-mode)
  :ensure t)

(use-package rustic
  :ensure t)

(use-package org
  
  :ensure t)

(defun set-background-for-terminal (&optional frame)
  (or frame (setq frame (selected-frame)))
  "unsets the background color in terminal mode"
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)))
(add-hook 'after-make-frame-functions 'set-background-for-terminal)
(add-hook 'window-setup-hook 'set-background-for-terminal)

(setq lsp-rust-analyzer-check-all-targets nil)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(display-time-mode 1)
(display-battery-mode 1)

;;(use-package restart-emacs
;;  :ensure t)
;; doesn't work in the terminal :(


(when (fboundp 'windmove-default-keybindings)
(windmove-default-keybindings))

