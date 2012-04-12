(fset 'pdb-trace "import pdb; pdb.set_trace()")

(defun kill-region-or-backward-kill-word (&optional arg region)
  "`kill-region` if there is a region, otherwise `backward-kill-word`"
  (interactive
   (list (prefix-numeric-value current-prefix-arg) (use-region-p))
  )
  (if region 
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)
  )
)
