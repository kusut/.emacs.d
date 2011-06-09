(let ((default-dir "~/.emacs.d/vendor/"))
  (add-to-list 'load-path default-dir)
  (normal-top-level-add-subdirs-to-load-path))

(setq backup-inhibited t)
(setq auto-save-default nil)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete/ac-dict")
(ac-config-default)

(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)


(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq-default truncate-lines t)
(global-set-key [f12] 'toggle-truncate-lines)


(require 'autopair)
(autopair-global-mode)

;;; code checking. requires pyflakes
(when (load "flymake" t) 
  (defun flymake-pyflakes-init () 
    (let* ((temp-file (flymake-init-create-temp-buffer-copy 
		       'flymake-create-temp-inplace)) 
	   (local-file (file-relative-name 
			temp-file 
			(file-name-directory buffer-file-name)))) 
      (list "pyflakes" (list local-file)))) 
  
  (add-to-list 'flymake-allowed-file-name-masks 
	       '("\\.py\\'" flymake-pyflakes-init))) 

(add-hook 'find-file-hook 'flymake-find-file-hook)
;;; end code checking
