(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-w") 'evil-delete-backward-word))
(with-eval-after-load 'helm
  (define-key helm-map (kbd "C-w") 'evil-delete-backward-word))

;;make kill backward word work in search buffer
(define-key isearch-mode-map (kbd "C-w") 'isearch-delete-char)
(define-key isearch-mode-map (kbd "C-p") 'isearch-yank-word-or-char)

(define-key evil-normal-state-map (kbd "C-i") 'evil-jump-forward)
(define-key evil-visual-state-map (kbd "C-i") 'evil-jump-forward)
(setq x-select-enable-clipboard t)

;; svenska chars map
(define-key evil-normal-state-map (kbd "ö") 'evil-repeat-find-char)
(define-key evil-visual-state-map (kbd "ö") 'evil-repeat-find-char)
(define-key evil-normal-state-map (kbd "Ö") 'evil-ex)
(define-key evil-visual-state-map (kbd "Ö") 'evil-ex)
(define-key evil-normal-state-map (kbd "ä") 'evil-goto-mark-line)
(define-key evil-visual-state-map (kbd "ä") 'evil-goto-mark-line)
(define-key evil-normal-state-map (kbd "Ä") 'evil-use-register)
(define-key evil-visual-state-map (kbd "Ä") 'evil-use-register)
(define-key evil-normal-state-map (kbd "Å") 'evil-backward-paragraph)
(define-key evil-visual-state-map (kbd "Å") 'evil-backward-paragraph)
(define-key evil-normal-state-map (kbd "¤") 'evil-end-of-line)
(define-key evil-visual-state-map (kbd "¤") 'evil-end-of-line)
(define-key evil-normal-state-map (kbd "-") 'evil-search-forward)
(define-key evil-visual-state-map (kbd "-") 'evil-search-forward)
(define-key evil-normal-state-map (kbd "_") 'evil-search-backward)
(define-key evil-visual-state-map (kbd "_") 'evil-search-backward)
(setq-default evil-escape-delay 0.5)

(load-file "~/dotfiles/spacemacs/evil-destroy.el")
(define-key evil-normal-state-map "s" 'evil-destroy)
(define-key evil-normal-state-map "S" 'evil-destroy-line)
(define-key evil-normal-state-map "c" 'evil-destroy-change)
(define-key evil-normal-state-map "x" 'evil-destroy-char)
(define-key evil-normal-state-map "X" 'evil-destroy-whole-line)
(define-key evil-normal-state-map "Y" 'evil-copy-to-end-of-line)
(define-key evil-visual-state-map "P" 'evil-destroy-paste-before)
(define-key evil-visual-state-map "p" 'evil-destroy-paste-before)
