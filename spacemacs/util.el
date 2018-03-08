(setq-default dotspacemacs-themes '(zenburn spacemacs-dark))
(setq racer-rust-src-path "/usr/local/rust/rustc-1.5.0/src")
(setq word-wrap t)
(with-eval-after-load 'projectile
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-directories "coverage"))
