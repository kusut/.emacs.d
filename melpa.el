;;; melpa.el --- Packaging related module
;;; Commentary:
;;; Code:

(require 'cl)
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(setq url-http-attempt-keepalives nil)

(defvar packages 
  '(
    flycheck
    groovy-mode
    haskell-mode
    ido-completing-read+
    js2-mode
    magit
    markdown-mode
    nginx-mode
    purescript-mode
    zenburn-theme
))

(defun fully-installed-p ()
  (loop for p in packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun get-packages ()
  (unless (fully-installed-p)
    (package-refresh-contents)
    (dolist (p packages)
      (unless (package-installed-p p)
        (package-install p)))))

(get-packages)

(when (package-installed-p 'ido-ubiquitous)
  (require 'ido-ubiquitous)
  (ido-ubiquitous-mode t))

(when (package-installed-p 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode)))

(when (package-installed-p 'purescript-mode)
  (require 'purescript-mode)
  (add-to-list 'auto-mode-alist '("\\.purs$" . purescript-mode))
  (add-hook 'purescript-mode-hook 'turn-on-purescript-indentation))

(when (package-installed-p 'zenburn-theme)
  (load-theme 'zenburn t))

(add-hook 'after-init-hook #'global-flycheck-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js-indent-level 2)
(setq groovy-indent-offset 2)
(provide 'melpa)
