(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/vendor/")
(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete/")
(add-to-list 'load-path "~/.emacs.d/vendor/nxhtml/")

(load "autostart")
(load "defaults")
(load "macros")
(load "keys")
(load "modes")

;(require 'boring)
;(boring)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete/ac-dict")
(ac-config-default)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'ido)
(ido-mode t)

(require 'autopair)
(autopair-global-mode)

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
      (list "~/.emacs.d/warden" (list local-file)))) 
  
  (add-to-list 'flymake-allowed-file-name-masks 
	       '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)
;;; end code checking
