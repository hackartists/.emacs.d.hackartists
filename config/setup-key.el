(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])

(global-unset-key [C-left])
(global-unset-key [C-right])
(global-unset-key [C-up])
(global-unset-key [C-down])
(global-unset-key (kbd "<C-t>"))
;;(global-set-key (kbd "`") 'keyboard-quit)
(global-set-key [C-up] 'windmove-up)
(global-set-key [C-down] 'windmove-down)
(global-set-key (kbd "<s-up>") 'windmove-up)
(global-set-key (kbd "<s-down>") 'windmove-down)
(global-set-key [C-left] 'windmove-left)
(global-set-key [C-right] 'windmove-right)
(global-set-key (kbd "<s-left>") 'windmove-left)
(global-set-key (kbd "<s-right>") 'windmove-right)
(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "S-SPC") 'toggle-input-method)
(global-set-key (kbd "C-SPC") 'company-complete)
(global-set-key (kbd "C-x g") 'magit-status)
;; (global-set-key (kbd "<home>") 'beginning-of-line-text)
(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)
(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET
(global-set-key (kbd "C-c C-h i") 'helm-semantic-or-imenu)

(global-set-key (kbd "s-c") 'cua-copy-region)
(global-set-key (kbd "s-v") 'cua-paste)
(global-set-key (kbd "s-x") 'cua-cut-region)
(global-set-key (kbd "s-k") 'kill-this-buffer)
(global-set-key (kbd "s-u") 'revert-buffer)
(global-set-key (kbd "s-a") 'mark-whole-buffer)

(global-set-key (kbd "<s-return>") 'yas-insert-snippet)
(add-hook 'shell-mode-hook (lambda()
                             (local-set-key (kbd "<C-up>") 'windmove-up)
                             (local-set-key (kbd "<C-down>") 'windmove-down)
                             ))

(add-hook 'eshell-mode-hook (lambda()
                             (local-set-key (kbd "<C-up>") 'windmove-up)
                             (local-set-key (kbd "<C-down>") 'windmove-down)
                             ))

(add-hook 'term-mode-hook (lambda()
                            ;;(define-key term-mode-map (kbd "C-t") 'helm-mt)
                            ;;(local-set-key (kbd "C-t") 'helm-mt)
                            (define-key term-raw-map (kbd "<prior>") 'term-pager-back-page)
                            (define-key term-raw-map (kbd "<next>") 'term-pager-page)
                            (define-key term-raw-map (kbd "C-t") 'helm-mt)
                            (define-key term-raw-map (kbd "C-v") 'term-paste)
                            (define-key term-raw-map (kbd "s-v") 'term-paste)
                            (define-key term-raw-map (kbd "M-c") 'term-line-mode)
                            (define-key term-mode-map (kbd "M-c") 'term-char-mode)
                            (define-key term-raw-map (kbd "<C-right>") 'windmove-right)
                            (define-key term-raw-map (kbd "<C-left>") 'windmove-left)
                            (define-key term-raw-map (kbd "<C-up>") 'windmove-up)
                            (define-key term-raw-map (kbd "<C-down>") 'windmove-down)
                            (define-key term-raw-map (kbd "<M-left>") 'term-send-backward-word)
                            (define-key term-raw-map (kbd "<M-right>") 'term-send-forward-word)
                            ))


(provide 'setup-key)
