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

(use-package typst-ts-mode
  :straight '(:type git :host codeberg :repo "meow_king/typst-ts-mode")
  :config
  (setq typst-ts-watch-options "--open")
  :ensure t)

(use-package spade-mode
  :straight '(:type git :host sourcehut :repo "lucasklemmer/spade-mode")
  :ensure t)

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
