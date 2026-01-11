(use-package tuareg
  :ensure t)

;(use-package ocaml-eglot
;  :ensure t
;  :after tuareg
;  :hook
;  (tuareg-mode . ocaml-eglot)
;  (ocaml-eglot . eglot-ensure))

(use-package yuck-mode
  :ensure t)

(use-package ein
  :ensure t)

(use-package parinfer-rust-mode
  :hook yuck-mode
  :ensure t)

(use-package which-key
  :init (which-key-mode)
  :ensure t)

(use-package eglot
  :defer t
  :config
  (add-hook 'rustic-mode-hook 'eglot-ensure)
  (keymap-global-set "C-c C-a" 'eglot-code-actions)
  :ensure t)

;this might error, so M-x typst-ts-mc-install-grammar if that happens.
;i don't want to include that command under :config, as it clones
;and builds the grammar on every launch, which is annoying. maybe
;i'll write something that detects if the grammar needs updating
;in the future...
(use-package typst-ts-mode
  :straight '(:type git :host codeberg :repo "meow_king/typst-ts-mode")
  :config
  (setq typst-ts-watch-options "--open")
  :ensure t)

;this package doesn't seem to work all that well. i'll have to write my own.
(use-package tip
  :straight '(:type git :host sourcehut :repo "mafty/tip")
  :config
  (setq tip-server-basedir (expand-file-name (concat user-emacs-directory "tip-server-py/")))
  (add-hook 'typst-ts-mode-hook 'tip-mode)
  :ensure t)

;(use-package spade-mode
;  :straight '(:type git :host sourcehut :repo "lucasklemmer/spade-mode")
; :ensure t)

(use-package websocket)
(use-package typst-preview
  :straight '(:type git :host github :repo "havarddj/typst-preview.el")
  :config
  (setq typst-preview-browser "chromium")
  :ensure t)

(use-package rustic
  :ensure t
  :config
  (setq rustic-lsp-client 'eglot)
  :custom
  (rustic-analyzer-command '("rustup" "run" "nightly" "rust-analyzer")))

(use-package company
  :config (global-company-mode)
  :ensure t)

(setq lsp-rust-analyzer-check-all-targets nil)

(use-package glsl-mode
  :ensure t)

(defun asm-mode-hook ()
  (local-unset-key (vector asm-comment-char))
  (electric-indent-local-mode)
  (setq indent-tabs-mode nil)

  (defun asm-calculate-indentation ()
    (or
     (and (looking-at "[.@_[:word:]]+:") 0)
   ;; Same thing for `;;;' comments.
   (and (looking-at "\\s<\\s<\\s<") 0)
   ;; %if nasm macro stuff goes to the left margin
   (and (looking-at "%") 0)
   (and (looking-at "c?global\\|section\\|default\\|align\\|INIT_..X") 0)
   ;; Simple `;' comments go to the comment-column
   ;(and (looking-at "\\s<\\(\\S<\\|\\'\\)") comment-column)
   ;; The rest goes at column 4
   (or 4)))
  )

(add-hook 'asm-mode-hook #'asm-mode-hook)
