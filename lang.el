(use-package yuck-mode
  :ensure t)

(use-package parinfer-rust-mode
  :hook yuck-mode
  :ensure t)

(use-package which-key
  :init (which-key-mode)
  :ensure t)

(use-package eglot
  :config
  (add-hook 'rustic-mode-hook 'eglot-ensure)
  (add-hook 'rust-mode-hook 'eglot-ensure)
  (keymap-global-set "C-c C-a" 'eglot-code-actions)
  :ensure t)

(use-package rust-mode
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
  :ensure t)

(use-package company
  :config (global-company-mode)
  :ensure t)

(setq lsp-rust-analyzer-check-all-targets nil)
