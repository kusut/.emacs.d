;;; melpa.el --- Packaging related module
;;; Commentary:
;;; Code:

(require 'package)

;; HOTFIX for seq in magit
(defun seq-keep (function sequence)
  "Apply FUNCTION to SEQUENCE and return the list of all the non-nil results."
  (delq nil (seq-map function sequence)))


;; repo
(setq package-archives
      '(("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("MELPA Stable" . 1)
        ("MELPA"        . 4)))

;; setup
(package-initialize)
(setq-default url-http-attempt-keepalives nil)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-verbose t)
(setq package-install-upgrade-built-in t)

;; packages
(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))
(use-package groovy-mode
   :config
   (setq-default groovy-indent-offset 2))
(use-package haskell-mode)
(use-package ido-completing-read+ :ensure t :defer 1)
(use-package js2-mode
  :config
  (setq js-indent-level 2)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))
(use-package magit)
(use-package markdown-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode)))
(use-package nginx-mode)
(use-package zenburn-theme
  :ensure t
  :demand t
  :config
  (load-theme 'zenburn t))

(provide 'melpa)
;;; melpa.el ends here
