(use-package json-mode
  :requires ( flymake-json )
  )

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)
            (flymake-mode)
            ))

(provide 'setup-json)


