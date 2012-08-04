(add-to-list 'load-path "~/.emacs.d/")

(require 'melpa)
(require 'keys)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'ido)
(ido-mode t)

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
