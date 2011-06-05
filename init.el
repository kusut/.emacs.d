(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq-default truncate-lines t)
(global-set-key [f12] 'toggle-truncate-lines)

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

;;; pair
(add-hook 'python-mode-hook
	  (lambda ()
	    (define-key python-mode-map "\"" 'pair)
	    (define-key python-mode-map "\'" 'pair)
	    (define-key python-mode-map "(" 'pair)
	    (define-key python-mode-map "[" 'pair)
	    (define-key python-mode-map "{" 'pair)))
(defun pair ()
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))
