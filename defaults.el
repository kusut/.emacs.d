(require 'cl)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(setq url-http-attempt-keepalives nil)

(defvar packages 
  '(
    auto-complete
    flymake-cursor
    flymake-python-pyflakes
    ido-ubiquitous
    jinja2-mode
    magit
    markdown-mode
    nginx-mode
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

(when (package-installed-p 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode)))

(when (package-installed-p 'zenburn-theme)
  (load-theme 'zenburn t)
  (custom-set-faces
   '(flymake-warnline ((((class color )) (:background "#4f4f4f" :weight normal :underline nil))))
   '(flymake-errline ((((class color )) (:background "#8c5353" :weight normal :underline nil))))))

(show-paren-mode t)
(setq backup-inhibited t)
(setq auto-save-default nil)
(global-font-lock-mode t)
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(add-to-list 'default-frame-alist '(font . "Monospace-10"))
(setq jabber-account-list '(("kusut@jabber.org")))

(provide 'defaults)
