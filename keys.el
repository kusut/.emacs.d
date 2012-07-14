(fset 'pdb-trace "import pdb; pdb.set_trace()")
(global-set-key (kbd "M-t") 'pdb-trace)

(defun kill-region-or-backward-kill-word (&optional arg region)
  "`kill-region` if there is a region, otherwise `backward-kill-word`"
  (interactive (list (prefix-numeric-value current-prefix-arg) (use-region-p)))
  (if region 
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))
(global-set-key (kbd "C-w") 'kill-region-or-backward-kill-word)

(global-set-key [f12] 'toggle-truncate-lines)
(global-set-key [f11] 'django-nxhtml-mumamo-mode)
(global-set-key [f5] 'flymake-goto-prev-error)
(global-set-key [f6] 'flymake-goto-next-error)
(global-set-key (kbd "C-c i") 'magit-status)

