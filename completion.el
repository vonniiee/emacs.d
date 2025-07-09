(use-package vertico
  :custom
  (vertico-resize t)
  :init
  (vertico-mode)
  :ensure t)

(use-package savehist
  :init
  (savehist-mode)
  :ensure t)

(use-package marginalia
  :init
  (marginalia-mode)
  :ensure t)

(use-package consult
  :bind
  (("C-x b" . consult-buffer)
   ("C-c m" . consult-bookmark)

   ("M-s s" . consult-ripgrep)
   
   ("M-g g" . consult-goto-line)
   ("M-g M-g" . consult-goto-line))
  :ensure t)

(use-package embark
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :ensure t)

(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode)
  :ensure t)

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion))))
  :ensure t)
