(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/vendor/")
(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete/")
(add-to-list 'load-path "~/.emacs.d/vendor/nxhtml/")

(load "autostart")
(load "defaults")
(load "macros")
(load "keys")
(load "modes")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(load-theme 'zenburn t)

(require 'auto-complete-config)
(ac-config-default)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'ido)
(ido-mode t)

(require 'twittering-mode)
(setq twittering-use-master-password t)

(setq jabber-account-list '(("kusut@jabber.org") ))

;;; code checking. requires pyflakes, pep8
(require 'flymake-cursor)

(when (load "flymake" t) 
  (defun flymake-pyflakes-init () 
    (let* ((temp-file (flymake-init-create-temp-buffer-copy 
		       'flymake-create-temp-inplace)) 
	   (local-file (file-relative-name 
			temp-file 
			(file-name-directory buffer-file-name)))) 
      (list "~/.emacs.d/warden.py" (list local-file)))) 
  
  (add-to-list 'flymake-allowed-file-name-masks 
	       '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)
;;; end code checking
