  (defmacro without-evil-mode (&rest do-this)
    ;; Check if evil-mode is on, and disable it temporarily
    `(let ((evil-mode-is-on (evil-mode?)))
      (if evil-mode-is-on
          (disable-evil-mode))
      (ignore-errors
        ,@do-this)
      (if evil-mode-is-on
          (enable-evil-mode))))

  (defmacro evil-mode? ()
    "Checks if evil-mode is active. Uses Evil's state to check."
    `evil-state)

  (defmacro disable-evil-mode ()
    "Disable evil-mode with visual cues."
    `(progn
      (evil-mode 0)
      (message "Evil mode disabled")))

  (defmacro enable-evil-mode ()
    "Enable evil-mode with visual cues."
    `(progn
      (evil-mode 1)
      (message "Evil mode enabled")))

  ;;;; Clipboard bypass

  ;; delete: char
  (evil-define-operator evil-destroy-char (beg end type register yank-handler)
    :motion evil-forward-char
    (evil-delete-char beg end type ?_))

  ;; delete: char (backwards)
  (evil-define-operator evil-destroy-backward-char (beg end type register yank-handler)
    :motion evil-forward-char
    (evil-delete-backward-char beg end type ?_))

  ;; delete: text object
  (evil-define-operator evil-destroy (beg end type register yank-handler)
    "Vim's 's' without clipboard."
    (evil-delete beg end type ?_ yank-handler))

  ;; delete: to end of line
  (evil-define-operator evil-destroy-line (beg end type register yank-handler)
    :motion nil
    :keep-visual t
    (interactive "<R><x>")
    (evil-delete-line beg end type ?_ yank-handler))

  ;; delete: whole line
  (evil-define-operator evil-destroy-whole-line (beg end type register yank-handler)
    :motion evil-line
    (interactive "<R><x>")
    (evil-delete-whole-line beg end type ?_ yank-handler))

  ;; change: text object
  (evil-define-operator evil-destroy-change (beg end type register yank-handler delete-func)
    (evil-change beg end type ?_ yank-handler delete-func))

  ;; paste: before
  (defun evil-destroy-paste-before ()
    (interactive)
    (without-evil-mode
      (delete-region (point) (mark))
      (evil-paste-before 1)))

  ;; paste: after
  (defun evil-destroy-paste-after ()
    (interactive)
    (without-evil-mode
      (delete-region (point) (mark))
      (evil-paste-after 1)))

  ;; paste: text object
  (evil-define-operator evil-destroy-replace (beg end type register yank-handler)
    (evil-destroy beg end type register yank-handler)
    (evil-paste-before 1 register))
