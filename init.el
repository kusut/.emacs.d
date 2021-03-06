;;; init.el --- This is where the magic begins
;;; Commentary:
;;; Code:

(add-to-list 'load-path "~/.emacs.d/")

(require 'ido)
(ido-mode t)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq ring-bell-function 'ignore)
(setq frame-title-format "emacs")
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
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))

(require 'melpa)
(require 'keys)
