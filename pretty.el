(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode 1)

(setq display-time-default-load-average nil)
(display-time-mode t)

(add-to-list 'default-frame-alist
	     '(vertical-scroll-bars . nil))

(display-time-mode 1)
(display-battery-mode 1)

;;(use-package mood-line
;;  :config
;;  (setq mood-line-glyph-alist mood-line-glyphs-fira-code)
;;  (setq mood-line-format mood-line-format-default-extended)
;;  (mood-line-mode)
;;  :ensure t)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :ensure t)

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-challenger-deep)
  :ensure t)

(use-package all-the-icons
  :if (display-graphic-p)
  :ensure t)

(use-package prism
  :straight '(:type git :host github :repo "alphapapa/prism.el")
  :ensure t)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
