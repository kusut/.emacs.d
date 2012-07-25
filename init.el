(add-to-list 'load-path "~/.emacs.d/")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(require 'auto-complete-config)
(ac-config-default)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'ido)
(require 'ido-ubiquitous)
(ido-mode t)
(ido-ubiquitous-mode t)

(require 'flymake-cursor)
(require 'flymake-python-pyflakes)
(setq flymake-python-pyflakes-executable "~/.emacs.d/warden.py")
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

(load "defaults")
(load "macros")
(load "keys")
