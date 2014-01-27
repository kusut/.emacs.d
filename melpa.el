(require 'cl)
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(setq url-http-attempt-keepalives nil)

(defvar packages 
  '(
    flymake-cursor
    flymake-python-pyflakes
    ido-ubiquitous
    jinja2-mode
    magit
    markdown-mode
    mmm-mako
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

(when (package-installed-p 'auto-complete)
  (require 'auto-complete-config)
  (ac-config-default))

(when (package-installed-p 'flymake-cursor)
  (require 'flymake-cursor))  

(when (package-installed-p 'flymake-python-pyflakes)
  (require 'flymake-python-pyflakes)
  (setq flymake-python-pyflakes-executable "~/.emacs.d/warden.py")
  (add-hook 'python-mode-hook 'flymake-python-pyflakes-load))

(when (package-installed-p 'ido-ubiquitous)
  (require 'ido-ubiquitous)
  (ido-ubiquitous-mode t))

(when (package-installed-p 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode)))

(when (package-installed-p 'mmm-mako)
  (require 'mmm-auto)
  (require 'mmm-mako)
  (setq mmm-global-mode 'maybe)
  (add-to-list 'auto-mode-alist '("\\.mako\\'" . html-mode))
  (mmm-add-mode-ext-class 'html-mode "\\.mako\\'" 'mako))

(when (package-installed-p 'zenburn-theme)
  (load-theme 'zenburn))

(provide 'melpa)
